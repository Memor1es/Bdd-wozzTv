	local pecheur_blipsTemp

	local pecheur_markerBool = false

	local existingVeh = nil

	local isInServicePecheur = false



	function pecheur_callSE(evt)

		Menu.hidden = not Menu.hidden

		Menu.renderGUI()

		TriggerServerEvent(evt)

	end



	function pecheur_InitMenuVehicules()

		MenuTitle = "Vehicules"

		ClearMenu()

		--Menu.addButton("Bateau", "pecheur_callSE", 'pecheur:Car')

		Menu.addButton("Camionnette", "pecheur_callSE", 'pecheur:Car2')	

	end

	

		function getIsInServicePecheur()

	return isInServicePecheur

    end





	RegisterNetEvent('pecheur:drawBlips')

	AddEventHandler('pecheur:drawBlips', function () 

		for key, item in pairs(pecheur_blips) do

			item.blip = AddBlipForCoord(item.x, item.y, item.z)

			SetBlipSprite(item.blip, item.id)

			SetBlipAsShortRange(item.blip, true)

			BeginTextCommandSetBlipName("STRING")

			AddTextComponentString(key)

			EndTextCommandSetBlipName(item.blip)

		end

		pecheur_blipsTemp = pecheur_blips



	end)



	RegisterNetEvent('pecheur:deleteBlips')

	AddEventHandler('pecheur:deleteBlips', function ()

		pecheur_markerBool = false

		for _, item in pairs(pecheur_blipsTemp) do

			RemoveBlip(item.blip)

		end

	end)



	RegisterNetEvent('pecheur:drawMarker')

	AddEventHandler('pecheur:drawMarker', function (boolean) 

		pecheur_markerBool = boolean

		Citizen.CreateThread(function()

			while pecheur_markerBool == true do

				Wait(0)

				

				if isInServicePecheur and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), pecheur_blips["Peche"].x,pecheur_blips["Peche"].y,pecheur_blips["Peche"].z, true) <= pecheur_blips["Peche"].distanceBetweenCoords then

					TriggerServerEvent('pecheur:serverRequest', "GetPoisson")

					Citizen.Wait(pecheur_blips["Peche"].defaultTime)

				end	

			

				if isInServicePecheur and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), pecheur_blips["Poissonerie"].x,pecheur_blips["Poissonerie"].y,pecheur_blips["Poissonerie"].z, true) <= pecheur_blips["Poissonerie"].distanceBetweenCoords then

					TriggerServerEvent('pecheur:serverRequest', "GetFilet")

					Citizen.Wait(pecheur_blips["Poissonerie"].defaultTime)

				end

			

				if isInServicePecheur and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), pecheur_blips["Point de vente"].x,pecheur_blips["Point de vente"].y,pecheur_blips["Point de vente"].z, true) <= pecheur_blips["Point de vente"].distanceBetweenCoords then

					TriggerServerEvent('pecheur:serverRequest', "SellFilet")

					Citizen.Wait(pecheur_blips["Point de vente"].defaultTime)

				end



			end

		end)

	end)



	RegisterNetEvent('pecheur:marker')

	AddEventHandler('pecheur:marker', function ()

		Citizen.CreateThread(function () 

			while pecheur_markerBool do

				Citizen.Wait(1)

				local distanceFromService = GetDistanceBetweenCoords(pecheur_blips["Entreprise"].x, pecheur_blips["Entreprise"].y, pecheur_blips["Entreprise"].z, GetEntityCoords(GetPlayerPed(-1)), true)

				if(distanceFromService < 15) then

					if isInServicePecheur then

						DrawMarker(25, pecheur_blips["Entreprise"].x, pecheur_blips["Entreprise"].y, pecheur_blips["Entreprise"].z + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 125, 0, 0, 50, 0, 0, 2, 0, 0, 0, 0)

					else

						DrawMarker(25, pecheur_blips["Entreprise"].x, pecheur_blips["Entreprise"].y, pecheur_blips["Entreprise"].z + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 125, 0, 50, 0, 0, 2, 0, 0, 0, 0)

					end

				end

				if(distanceFromService < 2.0) then

					if isInServicePecheur then

						DisplayHelpText("~INPUT_CONTEXT~ ~r~Quitter le service")

					else

						DisplayHelpText("~INPUT_CONTEXT~ ~g~Prendre le service")

					end

					if IsControlJustPressed(1, Keys["E"]) then

						GetServicePecheur()

					end

				end



				if isInServicePecheur then

					local distanceFromGarage = GetDistanceBetweenCoords(pecheur_blips["Garage"].x, pecheur_blips["Garage"].y, pecheur_blips["Garage"].z, GetEntityCoords(GetPlayerPed(-1)), true)

					if(distanceFromGarage < 15) then

						DrawMarker(25, pecheur_blips["Garage"].x, pecheur_blips["Garage"].y, pecheur_blips["Garage"].z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 255, 50, 0, 0, 2, 0, 0, 0, 0)

					end

					if(distanceFromGarage < 2.0) then

						DisplayHelpText("~INPUT_CONTEXT~ Sortir/Ranger un vehicule")

						if IsControlJustPressed(1, Keys["E"]) then

							if(existingVeh ~= nil) then

								SetEntityAsMissionEntity(existingVeh, true, true)

								Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))

								Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(existingVeh))

								existingVeh = nil

							else

								pecheur_InitMenuVehicules()

								Menu.hidden = not Menu.hidden

							end

						end

					end



					Menu.renderGUI()



					--local distanceFromRecolt = GetDistanceBetweenCoords(pecheur_blips["Peche"].x, pecheur_blips["Peche"].y, pecheur_blips["Peche"].z, GetEntityCoords(GetPlayerPed(-1)), true)

					--if(distanceFromRecolt < 15) then

					--	DrawMarker(25, pecheur_blips["Peche"].x, pecheur_blips["Peche"].y, pecheur_blips["Peche"].z + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 255, 50, 0, 0, 2, 0, 0, 0, 0)

					--end

					--

					--local distanceFromTreatment = GetDistanceBetweenCoords(pecheur_blips["Poissonerie"].x,pecheur_blips["Poissonerie"].y,pecheur_blips["Poissonerie"].z, GetEntityCoords(GetPlayerPed(-1)), true)

					--if(distanceFromTreatment < 15) then

					--	DrawMarker(25, pecheur_blips["Poissonerie"].x,pecheur_blips["Poissonerie"].y,pecheur_blips["Poissonerie"].z + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 255, 50, 0, 0, 2, 0, 0, 0, 0)

					--end

					--

					--local distanceFromSell = GetDistanceBetweenCoords(pecheur_blips["Poissonerie"].x,pecheur_blips["Poissonerie"].y,pecheur_blips["Poissonerie"].z, GetEntityCoords(GetPlayerPed(-1)), true)

					--if(distanceFromSell < 15) then

					--	DrawMarker(25, pecheur_blips["Point de vente"].x, pecheur_blips["Point de vente"].y, pecheur_blips["Point de vente"].z + 0.01, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 255, 50, 0, 0, 2, 0, 0, 0, 0)

					--end

				end

			end

		end)

	end)



