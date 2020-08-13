

local brinks_blipsTemp

local brinks_markerBool = false

local existingVeh = nil

local isInServiceBrinks = false

local GetPlayerPed = GetPlayerPed



function brinks_callSE(evt)

	Menu.hidden = not Menu.hidden

	Menu.renderGUI()

	TriggerServerEvent(evt)

end



function brinks_InitMenuVehicules()

	MenuTitle = "SpawnJobs"

	ClearMenu()

	Menu.addButton("Vehicule", "brinks_callSE", 'brinks:Car')

end



function getIsInServiceBrinks()

	return isInServiceBrinks

end



function brinksDrawMarker()

	if isInServiceBrinks and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), brinks_blips["Argent"].x,brinks_blips["Argent"].y,brinks_blips["Argent"].z, true) <= brinks_blips["Argent"].distanceBetweenCoords then

		TriggerServerEvent('brinks:serverRequest', "GetArgent")

		Citizen.Wait(brinks_blips["Argent"].defaultTime)

	end	

	if isInServiceBrinks and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), brinks_blips["Lingot"].x,brinks_blips["Lingot"].y,brinks_blips["Lingot"].z, true) <= brinks_blips["Lingot"].distanceBetweenCoords then

		TriggerServerEvent('brinks:serverRequest', "GetLingot")

		Citizen.Wait(brinks_blips["Lingot"].defaultTime)

	end

		

	if isInServiceBrinks and  GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), brinks_blips["Point de livraison"].x,brinks_blips["Point de livraison"].y,brinks_blips["Point de livraison"].z, true) <= brinks_blips["Point de livraison"].distanceBetweenCoords then

		TriggerServerEvent('brinks:serverRequest', "SellLingot")

		Citizen.Wait(brinks_blips["Point de livraison"].defaultTime)

	end

end



function brinksMarker()

	local myPed = GetPlayerPed(-1)

	local myPos = GetEntityCoords(myPed)



	local distFromService = GetDistanceBetweenCoords(brinks_blips["Entreprise"].x, brinks_blips["Entreprise"].y, brinks_blips["Entreprise"].z, myPos.x, myPos.y, myPos.z, false)

	if distFromService <= 20 then

		if isInServiceBrinks then

			DrawMarker(25, brinks_blips["Entreprise"].x, brinks_blips["Entreprise"].y, brinks_blips["Entreprise"].z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 0, 0, 50, 0, 0, 0, 0)

		else

			DrawMarker(25, brinks_blips["Entreprise"].x, brinks_blips["Entreprise"].y, brinks_blips["Entreprise"].z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 0, 255, 0, 50, 0, 0, 0, 0)

		end

	end

	if distFromService <= 1.5 then

		if isInServiceBrinks then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_PICKUP~ ~r~Pour quitter son service")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		else

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_PICKUP~ ~g~Pour prendre son service")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

		end

		if IsControlJustPressed(0, 51) then

			GetServiceBrinks()

		end

	end



	if isInServiceBrinks then

		local distFromVehicleSpawner = GetDistanceBetweenCoords(brinks_blips["Garage"].x, brinks_blips["Garage"].y, brinks_blips["Garage"].z, myPos.x, myPos.y, myPos.z, false)

		if distFromVehicleSpawner <= 20.0 then

			DrawMarker(25, brinks_blips["Garage"].x, brinks_blips["Garage"].y, brinks_blips["Garage"].z + 0.05, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 255, 255, 255, 50, 0, 0, 0, 0)

		end

		if distFromVehicleSpawner <= 1.5 then

			SetTextComponentFormat("STRING")

			AddTextComponentString("~INPUT_PICKUP~ Pour sortir/ranger votre vehicule")

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustPressed(0, 51) then

				if(existingVeh ~= nil) then

					SetEntityAsMissionEntity(existingVeh, true, true)

					Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))

					Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(existingVeh))

					existingVeh = nil

				else

					brinks_InitMenuVehicules()

					Menu.hidden = not Menu.hidden

				end

			end

		end



		Menu.renderGUI()

	end

end



RegisterNetEvent('brinks:drawBlips')

