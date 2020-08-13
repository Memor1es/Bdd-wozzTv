-------- FONCTIONS -------

function DrawText3D(x,y,z, text, r,g,b) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)

    local px,py,pz=table.unpack(GetGameplayCamCoords())

    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

 

    local scale = (1/dist)*2

    local fov = (1/GetGameplayCamFov())*100

    local scale = scale*fov

   

    if onScreen then

        SetTextScale(0.0*scale, 0.55*scale)

        SetTextFont(0)

        SetTextProportional(1)

        SetTextColour(r, g, b, 255)

        SetTextDropshadow(0, 0, 0, 0, 255)

        SetTextEdge(2, 0, 0, 0, 150)

        SetTextDropShadow()

        SetTextOutline()

        SetTextEntry("STRING")

        SetTextCentre(1)

        AddTextComponentString(text)

        DrawText(_x,_y)

    end

end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function deleteCar(entity)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))
end

local function GetVehicleInDirection(coordFrom, coordTo)

    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)

    local _, _, _, _, vehicle = GetRaycastResult(rayHandle)

    return vehicle

end

local function DrawTopNotification(txt, beep)

	SetTextComponentFormat("jamyfafi")

	AddTextComponentString(txt)

	if string.len(txt) > 99 and AddLongString then AddLongString(txt) end

	DisplayHelpTextFromStringLabel(0, 0, beep, -1)

end

local function GetVehicleLookByPlayer(ped, dist)

    local playerPos =GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)

    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, dist, -0.8)

    return GetVehicleInDirection(playerPos, inFrontOfPlayer)

end

local idActivated = false

local disPlayerNames = 100

local playerDistances = {}

Citizen.CreateThread(function()
    Wait(50)
    while true do
        if idActivated then
            local myPed = GetPlayerPed(-1)
            for id = 0, 256 do
                if NetworkIsPlayerActive(id) then
                    if GetPlayerPed(id) ~= myPed then
                        if playerDistances[id] ~= nil then
                            if (playerDistances[id] < disPlayerNames) then
                                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                                if NetworkIsPlayerTalking(id) then
                                    DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 247, 124, 24)
                                else
                                    DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 255, 255, 255)
                                end
                            end
                        end
                    end
                end
            end
            Citizen.Wait(0)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()

    while true do

		if idActivated then

			for id = 0, 255 do

				if GetPlayerPed(id) ~= GetPlayerPed(-1) then

					x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

					x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))

					distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

					playerDistances[id] = distance

				end

			end

		end

        Citizen.Wait(1000)

    end

end)

local function GetPlayers()

    local players = {}

 

    for _, player in ipairs(GetActivePlayers()) do

        if NetworkIsPlayerActive(player) then

            table.insert(players, player)

        end

    end

 

    return players

end



Citizen.CreateThread(function()

    RequestAnimDict("facials@gen_male@variations@normal")

	RequestAnimDict("mp_facial")

 

    local talkingPlayers = {}

	while true do

		Citizen.Wait(300)

 

		for k,v in pairs(GetPlayers()) do

			local boolTalking = NetworkIsPlayerTalking(v)

			if v ~= PlayerId() then

				if boolTalking then

					PlayFacialAnim(GetPlayerPed(v), "mic_chatter", "mp_facial")

					talkingPlayers[v] = true

				elseif not boolTalking and talkingPlayers[v] then

					PlayFacialAnim(GetPlayerPed(v),"mood_normal_1","facials@gen_male@variations@normal")

					talkingPlayers[v] = nil

				end

			end

		end

	end

end)

local needRagdoll = false

Citizen.CreateThread(function()

    while true do

		if IsControlJustReleased(0, 244) then

			needRagdoll = not needRagdoll

		end



		if needRagdoll then

			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)

		end



		Citizen.Wait(1)

    end

end)

Citizen.CreateThread(function()

    while true do

        ClearAreaOfPeds(342.44, -587.00, 27.79, 50, 1)

        Citizen.Wait(500)

    end

end)

