local piggyBackInProgress = false



local function GetClosestPlayerRadius(radius)

    local players = GetPlayers()

    local closestDistance = -1

    local closestPlayer = -1

    local ply = GetPlayerPed(-1)

    local plyCoords = GetEntityCoords(ply, 0)



    for index,value in ipairs(players) do

        local target = GetPlayerPed(value)

        if(target ~= ply) then

            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)

            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)

            if(closestDistance == -1 or closestDistance > distance) then

                closestPlayer = value

                closestDistance = distance

            end

        end

    end

	if closestDistance <= radius then

		return closestPlayer

	else

		return nil

	end

end



RegisterNetEvent('piggyback:toggle')

AddEventHandler('piggyback:toggle', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)

	local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

	local distanceFrom1v1 = GetDistanceBetweenCoords(-14.5228, 7337.042, 155.0157, plyCoords['x'], plyCoords['y'], plyCoords['z'], true)

    if (distanceFrom1v1 > 100.0) then

		if not piggyBackInProgress then

			local player = PlayerPedId()	

			lib = 'anim@arena@celeb@flat@paired@no_props@'

			anim1 = 'piggyback_c_player_a'

			anim2 = 'piggyback_c_player_b'

			distans = -0.07

			distans2 = 0.0

			height = 0.45

			spin = 0.0		

			length = 100000

			controlFlagMe = 49

			controlFlagTarget = 33

			animFlagTarget = 1

			local closestPlayer = GetClosestPlayerRadius(2)

			target = GetPlayerServerId(closestPlayer)

			if closestPlayer ~= nil then

				piggyBackInProgress = true

				print("triggering cmg2_animations:sync")

				TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)

			else

				print("Aucun joueur assez proche")

			end

		else

			piggyBackInProgress = false

			ClearPedSecondaryTask(GetPlayerPed(-1))

			DetachEntity(GetPlayerPed(-1), true, false)

			local closestPlayer = GetClosestPlayerRadius(2)

			if closestPlayer ~= nil then

				target = GetPlayerServerId(closestPlayer)

				TriggerServerEvent("cmg2_animations:stop", target)

			end

		end

    end

end)



RegisterNetEvent('cmg2_animations:syncTarget')

AddEventHandler('cmg2_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)

	local playerPed = GetPlayerPed(-1)

	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	piggyBackInProgress = true

	print("triggered cmg2_animations:syncTarget")

	RequestAnimDict(animationLib)



	while not HasAnimDictLoaded(animationLib) do

		Citizen.Wait(10)

	end

	if spin == nil then spin = 180.0 end

	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)

	if controlFlag == nil then controlFlag = 0 end

	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	RemoveAnimDict(animationLib)

end)



RegisterNetEvent('cmg2_animations:syncMe')

AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)

	local playerPed = GetPlayerPed(-1)

	print("triggered cmg2_animations:syncMe")

	RequestAnimDict(animationLib)



	while not HasAnimDictLoaded(animationLib) do

		Citizen.Wait(10)

	end

	Wait(500)

	if controlFlag == nil then controlFlag = 0 end

	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	RemoveAnimDict(animationLib)



	Citizen.Wait(length)

end)



RegisterNetEvent('cmg2_animations:cl_stop')

AddEventHandler('cmg2_animations:cl_stop', function()

	piggyBackInProgress = false

	ClearPedSecondaryTask(GetPlayerPed(-1))

	DetachEntity(GetPlayerPed(-1), true, false)

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





Citizen.CreateThread(function()

	while true do

		if piggyBackInProgress then

			DisablePlayerFiring(PlayerId(), true)

			DisableControlAction(0, 21,true) -- disable sprint

			DisableControlAction(0, 22, true)

			DisableControlAction(0, 24, true)

			DisableControlAction(0, 25, true)



			DisableControlAction(0,47,true) -- disable weapon

			DisableControlAction(0,58,true) -- disable weapon



			DisableControlAction(0, 257, true)

			DisableControlAction(0, 263, true)

			DisableControlAction(0, 264, true)



			DisableControlAction(0,140,true) -- disable melee

			DisableControlAction(0,141,true) -- disable melee

			DisableControlAction(0,142,true) -- disable melee

			DisableControlAction(0,143,true) -- disable melee



			Citizen.Wait(1)

		else

			Citizen.Wait(100)

		end

	end

end)