AddEventHandler('brinks:drawBlips', function () 

	for key, item in pairs(brinks_blips) do

		item.blip = AddBlipForCoord(item.x, item.y, item.z)

		SetBlipSprite(item.blip, item.id)

		SetBlipAsShortRange(item.blip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString(key)

		EndTextCommandSetBlipName(item.blip)

	end

	brinks_blipsTemp = brinks_blips

end)



RegisterNetEvent('brinks:deleteBlips')

AddEventHandler('brinks:deleteBlips', function ()

	brinks_markerBool = false

	for _, item in pairs(brinks_blipsTemp) do

		RemoveBlip(item.blip)

	end

end)



RegisterNetEvent('brinks:drawMarker')

AddEventHandler('brinks:drawMarker', function (boolean) 

	brinks_markerBool = boolean

	Citizen.CreateThread(function()

		while brinks_markerBool == true do

			Wait(0)

			brinksDrawMarker()

		end

	end)

end)

	

RegisterNetEvent('brinks:marker')

AddEventHandler('brinks:marker', function ()

	Citizen.CreateThread(function () 

		while brinks_markerBool == true do

			Citizen.Wait(1)

			brinksMarker()

		end

	end)

end)



RegisterNetEvent('patron-brinks:drawBlips')

AddEventHandler('patron-brinks:drawBlips', function () 

	for key, item in pairs(brinks_blips) do

		item.blip = AddBlipForCoord(item.x, item.y, item.z)

		SetBlipSprite(item.blip, item.id)

		SetBlipAsShortRange(item.blip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString(key)

		EndTextCommandSetBlipName(item.blip)

	end

	brinks_blipsTemp = brinks_blips

end)



RegisterNetEvent('patron-brinks:deleteBlips')

AddEventHandler('patron-brinks:deleteBlips', function ()

	brinks_markerBool = false

	for _, item in pairs(brinks_blipsTemp) do

		RemoveBlip(item.blip)

	end

end)



RegisterNetEvent('patron-brinks:drawMarker')

AddEventHandler('patron-brinks:drawMarker', function (boolean) 



	brinks_markerBool = boolean

	Citizen.CreateThread(function()

		while brinks_markerBool == true do

			Wait(0)

			brinksDrawMarker()

		end

	end)

end)

	

RegisterNetEvent('patron-brinks:marker')

AddEventHandler('patron-brinks:marker', function ()

	Citizen.CreateThread(function () 

		while brinks_markerBool == true do

			Citizen.Wait(1)

			brinksMarker()

		end

	end)

end)



function notif(message)

	Citizen.CreateThread(function()

		Wait(10)

		SetNotificationTextEntry("STRING")

		AddTextComponentString(message)

		DrawNotification(false, false)

	end)

end



function GetServiceBrinks()

	local playerPed = GetPlayerPed(-1)

	if isInServiceBrinks then

		notif("Vous n\'êtes plus en service")

		local myPlayerPed = GetPlayerPed(-1)

		

		RemoveWeaponFromPed(myPlayerPed, GetHashKey("weapon_combatpistol"))

		RemoveWeaponFromPed(myPlayerPed, GetHashKey("weapon_assaultsmg"))

		RemoveWeaponFromPed(myPlayerPed, GetHashKey("WEAPON_FLASHLIGHT"))

		RemoveWeaponFromPed(myPlayerPed, GetHashKey("weapon_stungun"))

		

		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

		else

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

		end

	else

		notif("Début du service")

		TriggerEvent("brinks:getSkin")

	end

	isInServiceBrinks = not isInServiceBrinks

	TriggerServerEvent('brinks:setService', isInServiceBrinks)

end

	

	RegisterNetEvent('brinks:getSkin')

	AddEventHandler('brinks:getSkin', function (source)

		local hashSkin = GetHashKey("mp_m_freemode_01")

		Citizen.CreateThread(function()

		if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then

			SetPedPropIndex(GetPlayerPed(-1), 0, 124, 3, 0)

			

			SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 3, 131, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 4, 31, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 5, 40, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 7, 8, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 9, 7, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 4, 0)

		else

			SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 4, 0)   -- Veste

			SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)  -- Top

			SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)   -- Undershirt

			SetPedComponentVariation(GetPlayerPed(-1), 4, 32, 0, 0)   -- Pants

			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)   -- Shoes

			SetPedComponentVariation(GetPlayerPed(-1), 9, 13, 1, 2)  --Bulletproof jacket

			SetPedComponentVariation(GetPlayerPed(-1), 5, 40, 0, 0)

		end

		

		SetPedArmour(GetPlayerPed(-1), 100)

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 150, true, true)

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_stungun"), 150, true, true)

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_combatpistol"), 200, true, true)

		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultsmg"), 200, true, true)

		end)

	end)

	

	function WaitNextFrame(frame)

	local SkipFrame = frame or 0

	local frame = GetFrameCount()

	local frame2 = frame - 20



	local time = GetGameTimer()

	while not (tonumber(frame2 - frame) >= 1 + SkipFrame) do

		Citizen.Wait(0)

		frame2 = GetFrameCount()

	end

	local time2 = GetGameTimer()

	count = (time2 - time)

	return count, (frame2 - frame)