function GetServicePecheur()

	local playerPed = GetPlayerPed(-1)

	if isInServicePecheur then

		notif("Vous n\'êtes plus en service")

		if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_m_freemode_01")

		else

			TriggerServerEvent("clothing_shop:SpawnPlayer_server", "mp_f_freemode_01")

		end

	else

		notif("Début du service")

		TriggerEvent("pecheur:getSkin")

	end

	isInServicePecheur = not isInServicePecheur

	TriggerServerEvent('pecheur:setService', isInServicePecheur)

end

	RegisterNetEvent('pecheur:getSkin')

	AddEventHandler('pecheur:getSkin', function (source)

	local hashSkin = GetHashKey("mp_m_freemode_01")

	Citizen.CreateThread(function()

		if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then

			SetPedPropIndex(GetPlayerPed(-1), 0, 105,7, 0)

			SetPedComponentVariation(GetPlayerPed(-1), 11, 208, 7, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 4, 89, 7, 2)

			SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 1, 2)

		end

	end)

	end)

	

RegisterNetEvent('pecheur:getCar')

AddEventHandler('pecheur:getCar', function (source)

	local vehiculeDetected = GetClosestVehicle(pecheur_car.x, pecheur_car.y, pecheur_car.z, 6.0, 0, 70)

	if not DoesEntityExist(vehiculeDetected) then

		local myPed = GetPlayerPed(-1)

		local player = PlayerId()

		local vehicle = GetHashKey('tug')

		RequestModel(vehicle)

		while not HasModelLoaded(vehicle) do

			Wait(1)

		end

		local plate = math.random(100, 900)

		existingVeh = CreateVehicle(vehicle,pecheur_car.x, pecheur_car.y, pecheur_car.z, 186.058, true, false)

		DecorRegister("RainbowLand", 2)

		DecorSetBool(existingVeh, "RainbowLand", true)

		SetVehicleHasBeenOwnedByPlayer(existingVeh,true)

		local id = NetworkGetNetworkIdFromEntity(existingVeh)

		SetNetworkIdCanMigrate(id, true)

		SetEntityInvincible(existingVeh, false)

		SetVehicleOnGroundProperly(existingVeh)

		

		SetEntityAsMissionEntity(existingVeh, true, true)

		plate = GetVehicleNumberPlateText(existingVeh)

		TriggerServerEvent("ls:refreshid",plate,existingVeh)

		

		SetModelAsNoLongerNeeded(vehicle)

	else

		notif("Zone encombrée.")

	end

	

end)



