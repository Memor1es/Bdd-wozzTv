function Notify (text)

	SetNotificationTextEntry('STRING')

	AddTextComponentString(text)

	DrawNotification(false, false)

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

function GetPlayers()

    local players = {}



    -- for i = 0, 129 do

        -- if NetworkIsPlayerActive(i) then

            -- table.insert(players, i)

        -- end

    -- end

	

	for _, player in ipairs(GetActivePlayers()) do

	    table.insert(players, player)

	end



    return players

end


RegisterNetEvent('avanyafacture:rentrerFacture')

AddEventHandler('avanyafacture:rentrerFacture', function()

	local t, distance = GetClosestPlayer()

	if(distance ~= -1 and distance < 3) then

		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 20)

		while (UpdateOnscreenKeyboard() == 0) do

			DisableAllControlActions(0);

			Wait(0);

		end

		if (GetOnscreenKeyboardResult()) then

			local res = tonumber(GetOnscreenKeyboardResult())

			if(res ~= nil and res ~= 0 and res <= 20000) then	

				TriggerServerEvent("avanyafacture:factureGranted", GetPlayerServerId(t), res)

			else

				Notify("~r~Tu a dépasser le montant maximum autorisé !")				

			end

		end

	else

		Notify("~y~Pas de client à proximité !")

	end

end)

local lockAskingFine = false

RegisterNetEvent('avanyafacture:payFacture')

AddEventHandler('avanyafacture:payFacture', function(amount, sender)

	Citizen.CreateThread(function()

		local t, distance = GetClosestPlayer()

		if(lockAskingFine ~= true) then

			lockAskingFine = true

			local notifReceivedAt = GetGameTimer()

			Notify("Appuyez sur ~g~Y~s~ pour accepter la facture de ~g~$"..amount.."~s~, Appuyez sur ~r~K~s~ pour la refuser !")

			while(true) do

				Wait(0)

				

				if (GetTimeDifference(GetGameTimer(), notifReceivedAt) > 15000) then

					TriggerServerEvent('avanyafacture:factureETA', sender, 2)

					Notify("~y~Demande de facturation expirée !")

					lockAskingFine = false

					break

				end

	

				if IsControlPressed(1, 246) then				

					TriggerServerEvent('avanyafacture:givecash', GetPlayerServerId(t), amount)					

					Notify("Vous avez payé la facture de ~g~"..amount.."$~s~.")

					TriggerServerEvent('avanyafacture:factureETA', sender, 0)

					lockAskingFine = false

					break

				end

				

				if IsControlPressed(1, 311) then

					TriggerServerEvent('avanyafacture:factureETA', sender, 3)

					Notify("~r~Vous avez refusé de payer la facture")

					lockAskingFine = false

					break

				end

			end

		else

			TriggerServerEvent('avanyafacture:factureETA', sender, 1)

		end

	end)

end)