end

	

RegisterNetEvent('brinks:getCar')

AddEventHandler('brinks:getCar', function (source)

	local vehiculeDetected = GetClosestVehicle(brinks_car.x, brinks_car.y, brinks_car.z, 6.0, 0, 70)

	if not DoesEntityExist(vehiculeDetected) then

		local myPed = GetPlayerPed(-1)

		local player = PlayerId()

		local vehicle = GetHashKey('stockade')

		RequestModel(vehicle)

		while not HasModelLoaded(vehicle) do

			Wait(1)

		end

		existingVeh = CreateVehicle(vehicle,brinks_car.x, brinks_car.y, brinks_car.z,0.0, true, false)

		DecorRegister("RainbowLand", 2)

		DecorSetBool(existingVeh, "RainbowLand", true)

		SetVehicleHasBeenOwnedByPlayer(existingVeh,true)

		local id = NetworkGetNetworkIdFromEntity(existingVeh)

		SetNetworkIdCanMigrate(id, true)

		SetEntityInvincible(existingVeh, false)

		SetVehicleOnGroundProperly(existingVeh)

		SetVehicleNumberPlateText(existingVeh, "BRINKS" .. math.random(0, 99))

		SetPedIntoVehicle(myPed, existingVeh, - 1)

		SetEntityAsMissionEntity(existingVeh, true, true)

		plate = GetVehicleNumberPlateText(existingVeh)

		TriggerServerEvent("ls:refreshid",plate,existingVeh)

		

		SetModelAsNoLongerNeeded(vehicle)

	else

		notif("Zone encombrée.")

	end

end)





RegisterNetEvent('brinks:drawGetArgent')

AddEventHandler('brinks:drawGetArgent', function (qteArgent)

	if(qteArgent == nil) then

		qteArgent = 0

	end



	if qteArgent < 55 then

		TriggerEvent('player:receiveItem',38,1)

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~g~Argent obtenu")

		DrawSubtitleTimed(4500, 1)

	else

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~r~Vous avez suffisamment d\'argent")

		DrawSubtitleTimed(2000, 1)

	end

end)



RegisterNetEvent('brinks:drawGetLingot')

AddEventHandler('brinks:drawGetLingot', function(qteArgent, qteLingot)

	if(qteArgent == nil) then

		qteArgent = 0

	end

	

	if(qteLingot == nil) then

		qteLingot = 0

	end



	if qteLingot < 90 and qteArgent > 0 then

		TriggerEvent('player:looseItem',38,1)

		TriggerEvent('player:receiveItem',9,1)

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~g~ Recensement des lingots")

		DrawSubtitleTimed(4500, 1)

	else

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~r~Vous n'avez plus de lingot a recenser")

		DrawSubtitleTimed(2000, 1)

	end

end)



RegisterNetEvent('brinks:drawSellLingot')

AddEventHandler('brinks:drawSellLingot', function (qte)

	if(qte == nil) then

		qte = 0

	end



	if qte > 0 then

		TriggerEvent('player:looseItem',9,1)

		local salaire = math.random(brinks_pay.minimum, brinks_pay.maximum)

		TriggerServerEvent('mission:completed', salaire)

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~g~Transfert des lingots vers le coffre fort!")

		DrawSubtitleTimed(2000, 1)

	else

		ClearPrints()

		SetTextEntry_2("STRING")

		AddTextComponentString("~r~Vous n'avez plus de lingot")

		DrawSubtitleTimed(2000, 1)

	end

end)