RegisterNetEvent('pecheur:getCar2')

AddEventHandler('pecheur:getCar2', function (source)

	local vehiculeDetected = GetClosestVehicle(pecheur_car2.x, pecheur_car2.y, pecheur_car2.z, 6.0, 0, 70)

	if not DoesEntityExist(vehiculeDetected) then

		local myPed = GetPlayerPed(-1)

		local player = PlayerId()

		local vehicle = GetHashKey('paradise')

		RequestModel(vehicle)

		while not HasModelLoaded(vehicle) do

			Wait(1)

		end

		local plate = math.random(100, 900)

		existingVeh = CreateVehicle(vehicle,pecheur_car2.x, pecheur_car2.y, pecheur_car2.z, 186.058, true, false)

		DecorRegister("RainbowLand", 2)

		DecorSetBool(existingVeh, "RainbowLand", true)

		SetVehicleHasBeenOwnedByPlayer(existingVeh,true)

		local id = NetworkGetNetworkIdFromEntity(existingVeh)

		SetNetworkIdCanMigrate(id, true)

		SetEntityInvincible(existingVeh, false)

		SetVehicleOnGroundProperly(existingVeh)

		SetModelAsNoLongerNeeded(vehicle)

	else

		notif("Zone encombrée.")

	end

	

end)



	RegisterNetEvent('pecheur:drawGetPoisson')

	AddEventHandler('pecheur:drawGetPoisson', function (qtePoisson)

		if(qtePoisson == nil) then

			qtePoisson = 0

		end



		if qtePoisson < 56 then

			TriggerEvent('player:receiveItem',21, 1)

			ClearPrints()

			SetTextEntry_2("STRING")

			AddTextComponentString("~g~Vous avez recu un poisson")

			DrawSubtitleTimed(4500, 1)

		else

			ClearPrints()

			SetTextEntry_2("STRING")

			AddTextComponentString("~r~Vous ne pouvez plus pecher")

			DrawSubtitleTimed(2000, 1)

		end

	end)



	RegisterNetEvent('pecheur:drawGetFilet')

	AddEventHandler('pecheur:drawGetFilet', function(qtePoisson, qteFilet)

		if(qtePoisson == nil) then

			qtePoisson = 0

		end

		

		if(qteFilet == nil) then

			qteFilet = 0

		end



		if qteFilet < 90 and qtePoisson > 0 then

			TriggerEvent('player:looseItem',21, 1)

			TriggerEvent('player:receiveItem',22, 1)

			ClearPrints()

			SetTextEntry_2("STRING")

			AddTextComponentString("~g~Poisson decoupe en filet")

			DrawSubtitleTimed(4500, 1)

		else

			ClearPrints()

			SetTextEntry_2("STRING")

			AddTextComponentString("~r~Vous ne pouvez plus decouper de poisson")

			DrawSubtitleTimed(2000, 1)

		end

	end)



	RegisterNetEvent('pecheur:drawSellFilet')

	AddEventHandler('pecheur:drawSellFilet', function (qte)

		if(qte == nil) then

			qte = 0

		end



		if qte > 0 then

			TriggerEvent('player:looseItem',22, 1)

			local salaire = math.random(pecheur_pay.minimum, pecheur_pay.maximum)

			TriggerServerEvent('mission:completed', salaire)

			ClearPrints()

			SetTextEntry_2("STRING")

			AddTextComponentString("~g~Vous avez vendu un filet")

			DrawSubtitleTimed(2000, 1)

		else

			ClearPrints()

			SetTextEntry_2("STRING")

			AddTextComponentString("~r~Vous n'avez plus de filet")

			DrawSubtitleTimed(2000, 1)

		end

	end)

	

		