Citizen.CreateThread(function()

    while true do

		SetWeatherTypePersist("EXTRASUNNY")

        SetWeatherTypeNowPersist("EXTRASUNNY")

       	SetWeatherTypeNow("EXTRASUNNY")

       	SetOverrideWeather("EXTRASUNNY")

		

		--SetWeatherTypePersist("XMAS")

        --SetWeatherTypeNowPersist("XMAS")

        --SetWeatherTypeNow("XMAS")

        --SetOverrideWeather("XMAS")

        --SetForcePedFootstepsTracks(true)

		--SetForceVehicleTrails(true)

    	Citizen.Wait(10)

	end

end)

local teleportsPos =

{

	{

		categorie = "Admin",

		datas = 

		{

			{x = 215.0825, y = -791.4553, z = 30.83, label = "Parking Central"},

			{x = 3081.822, y = -4720.487, z = 15.262, label = "Porte avion"},

			{x = -79.756, y = -825.6085, z = 326.0785, label = "Maze bank"},

			{x = -1108.53, y = 2709.101, z = 19.10784, label = "Vetements"},

		}

	},

	{

		categorie = "Entreprises",

		datas = 

		{

			{x = 363.4968, y = -595.2534, z = 28.67574, label = "Hopital"},

			{x = 425.0778, y = -979.4996, z = 30.71084, label = "Commissariat"},

			{x = -1181.736, y = -883.1985, z = 13.798, label = "BurgerShot"},

			{x = -631.7999, y = -237.796, z = 38.0689, label = "Bijouterie"},

		}

	},

	{

		categorie = "Gangs",

		datas = 

		{

			{x = 105.2872, y = -1942.993, z = 20.8037, label = "Ballas"},

			{x = -175.488, y = -1611.649, z = 33.69, label = "Families"},

			{x = -1182.884, y = -504.2505, z = 35.577, label = "Peintres"},

		}

	},

	{

		categorie = "Apparts",

		datas =

		{

			{x = -35.31277, y = -580.4199, z = 88.71221, label = "4 Integrity Way"},

			{x = -1477.14, y = -538.7499, z = 55.5264, label = "Dell Perro Heights"},

			{x = -169.286, y = 486.4938, z = 137.4436, label = "Wild Oats"},

			{x = 340.9412, y = 437.1798, z = 149.3925, label = "North Conker 1"},

			{x = 373.023, y = 416.105, z = 145.7006, label = "North Conker 2"},

			{x = -676.127, y = 588.612, z = 145.1698, label = "Hillcrest 1"},

			{x = -763.107, y = 615.906, z = 144.1401, label = "Hillcrest 2"},

			{x = -857.798, y = 682.563, z = 152.6529, label = "Hillcrest 3"},

			{x = 120.5, y = 549.952, z = 184.097, label = "Whispymound Drive"},

			{x = -1288.0, y = 440.748, z = 97.69459, label = "Mad Wayne Thunder"},

			{x = -1468.14, y = -541.815, z = 73.4442, label = "Dell Perro Heights 2"},

			{x = -915.811, y = -379.432, z = 113.6748, label = "Richard Majestic 2"},

			{x = -614.86, y = 40.6783, z = 97.60007, label = "Tinsel Towers"},

			{x = -773.407, y = 341.766, z = 211.397, label = "EclipseTowers"},

			{x = -18.07856, y = -583.6725, z = 79.46569, label = "Integrity Way"},

			{x = -787.7805, y = 334.9232, z = 215.8384, label = "Penthouse 1"},

			{x = -773.2258, y = 322.8252, z = 194.8862, label = "Penthouse 2"},

			{x = -787.7805, y = 334.9232, z = 186.1134, label = "Penthouse 3"},

		}

	}

}

local currentCategorieIndex = 1
local currentItemIndex = 1
local isInCategory = false

