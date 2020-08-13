---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-------------------------------- Système de fouille par Bajà --------------------------------------------------
--------------------------------- Développé pour Avanya -------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

-- Config

local waitTime = 7000

local maxDistanceToSearch = 2



local function GetPlayers()

    local players = {}



    for i = 0, 256 do

        if NetworkIsPlayerActive(i) then

            table.insert(players, i)

        end

    end



    return players

end



local function GetClosestPlayer()

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



local function Notify(icon, title, desc, text)

	Citizen.CreateThread(function()

		Wait(1)

		SetNotificationTextEntry("STRING");

		AddTextComponentString(text);

		SetNotificationMessage(icon, icon, true, 1, title, desc, text);

		DrawNotification(false, true);

	end)

end



RegisterNetEvent("avanyafouille:checkInventoryC")

AddEventHandler("avanyafouille:checkInventoryC", function()	



	t, distance = GetClosestPlayer()

	if(distance ~= -1 and distance <= maxDistanceToSearch) then

		TriggerEvent('gc:playAmination', "missfam5_yoga", "start_pose", 500)

		Citizen.Wait(500)

		TriggerEvent('gc:playAmination', "missbigscore2aig_7@driver", "boot_r_loop", 1500)

		Citizen.Wait(1500)

		TriggerEvent('gc:playAmination', "mini@yoga", "outro_2", 2000)

		Citizen.Wait(2000)

		TriggerEvent('gc:playAmination', "missfam5_yoga", "start_pose", 500)

		Citizen.Wait(500)

		TriggerEvent('gc:playAmination', "missbigscore2aig_7@driver", "boot_r_loop", 1500)

		Citizen.Wait(1500)

		TriggerEvent('gc:playAmination', "mini@yoga", "outro_2", 2000)

		Citizen.Wait(2000)



		ClearPedTasks(ped)



		t, distance = GetClosestPlayer()

		if(distance ~= -1 and distance <= maxDistanceToSearch) then

			TriggerServerEvent("avanyafouille:checkInventoryS", GetPlayerServerId(t))

		else

			TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Le type est parti !")

		end

	else



		TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Je devrais peut etre m'approcher")

	end



end)

RegisterNetEvent('avanyafouille:warningFouille')

AddEventHandler('avanyafouille:warningFouille', function()

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Quelqu'un vient de me fouiller !")

end)

RegisterNetEvent('avanyafouille:showItems')

AddEventHandler('avanyafouille:showItems', function(sitems)

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, sitems)

end)

RegisterNetEvent('avanyafouille:showMoney')

AddEventHandler('avanyafouille:showMoney', function(smoney)

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, smoney)

end)



RegisterNetEvent('avanyafouille:showWeapon')

AddEventHandler('avanyafouille:showWeapon', function(sweapon)

	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, sweapon)

end)