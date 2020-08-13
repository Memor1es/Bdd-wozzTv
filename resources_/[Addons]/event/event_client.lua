

local eventIsInService = false



local spawneventVehicleChoix = {}

local KEY_ENTER = 18

local KEY_UP = 96 -- N+

local KEY_DOWN = 97 -- N-

local KEY_CLOSE = 177

local event_Blip = {}



----

local event_blipsTemp

local event_markerBool = false

local existingVeh = nil



isevent = false

isjournaliste = false



local TEXTevent = {

    SpawnVehicleImpossible = '~R~ Impossible, aucune place disponible.',    

}



event_platesuffix = "EVENT"

event_car = {

	x=-562.6734619,  

	y=302.081512,

	z=83.160522,

	h=0.0,

OverPowered=15.0,

}



local serviceBlip



local serviceJournalistePos =	{x = -573.9556,	y = -925.5884,	z = 23.87757}

local serviceEventPos =			{x = -1082.169, y = -248.336,	z = 36.763}



service = { 

	id=304,

	x=-567.772,

	y=-935.756,

	z=22.877,

	distanceBetweenCoords=2,

	distanceMarker=2,

}



garages = {

	["Event Hippodrome"] = {

		id=304,

		x=1224.875976,  

		y=324.319,

		z=81.99,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event Riviere"] = {

		id=304,

		x=-1527.4134,  

		y=1495.3884,

		z=110.357,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event Riviere 2"] = {

		id=304,

		x=-160.6475,  

		y=4254.439,

		z=29.9074,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event Riviere 3"] = {

		id=304,

		x=-1844.262,  

		y=4686.587,

		z=-0.002254784,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event Prison"] = {

		id=304,

		x=1862.69458,  

		y=2705.1760,

		z=45.936889,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event circuit cross"] = {

		id=304,

		x=869.1959,  

		y=2345.4582,

		z=51.69,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event aeroport trevor"] = {

		id=304,

		x=1732.50268,  

		y=3314.53637,

		z=41.2234,

		distanceBetweenCoords=2,

		distanceMarker=2

	},



	["Event cascade"] = {

		id=304,

		x=-1577.3641,  

		y=2093.0422,

		z=69.3953,

		distanceBetweenCoords=2,

		distanceMarker=2

	},

}



--====================================================================================

--  Gestion de prise et d'abandon de service

--====================================================================================