Citizen.CreateThread(function()
    while true do
        if isTeleportMenuOpen then
            if isInCategory then
                DrawTopNotification("~INPUT_CONTEXT~ Categorie : " .. teleportsPos[currentCategorieIndex].datas[currentItemIndex].label .. " ~INPUT_REPLAY_ADVANCE~")

                if (IsControlJustReleased(1, 307)) then
                    currentItemIndex = currentItemIndex + 1
                    if currentItemIndex > #teleportsPos[currentCategorieIndex].datas then
                        currentItemIndex = 1
                    end
                end

                if (IsControlJustReleased(1, 308)) then
                    currentItemIndex = currentItemIndex - 1
                    if currentItemIndex < 1 then
                        currentItemIndex = #teleportsPos[currentCategorieIndex].datas
                    end
                end

                if (IsControlJustReleased(1, 177)) then
                    isInCategory = false
                    currentItemIndex = 1
                end

                if (IsControlJustReleased(1, 51)) then
                    DoScreenFadeOut(250)
                    Citizen.Wait(300)
                    SetEntityCoords(GetPlayerPed(-1), teleportsPos[currentCategorieIndex].datas[currentItemIndex].x, teleportsPos[currentCategorieIndex].datas[currentItemIndex].y, teleportsPos[currentCategorieIndex].datas[currentItemIndex].z + 0.5, 0, 0, 0, 0)
                    DoScreenFadeIn(250)
                end
            else
                DrawTopNotification("~INPUT_CONTEXT~ Categorie : " .. teleportsPos[currentCategorieIndex].categorie .. " ~INPUT_REPLAY_ADVANCE~")

                if (IsControlJustReleased(1, 307)) then
                    currentCategorieIndex = currentCategorieIndex + 1
                    if currentCategorieIndex > #teleportsPos then
                        currentCategorieIndex = 1
                    end
                end

                if (IsControlJustReleased(1, 308)) then
                    currentCategorieIndex = currentCategorieIndex - 1
                    if currentCategorieIndex < 1 then
                        currentCategorieIndex = #teleportsPos
                    end
				end

				if (IsControlJustReleased(1, 177)) then
					isTeleportMenuOpen = false
				end

				if (IsControlJustReleased(1, 51)) then
					currentItemIndex = 1
					isInCategory = true
				end
			end
		end		

		Citizen.Wait(0)

	end
end)

local allBlips =

{

    {name = "Brink's",						scale = 1.0, type = 310,	x=1.846,		y = -670.9844,	z = 32.338},
    {name = "Entreprise BurgerShot",		scale = 1.0, type = 381,	x=-1163.906,	y = -889.04,	z = 14.15},
    {name = "Unicorn",						scale = 1.0, type = 121,	x=131.8944,		y = -1303.93,	z = 29.219},
    {name = "Evenementiel",					scale = 1.2, type = 304,	x = -1082.1691, y = -248.336,	z = 36.7632},
    {name = "Weazel News",	                scale = 1.0, type = 405,	x = -599.288,	y = -929.89,	z = 22.86},
    {name = "Circuit des docks",			scale = 1.2, type = 315,	x=303.6907,		y = -3177.67,	z = 4.87  },
    {name = "Gouvernement",					scale = 1.3, type = 401,	x = -542.268,	y = -208.887,	z = 36.6497},
    {name = "Avocat",						scale = 1.1, type = 269,	x = -71.7087,	y = -814.5746,	z = 242.38601},

}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

Citizen.CreateThread(function()

	NetworkSetFriendlyFireOption(true)



	Citizen.Wait(10000)



	local newBlip

	for index,value in pairs(allBlips) do

		newBlip = AddBlipForCoord(value.x, value.y, value.z)

		SetBlipSprite(newBlip, value.type)

		SetBlipScale(newBlip, value.scale)

		SetBlipAsShortRange(newBlip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString(value.name)

		EndTextCommandSetBlipName(newBlip)

	end



	SetCanAttackFriendly(GetPlayerPed(-1), true, true)

	SetPedConfigFlag(PlayerPedId(), 35, false) -- helmet on bike

	

	SetPedParachuteTintIndex(GetPlayerPed(-1), 6)

end)

Citizen.CreateThread(function() 

    while true do              

        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then

            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())

            local lock = GetVehicleDoorLockStatus(veh)



            if lock == 7 then

                SetVehicleDoorsLocked(veh, 2)

            end

                 

            local pedd = GetPedInVehicleSeat(veh, -1)



            if pedd then                   

                SetPedCanBeDraggedOut(pedd, false)

            end             

        end   

        Citizen.Wait(0)	    							

    end

end)

