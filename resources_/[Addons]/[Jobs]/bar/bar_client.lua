

local barIsInService = false



local spawnbarVehicleChoix = {}

local KEY_ENTER = 18

local KEY_UP = 96 -- N+

local KEY_DOWN = 97 -- N-

local KEY_CLOSE = 177

local bar_Blip = {}

local bar_nbbarInService = 0

local bar_nbbarDispo = 0



----

local bar_blipsTemp

local bar_markerBool = false

local existingVeh = nil



isbar = false



local TEXTbar = {

    SpawnVehicleImpossible = '~R~ Impossible, aucune place disponible.',    

}

-- restart ambu

bar_platesuffix = "bar" --Suffix de la plaque d'imat

bar_car = {

	x=-562.6734619,  

	y=302.081512,

	z=83.160522,

	h=0.0,

OverPowered=15.0,

}



bar_blips = {

	["Bar"] = {

		id=93,

		x=93.72543,

		y=-1291.859,

		z=29.26874,

		distanceBetweenCoords=2,

		distanceMarker=2,

	},



	["Reserve"] = {

		id=93,

		x=128.996,  

		y=-1281.3494,

		z=28.2695,

		distanceBetweenCoords=2,

		distanceMarker=2

	},

}



local reserveCoords =

{

	{x=129.4082, y=-1281.671, z=28.26953}, -- Unicorn

	{x=-1577.098, y=-3018.158, z=-80.0059}, -- The Palace

	{x=-1583.153, y=-3014.016, z=-77.00497}, -- The Palace up

	{x=-561.8578, y=289.3438, z=81.17638}, -- Tequilala

	{x=-1381.824, y=-632.5981, z=29.81956}, -- Bahamamas

}



local serviceCoords =

{

	{x=-1581.447, y=-3018.439, z=-80.00595}, -- The Palace

	{x=93.73177, y=-1291.785, z=28.26875}, -- Unicorn

	{x=-1389.436, y=-591.6335, z=29.31957}, -- Bahamamas

	{x=-568.1715, y=280.2346, z=81.97561}, -- Tequilala

}





--====================================================================================

--  Gestion de prise et d'abandon de service

--====================================================================================