local function showBlipevent()

    for key, item in pairs(garages) do

		item.blip = AddBlipForCoord(item.x, item.y, item.z)

		SetBlipSprite(item.blip, item.id)

		SetBlipAsShortRange(item.blip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString("Point d'event")

		EndTextCommandSetBlipName(item.blip)

	end

end



local function removeEventBlips()

	for key, item in pairs(garages) do

		RemoveBlip(item.blip)

	end

end



function getIsInServiceEvent()

	return eventIsInService

end



function Chat(t)

	TriggerEvent("chatMessage", 'evenementiel', { 0, 255, 255}, "" .. tostring(t))

end



function spawnEventVehicle(VehicleName)

	if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then

		local pos = GetEntityCoords(GetPlayerPed(-1))

		local vehi = GetClosestVehicle(pos.x, pos.y, pos.z, 2.0, 0, 70)

		if vehi == 0 then



			RequestModel(VehicleName)

			while not HasModelLoaded(VehicleName) do

				Wait(1)

			end



			myVehiculeEntity = CreateVehicle(VehicleName, pos.x, pos.y, pos.z, 0.0, true, false)

			DecorRegister("RainbowLand", 2)

			DecorSetBool(myVehiculeEntity, "RainbowLand", true)

		

			SetVehicleNumberPlateText(myVehiculeEntity, "EVENT")

		

			plate = GetVehicleNumberPlateText(myVehiculeEntity)

			TriggerServerEvent("ls:refreshid",plate,myVehiculeEntity)



			local ObjectId = NetworkGetNetworkIdFromEntity(myVehiculeEntity)

			SetNetworkIdExistsOnAllMachines(ObjectId, true)



			SetPedIntoVehicle(GetPlayerPed(-1), myVehiculeEntity, -1)

			SetVehicleLivery(myVehiculeEntity, 0)

			SetModelAsNoLongerNeeded(VehicleName)

		else

			notifIcon("CHAR_SOCIAL_CLUB", 1, "evenementiel", false, TEXTevent.SpawnVehicleImpossible)

		end

	end    

end



function spawnVehicle(vehicleInfos)

	if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then

		local pos = GetEntityCoords(GetPlayerPed(-1))

		local vehi = GetClosestVehicle(pos.x, pos.y, pos.z, 2.0, 0, 70)

		if vehi == 0 then



			RequestModel(vehicleInfos.name)

			while not HasModelLoaded(vehicleInfos.name) do

				Wait(1)

			end



			myVehiculeEntity = CreateVehicle(vehicleInfos.name, vehicleInfos.x, vehicleInfos.y, vehicleInfos.z, vehicleInfos.h, true, false)

			DecorRegister("RainbowLand", 2)

			DecorSetBool(myVehiculeEntity, "RainbowLand", true)

		

			SetVehicleNumberPlateText(myVehiculeEntity, vehicleInfos.plate)

		

			plate = GetVehicleNumberPlateText(myVehiculeEntity)

			TriggerServerEvent("ls:refreshid",plate,myVehiculeEntity)



			local ObjectId = NetworkGetNetworkIdFromEntity(myVehiculeEntity)

			SetNetworkIdExistsOnAllMachines(ObjectId, true)



			SetPedIntoVehicle(GetPlayerPed(-1), myVehiculeEntity, -1)

			SetVehicleLivery(myVehiculeEntity, 0)

			SetModelAsNoLongerNeeded(vehicleInfos.name)

		else

			notifIcon("CHAR_SOCIAL_CLUB", 1, "evenementiel", false, TEXTevent.SpawnVehicleImpossible)

		end

	end    

end



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



local function toogleServiceevent()

	eventIsInService = not eventIsInService

	local myPlayerPed = GetPlayerPed(-1)

	if eventIsInService then

		

		notifIcon("CHAR_SOCIAL_CLUB", 1, "Info", false, "Vous êtes désormais en service !")

	else

		-- Restaure Ped

		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

		else

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

		end



		TriggerServerEvent('hideweapon:svGiveWeapons')

		eventIsInService = false

		notifIcon("CHAR_SOCIAL_CLUB", 1, "Info", false, "Vous n'êtes plus en service !")

	end

end



RegisterNetEvent("evenementiel:Advert")

AddEventHandler("evenementiel:Advert",function()

	TriggerServerEvent('SyncEvent', "Disponible")

end)



RegisterNetEvent('DisplayEvent')

AddEventHandler('DisplayEvent',function(inputText)



SetNotificationTextEntry("STRING");

AddTextComponentString(inputText);

SetNotificationMessage("CHAR_MP_STRIPCLUB_PR", "CHAR_MP_STRIPCLUB_PR", true, 1, "~y~evenementiel En Service~s~", "");

DrawNotification(false, true);



end)



local function gestionServiceevent(myPos)

	local distanceFromServiceEvent = GetDistanceBetweenCoords(serviceEventPos.x, serviceEventPos.y, serviceEventPos.z, myPos.x, myPos.y, myPos.z, false)

	if distanceFromServiceEvent <= 20.0 then

		if eventIsInService then

			DrawMarker(25, serviceEventPos.x, serviceEventPos.y, serviceEventPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, serviceEventPos.x, serviceEventPos.y, serviceEventPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 50, 0, 0, 0, 0)

		end

	end



	if distanceFromServiceEvent < 2.0 then

		if IsControlJustPressed(1, 51) then

            toogleServiceevent()

        end

		if eventIsInService then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_CONTEXT~ ~r~Quitter le service")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		else

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_CONTEXT~ ~g~Entrer en service")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		end

	end



	-------------------------------



	local distanceFromServiceJournaliste = GetDistanceBetweenCoords(serviceJournalistePos.x, serviceJournalistePos.y, serviceJournalistePos.z, myPos.x, myPos.y, myPos.z, false)

	if distanceFromServiceJournaliste <= 20.0 then

		if eventIsInService then

			DrawMarker(25, serviceJournalistePos.x, serviceJournalistePos.y, serviceJournalistePos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, serviceJournalistePos.x, serviceJournalistePos.y, serviceJournalistePos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 50, 0, 0, 0, 0)

		end

	end



	if distanceFromServiceJournaliste < 2.0 then

		if IsControlJustPressed(1, 51) then

            toogleServiceevent()

        end

		if eventIsInService then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_CONTEXT~ ~r~Quitter le service")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		else

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_CONTEXT~ ~g~Entrer en service")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		end

	end

end



function OpenEventMenu()

	MenuEventSpawn.initMenu()

	MenuEventSpawn.isOpen = not MenuEventSpawn.isOpen

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



        if isevent then

			local myPos = GetEntityCoords(GetPlayerPed(-1))



            gestionServiceevent(myPos)

		

			if isjournaliste and eventIsInService then

				local journalisteCar = { ['name'] = "rumpo", ['x'] = -553.308, ['y'] = -930.0681, ['z'] = 23.86205, ['h'] = 276.88232421875, ['plate'] = "WEAZEL" } 

				local dist = GetDistanceBetweenCoords(journalisteCar.x, journalisteCar.y, journalisteCar.z, myPos.x, myPos.y, myPos.z, false)

				if dist < 20.0 then

					DrawMarker(25, journalisteCar.x, journalisteCar.y, journalisteCar.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

				end

				if dist < 2.0 then

					SetTextComponentFormat("STRING")

					AddTextComponentString("~INPUT_PICKUP~ Pour sortir le vehicule de fonction")

					DisplayHelpTextFromStringLabel(0, 0, 1, -1)

					if IsControlJustPressed(0, 51) then

						spawnVehicle(journalisteCar)

					end

				end



				local buzzardInfos = { ['name'] = "buzzard2", ['x'] = -583.5029, ['y'] = -930.508, ['z'] = 36.83359, ['h'] = 274.06, ['plate'] = "WEAZEL" } 

				local distanceFromBuzzard = GetDistanceBetweenCoords(buzzardInfos.x, buzzardInfos.y, buzzardInfos.z, myPos.x, myPos.y, myPos.z, false)

				if distanceFromBuzzard < 20.0 then

					DrawMarker(25, buzzardInfos.x, buzzardInfos.y, buzzardInfos.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

				end

				if distanceFromBuzzard < 2.0 then

					SetTextComponentFormat("STRING")

					AddTextComponentString("~INPUT_PICKUP~ Pour sortir le vehicule de fonction")

					DisplayHelpTextFromStringLabel(0, 0, 1, -1)

					if IsControlJustPressed(0, 51) then

						spawnVehicle(buzzardInfos)

					end

				end

			end



			if eventIsInService and not isjournaliste then

				for key, item in pairs(garages) do

					local distFromGarage = GetDistanceBetweenCoords(item.x, item.y, item.z, myPos.x, myPos.y, myPos.z, false)

					if distFromGarage < 20.0 then

						DrawMarker(25, item.x, item.y, item.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 50, 0, 0, 0, 0)

					end

					if distFromGarage < 2.0 then

						SetTextComponentFormat("STRING")

						AddTextComponentString("~INPUT_PICKUP~ Ouvrir le menu")

						DisplayHelpTextFromStringLabel(0, 0, 1, -1)

						if(IsControlJustReleased(1, 51))then

							MenuEventSpawn.initMenu()

							MenuEventSpawn.isOpen = not MenuEventSpawn.isOpen

						end

						if MenuEventSpawn.isOpen then

							MenuEventSpawn.draw()

							MenuEventSpawn.keyControl()

						end

					end

				end

			end

        end

    end

end)



RegisterNetEvent('evenementiel:drawMarker')	

AddEventHandler('evenementiel:drawMarker', function (boolean)

	isevent = boolean

	eventIsInService = false

    if isevent then

        showBlipevent()

    end

end)



RegisterNetEvent('journaliste:drawMarker')	

AddEventHandler('journaliste:drawMarker', function (boolean)

	isevent = boolean

	isjournaliste = boolean

	eventIsInService = false

end)



RegisterNetEvent('patron-journaliste:drawMarker')	

AddEventHandler('patron-journaliste:drawMarker', function (boolean)

	isevent = boolean

	isjournaliste = boolean

	eventIsInService = false

end)



RegisterNetEvent('patron-evenementiel:drawMarker')	

AddEventHandler('patron-evenementiel:drawMarker', function (boolean)

	isevent = boolean

	eventIsInService = false



	if isevent then

        showBlipevent()

    end

end)


RegisterNetEvent('patron-evenementiel:deleteBlips')

AddEventHandler('patron-evenementiel:deleteBlips', function ()

    isevent = false



	removeEventBlips()



    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end

end)



RegisterNetEvent('evenementiel:deleteBlips')

AddEventHandler('evenementiel:deleteBlips', function ()

    isevent = false



	removeEventBlips()

    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end

end)



RegisterNetEvent('journaliste:deleteBlips')

AddEventHandler('journaliste:deleteBlips', function ()

	isjournaliste = false

    isevent = false

    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end

end)



RegisterNetEvent('patron-journaliste:deleteBlips')

AddEventHandler('patron-journaliste:deleteBlips', function ()

	isjournaliste = false

    isevent = false

    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

	else

		TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

	end

end)





--====================================================================================

-- Serveur - Client Trigger

-- restart depanneur

--====================================================================================



function notifIcon(icon, type, sender, title, text)

	Citizen.CreateThread(function()

        Wait(1)



        SetNotificationTextEntry("STRING");

        if TEXTevent[text] ~= nil then

            text = TEXTevent[text]

        end

        AddTextComponentString(text);

        SetNotificationMessage(icon, icon, true, type, sender, title, text);

        DrawNotification(false, true);

	end)

end



RegisterNetEvent("evenementiel:PersonnelMessage")

AddEventHandler("evenementiel:PersonnelMessage",function(message)

    if eventIsInService then

        notifIcon("CHAR_SOCIAL_CLUB", 1, "event Info", false, message)

    end

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



-- Register a network event 

RegisterNetEvent('evenementiel:deleteVehicle')



-- The distance to check in front of the player for a vehicle

-- Distance is in GTA units, which are quite big  

local distanceToCheck = 5.0



-- Add an event handler for the deleteVehicle event. 

-- Gets called when a user types in /dv in chat (see server.lua)

AddEventHandler('evenementiel:deleteVehicle', function()

    local ped = GetPlayerPed( -1 )



    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

        local pos = GetEntityCoords( ped )



        if ( IsPedSittingInAnyVehicle( ped ) ) then 

            local vehicle = GetVehiclePedIsIn( ped, false )



            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 

                SetEntityAsMissionEntity( vehicle, true, true )

                deleteCar( vehicle )



                if ( DoesEntityExist( vehicle ) ) then 

                	ShowNotification( "~r~Impossible d'effacer le vehicule, veuillez reessayer." )

                else 

                	ShowNotification( "Le vehicule a disparu." )

                end 

            else 

                ShowNotification( "Placez vous en conducteur!" )

            end 

        else

            local playerPos = GetEntityCoords( ped, 1 )

            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )

            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )



            if ( DoesEntityExist( vehicle ) ) then 

                SetEntityAsMissionEntity( vehicle, true, true )

                deleteCar( vehicle )



                if ( DoesEntityExist( vehicle ) ) then 

                	ShowNotification( "~r~Impossible d'effacer le vehicule, veuillez reessayer." )

                else 

                	ShowNotification( "Le vehicule a disparu." )

                end 

            else 

                ShowNotification("Aucun vehicule a proximite.")

            end 

        end 

    end 

end )



-- Delete car function borrowed frtom Mr.Scammer's model blacklist, thanks to him!

function deleteCar( entity )

    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))

	if IsEntityAVehicle(entity) then

		Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))

	end

end





-- Gets a vehicle in a certain direction

-- Credit to Konijima

function GetVehicleInDirection( coordFrom, coordTo )

    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )

    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )

    return vehicle

end



-- Shows a notification on the player's screen 

function ShowNotification( text )

    SetNotificationTextEntry( "STRING" )

    AddTextComponentString( text )

    DrawNotification( false, false )

end