------- COMMANDE TPGPS -------

RegisterNetEvent('bajautils:tpgps')
AddEventHandler('bajautils:tpgps', function()

	local entity = PlayerPedId()
    if IsPedInAnyVehicle(entity, false) then
        entity = GetVehiclePedIsUsing(entity)
    end

	local success = false
    local blipFound = false
    local blipIterator = GetBlipInfoIdIterator()
    local blip = GetFirstBlipInfoId(8)

    while DoesBlipExist(blip) do
        if GetBlipInfoIdType(blip) == 4 then
            cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())) --GetBlipInfoIdCoord(blip)
            blipFound = true
            break
        end
        blip = GetNextBlipInfoId(blipIterator)
        Wait(0)
    end

    if blipFound then
        local groundFound = false
        local yaw = GetEntityHeading(entity)
        
        for i = 0, 1000, 1 do
            SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
            SetEntityRotation(entity, 0, 0, 0, 0 ,0)
            SetEntityHeading(entity, yaw)
            SetGameplayCamRelativeHeading(0)
            Wait(0)

			if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then
                cz = ToFloat(i)
                groundFound = true
                break
            end
        end

		if not groundFound then
            cz = -300.0
        end

		success = true

	else
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "RainbowLand", false, "Pensez a placer un gps...")
    end



	if success then
        SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
        SetGameplayCamRelativeHeading(0)
        if IsPedSittingInAnyVehicle(PlayerPedId()) then
            if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
                SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
            end
        end
    end
end)

------- COMMANDE UNL --------

RegisterNetEvent('bajautils:unlock')
AddEventHandler('bajautils:unlock', function()

	local myPed = GetPlayerPed(-1)
    local vehicle = GetVehicleLookByPlayer(myPed, 3.0)

    if vehicle ~= 0 then 
        TaskWarpPedIntoVehicle(myPed, vehicle, -1)
        SetVehicleDoorsLocked(vehicle, 1)
    else
        TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "RainbowLand Utils", false, "Aucun vehicule.")
    end
end)

--------- COMMANDE REPAIR --------

RegisterNetEvent('bajautils:repairvh')
AddEventHandler('bajautils:repairvh', function()
    local player = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(player, false)

    if car == 0 then
        local pos = GetEntityCoords(player, 1)
        car = GetClosestVehicle(pos.x, pos.y, pos.z, 3.000, 0, 70)
    end

    if DoesEntityExist(car) then
        SetVehicleFixed(car)                                             
        SetVehicleEngineHealth(car, 1000.0)                              
        SetVehicleBodyHealth(car, 1000.0)                              
        SetVehicleEngineOn(car, true, false, true)
    end
end)

------ COMMANDE REVIVE + HEAL -------

RegisterNetEvent('bajautils:revive')
AddEventHandler('bajautils:revive', function()
    local playerPed = GetPlayerPed(-1)
    local ped = PlayerId() 

	if IsEntityDead(playerPed) then 
        ResurrectPed(playerPed)
        SetEntityHealth(playerPed, 200)
        TriggerServerEvent('td_health:update', GetEntityHealth(ped))
        ClearPedBloodDamage(playerPed)
        ClearPedTasksImmediately(playerPed)
    end
end)

RegisterNetEvent('bajautils:heal')
AddEventHandler('bajautils:heal', function()
    local playerPed = GetPlayerPed(-1)
    local ped = PlayerId() 

    ResurrectPed(playerPed)
    SetEntityHealth(playerPed, 200)
    TriggerServerEvent('td_health:update', GetEntityHealth(ped))
    ClearPedBloodDamage(playerPed)
    ClearPedTasksImmediately(playerPed)
end)

------- COMMANDES TP -------

RegisterNetEvent('bajautils:tppc')
AddEventHandler('bajautils:tppc', function()
    local playerPed = GetPlayerPed(-1)

    SetPedCoordsKeepVehicle(playerPed, 215.0766, -791.4468, 30.83751)

    local ped = PlayerId()

	ResurrectPed(playerPed)
    SetEntityHealth(playerPed, 200)
    TriggerServerEvent('td_health:update', GetEntityHealth(ped))
    ClearPedTasksImmediately(playerPed)
end)

