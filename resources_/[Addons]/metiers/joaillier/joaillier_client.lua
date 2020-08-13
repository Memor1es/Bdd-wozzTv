local joaillier_blipsTemp
local joaillier_markerBool = false
local existingVeh = nil
local isInServiceJoaillier = false

function joaillier_callSE(evt)
	Menu.hidden = not Menu.hidden
	Menu.renderGUI()
	TriggerServerEvent(evt)
end

function joaillier_InitMenuVehicules()
	MenuTitle = "SpawnJobs"
	ClearMenu()
	Menu.addButton("Vehicule", "joaillier_callSE", 'joaillier:Car')
end

function getIsInServiceJoaillier()

	return isInServiceJoaillier

end

RegisterNetEvent('joaillier:drawBlips')
AddEventHandler('joaillier:drawBlips', function () 
	for key, item in pairs(joaillier_blips) do
		item.blip = AddBlipForCoord(item.x, item.y, item.z)
		SetBlipSprite(item.blip, item.id)
		SetBlipAsShortRange(item.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(key)
		EndTextCommandSetBlipName(item.blip)
	end
	joaillier_blipsTemp = joaillier_blips
end)

RegisterNetEvent('joaillier:deleteBlips')
AddEventHandler('joaillier:deleteBlips', function ()
	joaillier_markerBool = false
	for _, item in pairs(joaillier_blipsTemp) do
		RemoveBlip(item.blip)
	end
end)

RegisterNetEvent('joaillier:drawMarker')
AddEventHandler('joaillier:drawMarker', function (boolean) 
	joaillier_markerBool = boolean
	Citizen.CreateThread(function()
		while joaillier_markerBool == true do
			Wait(0)
			if isInServiceJoaillier and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Mine d'or"].x,joaillier_blips["Mine d'or"].y,joaillier_blips["Mine d'or"].z, true) <= joaillier_blips["Mine d'or"].distanceBetweenCoords then
				TriggerServerEvent('joaillier:serverRequest', "GetOr")
				Citizen.Wait(joaillier_blips["Mine d'or"].defaultTime)
			end	
			if isInServiceJoaillier and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Usine"].x,joaillier_blips["Usine"].y,joaillier_blips["Usine"].z, true) <= joaillier_blips["Usine"].distanceBetweenCoords then
				TriggerServerEvent('joaillier:serverRequest', "GetBijoux")
				Citizen.Wait(joaillier_blips["Usine"].defaultTime)
			end
		
			if isInServiceJoaillier and  GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Bijouterie"].x,joaillier_blips["Bijouterie"].y,joaillier_blips["Bijouterie"].z, true) <= joaillier_blips["Bijouterie"].distanceBetweenCoords then
				TriggerServerEvent('joaillier:serverRequest', "SellBijoux")
				Citizen.Wait(joaillier_blips["Bijouterie"].defaultTime)
			end
		end
	end)
end)
	
RegisterNetEvent('joaillier:marker')
AddEventHandler('joaillier:marker', function ()
	Citizen.CreateThread(function () 
		while joaillier_markerBool == true do
			Citizen.Wait(1)
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Entreprise"].x, joaillier_blips["Entreprise"].y, joaillier_blips["Entreprise"].z, true) <= joaillier_blips["Entreprise"].distanceMarker then
				DrawMarker(1, joaillier_blips["Entreprise"].x, joaillier_blips["Entreprise"].y, joaillier_blips["Entreprise"].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
				ClearPrints()
				SetTextEntry_2("STRING")
				if isInServiceJoaillier then
					AddTextComponentString("Appuyez sur ~g~E~s~ pour quitter le ~b~service actif")
				else
					AddTextComponentString("Appuyez sur ~g~E~s~ pour rentrer en ~b~service actif")
				end
				DrawSubtitleTimed(2000, 1)
				if IsControlJustPressed(1, Keys["E"]) then
					GetServiceJoaillier()
				end
			end

			if isInServiceJoaillier then
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Garage"].x, joaillier_blips["Garage"].y, joaillier_blips["Garage"].z, true) <= joaillier_blips["Garage"].distanceMarker+5 then
						DrawMarker(1, joaillier_blips["Garage"].x, joaillier_blips["Garage"].y, joaillier_blips["Garage"].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Appuyez sur ~g~E~s~ pour faire appairaitre/ranger votre ~b~vehicule")
						DrawSubtitleTimed(2000, 1)
						if IsControlJustPressed(1, Keys["E"]) then
							if(existingVeh ~= nil) then
								SetEntityAsMissionEntity(existingVeh, true, true)
								Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))
								existingVeh = nil
							else
								joaillier_InitMenuVehicules()
								Menu.hidden = not Menu.hidden
							end
						end
					end
					
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Mine d'or"].x,joaillier_blips["Mine d'or"].y,joaillier_blips["Mine d'or"].z, true) <= joaillier_blips["Mine d'or"].distanceMarker then
					DrawMarker(1,joaillier_blips["Mine d'or"].x,joaillier_blips["Mine d'or"].y,joaillier_blips["Mine d'or"].z, 0, 0, 0, 0, 0, 0, 10.001, 10.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
				end
	
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Usine"].x,joaillier_blips["Usine"].y,joaillier_blips["Usine"].z, true) <= joaillier_blips["Usine"].distanceMarker then
					DrawMarker(1,joaillier_blips["Usine"].x,joaillier_blips["Usine"].y,joaillier_blips["Usine"].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
				end

				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), joaillier_blips["Bijouterie"].x,joaillier_blips["Bijouterie"].y,joaillier_blips["Bijouterie"].z, true) <= joaillier_blips["Bijouterie"].distanceMarker then
					DrawMarker(1,joaillier_blips["Bijouterie"].x,joaillier_blips["Bijouterie"].y,joaillier_blips["Bijouterie"].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
				end
				Menu.renderGUI()
			end
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

function GetServiceJoaillier()
	local playerPed = GetPlayerPed(-1)
	if isInServiceJoaillier then
		notif("Vous n\'êtes plus en service")
		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

		else

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

		end
	else
		notif("Début du service")
		TriggerEvent("joaillier:getSkin")
	end
	isInServiceJoaillier = not isInServiceJoaillier
	TriggerServerEvent('joaillier:setService', isInServiceJoaillier)
end
	
	RegisterNetEvent('joaillier:getSkin')
	AddEventHandler('joaillier:getSkin', function (source)
		local hashSkin = GetHashKey("mp_m_freemode_01")
		Citizen.CreateThread(function()
		if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then

			SetPedPropIndex(GetPlayerPed(-1), 0, 1,3, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 66, 1, 2)  -- Top
			SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 0, 2)   -- under coat
			SetPedComponentVariation(GetPlayerPed(-1), 4, 39, 1, 2)   -- Pants
			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 2)   -- shoes
			SetPedComponentVariation(GetPlayerPed(-1), 3, 66, 0, 2)   -- under skin
		else
			SetPedComponentVariation(GetPlayerPed(-1), 11, 109, 0, 2)  -- Top
			SetPedComponentVariation(GetPlayerPed(-1), 8, 1, 0, 2)   -- under coat
			SetPedComponentVariation(GetPlayerPed(-1), 4, 45, 2, 2)   -- Pants
			SetPedComponentVariation(GetPlayerPed(-1), 6, 36, 0, 2)   -- shoes
			SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 2)   -- under skin
		end
		end)
	end)
	
RegisterNetEvent('joaillier:getCar')
AddEventHandler('joaillier:getCar', function (source)
	local vehiculeDetected = GetClosestVehicle(joaillier_car.x, joaillier_car.y, joaillier_car.z, 6.0, 0, 70)
	if not DoesEntityExist(vehiculeDetected) then
		local myPed = GetPlayerPed(-1)
		local player = PlayerId()
		local vehicle = GetHashKey('burrito3')
		RequestModel(vehicle)
		while not HasModelLoaded(vehicle) do
			Wait(1)
		end
		local plate = math.random(100, 999)
		existingVeh = CreateVehicle(vehicle,joaillier_car.x, joaillier_car.y, joaillier_car.z,0.0, true, false)
		SetVehicleHasBeenOwnedByPlayer(existingVeh,true)
		local id = NetworkGetNetworkIdFromEntity(existingVeh)
		SetNetworkIdCanMigrate(id, true)
		SetEntityInvincible(existingVeh, false)
		SetVehicleOnGroundProperly(existingVeh)
		SetVehicleNumberPlateText(existingVeh, joaillier_platesuffix.." "..plate.." ")
		
		SetEntityAsMissionEntity(existingVeh, true, true)
		plate = GetVehicleNumberPlateText(existingVeh)
		TriggerServerEvent("ls:refreshid",plate,existingVeh)
		
		SetModelAsNoLongerNeeded(vehicle)
	else
		notif("Zone encombrée.")
	end
end)


RegisterNetEvent('joaillier:drawGetOr')
AddEventHandler('joaillier:drawGetOr', function (qteOr)
	if(qteOr == nil) then
		qteOr = 0
	end

	if qteOr < 55 then
		TriggerEvent('player:receiveItem',3, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~w~Récolte d'~g~Or ~w~en cours..")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous ne pouvez plus prendre d'Or")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('joaillier:drawGetBijoux')
AddEventHandler('joaillier:drawGetBijoux', function(qteOr, qteBijoux)
	if(qteOr == nil) then
		qteOr = 0
	end
	
	if(qteBijoux == nil) then
		qteBijoux = 0
	end

	if qteBijoux < 90 and qteOr > 0 then
		TriggerEvent('player:looseItem',3, 1)
		TriggerEvent('player:receiveItem',16, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Or~w~ déchargé et transformation en ~g~bijoux ~w~en cours..")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous ne pouvez plus Charger de Bijoux")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('joaillier:drawSellBijoux')
AddEventHandler('joaillier:drawSellBijoux', function (qte)
	if(qte == nil) then
		qte = 0
	end

	if qte > 0 then
		TriggerEvent('player:looseItem',16, 1)
		local salaire = math.random(joaillier_pay.minimum, joaillier_pay.maximum)
		TriggerServerEvent('mission:completed', salaire)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Vous avez vendu des Bijoux")
		DrawSubtitleTimed(2000, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous n'avez plus de Bijoux")
		DrawSubtitleTimed(2000, 1)
	end
end)