local function showBlipbar()

    for key, item in pairs(bar_blips) do

		item.blip = AddBlipForCoord(item.x, item.y, item.z)

		SetBlipSprite(item.blip, item.id)

		SetBlipAsShortRange(item.blip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString(key)

		EndTextCommandSetBlipName(item.blip)

	end

	bar_blipsTemp = bar_blips

end



function getIsInServicebar()

	return barIsInService

end



local function removeBlipbar()

    bar_markerBool = false

	for _, item in pairs(bar_blips) do

		RemoveBlip(item.blip)

	end

end



function Chat(t)

	TriggerEvent("chatMessage", 'bar', { 0, 255, 255}, "" .. tostring(t))

end



function spawnVehicule(pos, type)

    deleteVehicle()

    local vehi = GetClosestVehicle(pos.x, pos.y, pos.z, 2.0, 0, 70)

    if vehi == 0 then

        RequestModel(type)

        while not HasModelLoaded(type) do

            Wait(1)

        end

        local plate = math.random(100, 900)



		myVehiculeEntity = CreateVehicle(type, pos.x, pos.y, pos.z, GetEntityHeading(GetPlayerPed(-1)), true, false)



        SetVehicleNumberPlateText(myVehiculeEntity, bar_platesuffix)

		

		plate = GetVehicleNumberPlateText(myVehiculeEntity)

		TriggerServerEvent("ls:refreshid",plate,myVehiculeEntity)



        local ObjectId = NetworkGetNetworkIdFromEntity(myVehiculeEntity)

        SetNetworkIdExistsOnAllMachines(ObjectId, true)



		SetPedIntoVehicle(GetPlayerPed(-1), myVehiculeEntity, -1)

        SetModelAsNoLongerNeeded(type)

        return

    end

    notifIcon("CHAR_SOCIAL_CLUB", 1, "Bar", false, TEXTbar.SpawnVehicleImpossible)

end



function invokeVehicle(data)

    if data.type == 1 then

        spawnVehicule(bar_car, "baller5")

    elseif data.type == -1 then

        deleteVehicle()

    end

end



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



local function toogleServicebar()

	barIsInService = not barIsInService

	if barIsInService then

		GiveWeaponToPed(GetPlayerPed(-1), "weapon_stungun", 500, false, true)

		SetPedInfiniteAmmo(GetPlayerPed(-1), true, "weapon_stungun")

		

		notifIcon("CHAR_SOCIAL_CLUB", 1, "Bar", false, "Vous êtes désormais en service pour bar !")

	else

		RemoveWeaponFromPed(GetPlayerPed(-1), "weapon_stungun")



		-- Restaure Ped

		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

		else

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

		end

		barIsInService = false

		notifIcon("CHAR_SOCIAL_CLUB", 1, "Bar", false, "Vous n'êtes désormais plus en service pour bar !")

	end

end



local function gestionServicebar()

	local myPed = GetPlayerPed(-1)

	local myPos = GetEntityCoords(myPed)



    if barIsInService then

		for index, currentReserve in pairs(reserveCoords) do

			local dist = GetDistanceBetweenCoords(currentReserve.x, currentReserve.y, currentReserve.z, myPos.x, myPos.y, myPos.z, false)

			if dist <= 20 then

				DrawMarker(25, currentReserve.x, currentReserve.y, currentReserve.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

			end

			if dist <= 1.5 then

				DisplayHelpText("~INPUT_CONTEXT~ Ouvrir la reserve")

				if IsControlJustPressed(0, 51) then

					OpenReserve()

				end

			end

		end



		local distanceFromTpOne = GetDistanceBetweenCoords(132.5624, -1293.9926, 28.26952, myPos.x, myPos.y, myPos.z, false)

		if distanceFromTpOne < 10 then

			DrawMarker(25, 132.5624, -1293.9926, 28.26952 + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

		end

		if distanceFromTpOne < 1.5 then

			DoScreenFadeOut(300)

			Citizen.Wait(300)

			SetEntityCoords(myPed, 132.4314, -1287.497, 28.27278 + 0.5, 0, 0, 0, 0)

			Citizen.Wait(300)

			DoScreenFadeIn(300)



			Citizen.Wait(3000)

		end



		local distanceFromTpTwo = GetDistanceBetweenCoords(132.4314, -1287.497, 28.27278, myPos.x, myPos.y, myPos.z, false)

		if distanceFromTpTwo < 10 then

			DrawMarker(25, 132.4314, -1287.497, 28.27278 + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

		end

		if distanceFromTpTwo < 1.5 then

			DoScreenFadeOut(300)

			Citizen.Wait(300)

			SetEntityCoords(myPed, 132.5624, -1293.9926, 28.26952 + 0.5, 0, 0, 0, 0)

			Citizen.Wait(300)

			DoScreenFadeIn(300)



			Citizen.Wait(3000)

		end



		if MenuBar.isOpen then

			MenuBar.draw()

			MenuBar.keyControl()

		end

    end



	for i, currentService in pairs(serviceCoords) do

		local dist = GetDistanceBetweenCoords(currentService.x, currentService.y, currentService.z, myPos.x, myPos.y, myPos.z, false)

		if dist <= 20 then

			if barIsInService then

				DrawMarker(25, currentService.x, currentService.y, currentService.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 0, 0, 50, 0, 0, 0, 0)

			else

				DrawMarker(25, currentService.x, currentService.y, currentService.z + 0.02, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 0, 255, 0, 50, 0, 0, 0, 0)

			end

		end

		if dist <= 1.5 then

			if barIsInService then

				DisplayHelpText("~INPUT_PICKUP~ ~r~Pour quitter son service")

			else

				DisplayHelpText("~INPUT_PICKUP~ ~g~Pour prendre son service")

			end



			if IsControlJustPressed(0, 51) then

				toogleServicebar()

			end

		end

	end

end



function OpenReserve()

	MenuBar.initMenu()

	MenuBar.isOpen = not MenuBar.isOpen

end





--====================================================================================

-- Vehicule gestion

--====================================================================================

function notif(message)

	Citizen.CreateThread(function()

		Wait(10)

		SetNotificationTextEntry("STRING")

		AddTextComponentString(message)

		DrawNotification(false, false)

	end)

end



function deleteVehicle()

    if myVehiculeEntity ~= nil then

        DeleteVehicle(myVehiculeEntity)

        myVehiculeEntity = nil

    end

end



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0) 



        if isbar then

            gestionServicebar()

        end

    end

end)



RegisterNetEvent('bar:drawMarker')	

AddEventHandler('bar:drawMarker', function (boolean)

	isbar = boolean

	barIsInService = false

    if isbar then

        showBlipbar()

    else

        removeBlipbar()

    end

end)



RegisterNetEvent('patron-bar:drawMarker')	

AddEventHandler('patron-bar:drawMarker', function (boolean)

	isbar = boolean

	barIsInService = false

    if isbar then

        showBlipbar()

    else

        removeBlipbar()

    end

end)





RegisterNetEvent('bar:drawBlips')	

AddEventHandler('bar:drawBlips', function ()

end)



RegisterNetEvent('bar:marker')	

AddEventHandler('bar:marker', function ()

end)



RegisterNetEvent('bar:deleteBlips')

AddEventHandler('bar:deleteBlips', function ()

    isbar = false

    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end

    removeBlipbar()

end)



RegisterNetEvent('patron-bar:deleteBlips')

AddEventHandler('patron-bar:deleteBlips', function ()

    isbar = false

    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end

    removeBlipbar()

end)



--====================================================================================

-- Serveur - Client Trigger

-- restart depanneur

--====================================================================================



function notifIcon(icon, type, sender, title, text)

	Citizen.CreateThread(function()

        Wait(1)



        SetNotificationTextEntry("STRING");

        if TEXTbar[text] ~= nil then

            text = TEXTbar[text]

        end

        AddTextComponentString(text);

        SetNotificationMessage(icon, icon, true, type, sender, title, text);

        DrawNotification(false, true);

	end)

end



RegisterNetEvent("bar:PersonnelMessage")

AddEventHandler("bar:PersonnelMessage",function(message)

    if barIsInService then

        notifIcon("CHAR_SOCIAL_CLUB", 1, "Bar Info", false, message)

    end

end)



RegisterNetEvent('bar:personnelChange')

AddEventHandler('bar:personnelChange',function(nbPersonnel, nbDispo)

    ----Citizen.Trace('nbPersonnel : ' .. nbPersonnel .. ' dispo' .. nbDispo)

    bar_nbbarInService = nbPersonnel

    bar_nbbarDispo = nbDispo

end)



function GetPlayers()

	local players = {}



	for i = 0, 256 do

		if NetworkIsPlayerActive(i) then

			table.insert(players, i)

		end

	end



	return players

end



function GetClosestPlayer()

	local players = GetPlayers()

	local closestDistance = -1

	local closestPlayer = -1

	local ply = GetPlayerPed(-1)

	local plyCoords = GetEntityCoords(ply, 0)

	

	for index,value in ipairs(players) do

		local target = GetPlayerPed(value)

		if(target ~= ply) then

			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)

			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)

			if(closestDistance == -1 or closestDistance > distance) then

				closestPlayer = value

				closestDistance = distance

			end

		end

	end

	

	return closestPlayer, closestDistance

end