RegisterNetEvent('bajautils:tpmc')
AddEventHandler('bajautils:tpmc', function()
    local playerPed = GetPlayerPed(-1)

    SetPedCoordsKeepVehicle(playerPed, 1249.74353, 5562.8623, 499.75) 

    local ped = PlayerId() 

	ResurrectPed(playerPed)
    SetEntityHealth(playerPed, 200)
    TriggerServerEvent('td_health:update', GetEntityHealth(ped))
    ClearPedTasksImmediately(playerPed)
end)

RegisterNetEvent('bajautils:tpqg')
AddEventHandler('bajautils:tpqg', function()
    local playerPed = GetPlayerPed(-1)

    SetPedCoordsKeepVehicle(playerPed, -160.59, -996.25, 254.13)

    local ped = PlayerId() 

	ResurrectPed(playerPed)
    SetEntityHealth(playerPed, 200)
    TriggerServerEvent('td_health:update', GetEntityHealth(ped))
    ClearPedTasksImmediately(playerPed)
end)

-------- COMMANDE POI --------

RegisterNetEvent('bajautils:poi')
AddEventHandler('bajautils:poi', function()
    local ped = GetPlayerPed(-1)

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

        if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped, false )

            if (GetPedInVehicleSeat(vehicle, -1) == ped) then 
                notify("~r~Véhicule supprimé.")
                SetEntityAsMissionEntity(vehicle, true, true)
                deleteCar(vehicle)
            else 
                TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "RainbowLand Utils", false, "Tu dois être conducteur.")
            end 
        else
            local playerPos = GetEntityCoords(ped)
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, distanceToCheck, 0.0)
            local vehicle = GetVehicleInDirection(playerPos, inFrontOfPlayer)

            if (DoesEntityExist(vehicle)) then 
                notify("~r~Véhicule supprimé.")
                SetEntityAsMissionEntity(vehicle, true, true)
                deleteCar(vehicle)
            else 
                TriggerEvent("es_freeroam:notify", "CHAR_SOCIAL_CLUB", 1, "RainbowLand Utils", false, "Tu dois être dedans ou proche d'un véhicule.")
            end 
        end 
    end
end)

-------- COMMANDE GET POS FONDA --------

RegisterNetEvent('bajautils:getpos')
AddEventHandler('bajautils:getpos', function()

	print("-------------------------------------------------")

	print("Coords : " .. GetEntityCoords(GetPlayerPed(-1), true))

	print("Heading : " .. GetEntityHeading(GetPlayerPed(-1)))

	print("-------------------------------------------------")

end)

-------- COMMANDE INVISIBLE --------

RegisterNetEvent('bajautils:inv')
AddEventHandler('bajautils:inv', function()
    local player = PlayerPedId()
    
    if IsEntityVisible(player) then
        SetEntityVisible(player, false, true)
    else
        SetEntityVisible(player, true, true)
    end
end)

-------- COMMANDE TP MULTIPLE --------

RegisterNetEvent('bajautils:tp')
AddEventHandler('bajautils:tp', function()
    isTeleportMenuOpen = true
end)

-------- COMMANDE ID --------

RegisterNetEvent('bajautils:bajaid')
AddEventHandler('bajautils:bajaid', function()
    if idActivated then
        idActivated = false
    else
        idActivated = true
    end
end)

------- COMMANDE CLEAR WEAPON ----------
RegisterNetEvent('bajautils:clearWeapons')
AddEventHandler('bajautils:clearWeapons', function()

	RemoveAllPedWeapons(GetPlayerPed(-1), 0)

	TriggerEvent("avanyaguns:needUpdateWeapons")

end)

------ COMMANDE GIVEWEAPON -------
RegisterNetEvent('bajautils:giveweapon')
AddEventHandler('bajautils:giveweapon', function(weapon)

    GiveWeaponToPed(GetPlayerPed(-1), weapon, 250, false, true)
    SetPedInfiniteAmmo(GetPlayerPed(-1), true, weapon)

end)