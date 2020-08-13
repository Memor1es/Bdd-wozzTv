local areas =

{

	{shopPed = nil, ped = `mp_m_shopkeep_01`, x = -1486.321,	y = -377.7767,	z = 39.163383483886,	h = 130.93975830078},

	{shopPed = nil, ped = `mp_m_shopkeep_01`, x = 372.513,		y = 326.514,	z = 102.566,			h = 247.224},

	{shopPed = nil, ped = `mp_m_shopkeep_01`, x = 1164.719,		y = -322.5131,	z = 68.205,				h = 108.7031},

}



local currentPed = nil

local currentPos = nil



local objects = {}



local isTryingToRob = false



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



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



function EndRobbery(i)

	if not IsPedDeadOrDying(areas[i].shopPed) then

        SetEntityCoords(areas[i].shopPed, areas[i].x, areas[i].y, areas[i].z)

		RequestAnimDict("mp_am_hold_up")

		while not HasAnimDictLoaded("mp_am_hold_up") do

			Wait(10)

		end



        TaskPlayAnim(areas[i].shopPed, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0, -1, 2, 0, false, false, false)

		RemoveAnimDict("mp_am_hold_up")



        while not IsEntityPlayingAnim(areas[i].shopPed, "mp_am_hold_up", "holdup_victim_20s", 3) do Wait(0) end

        local timer = GetGameTimer() + 10800

        while timer >= GetGameTimer() do

            if IsPedDeadOrDying(areas[i].shopPed) then

                return

            end

            Wait(0)

        end



        if not IsPedDeadOrDying(areas[i].shopPed) then

            local cashRegister = GetClosestObjectOfType(GetEntityCoords(areas[i].shopPed), 5.0, GetHashKey('prop_till_01'))

            if DoesEntityExist(cashRegister) then

                CreateModelSwap(GetEntityCoords(cashRegister), 0.5, GetHashKey('prop_till_01'), GetHashKey('prop_till_01_dam'), false)

            end



            timer = GetGameTimer() + 200 

            while timer >= GetGameTimer() do

                if IsPedDeadOrDying(areas[i].shopPed) then

                    return

                end

                Wait(0)

            end



            local model = GetHashKey('prop_poly_bag_01')

            RequestModel(model)

            while not HasModelLoaded(model) do Wait(0) end

            local bag = CreateObject(model, GetEntityCoords(areas[i].shopPed), false, false)

			DecorRegister("RainbowLand", 2)

			DecorSetBool(bag, "RainbowLand", true)



			SetModelAsNoLongerNeeded(model)

                        

            AttachEntityToEntity(bag, areas[i].shopPed, GetPedBoneIndex(areas[i].shopPed, 60309), 0.1, -0.11, 0.08, 0.0, -75.0, -75.0, 1, 1, 0, 0, 2, 1)

            timer = GetGameTimer() + 10000

            while timer >= GetGameTimer() do

                if IsPedDeadOrDying(areas[i].shopPed) then

                    return

                end

                Wait(0)

            end

            if not IsPedDeadOrDying(areas[i].shopPed) then

                DetachEntity(bag, true, false)

                timer = GetGameTimer() + 75

                while timer >= GetGameTimer() do

                    if IsPedDeadOrDying(areas[i].shopPed) then

                        return

                    end

                    Wait(0)

                end

                SetEntityHeading(bag, areas[i].h)

                ApplyForceToEntity(bag, 3, vector3(0.0, 50.0, 0.0), 0.0, 0.0, 0.0, 0, true, true, false, false, true)

                table.insert(objects, {bank = i, object = bag})

                Citizen.CreateThread(function()

                    while true do

                        Wait(5)

                        if DoesEntityExist(bag) then

                            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(bag), true) <= 1.5 then

                                PlaySoundFrontend(-1, 'ROBBERY_MONEY_TOTAL', 'HUD_FRONTEND_CUSTOM_SOUNDSET', true)

								TriggerServerEvent('avanyarobberyshop:onRobberyCompleted')

								DeleteObject(bag)

                                break

                            end

                        else

                            break

                        end

                    end

                end)

            else

                DeleteObject(bag)

            end

        end



		RequestAnimDict("mp_am_hold_up")

		while not HasAnimDictLoaded("mp_am_hold_up") do

			Wait(10)

		end



        TaskPlayAnim(areas[i].shopPed, "mp_am_hold_up", "cower_intro", 8.0, -8.0, -1, 0, 0, false, false, false)

        timer = GetGameTimer() + 2500

        while timer >= GetGameTimer() do Wait(0) end

        TaskPlayAnim(areas[i].shopPed, "mp_am_hold_up", "cower_loop", 8.0, -8.0, -1, 1, 0, false, false, false)

        local stop = GetGameTimer() + 120000

        while stop >= GetGameTimer() do

            Wait(50)

        end

        if IsEntityPlayingAnim(areas[i].shopPed, "mp_am_hold_up", "cower_loop", 3) then

            ClearPedTasks(areas[i].shopPed)

        end



		RemoveAnimDict("mp_am_hold_up")

    end

end



function TryRob(currentIndex)

    local currentArea = areas[currentIndex]

	isTryingToRob = true



	local dict = "missheist_agency2ahands_up"

	RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do

        Wait(10)

    end



    TaskPlayAnim(currentArea.shopPed, dict, "handsup_anxious", 8.0, -8.0, -1, 1, 0, false, false, false)

	RemoveAnimDict(dict)



	local scared = 0

    while scared < 100 do

		if (GetDistanceBetweenCoords(GetEntityCoords(currentPed), GetEntityCoords(currentArea.shopPed), true) > 7.0) or IsPedDeadOrDying(currentArea.shopPed) then

			TriggerEvent('chatMessage', "", {0, 255, 0}, "T'es parti trop tot, braquage annule !")

			return

		end



        local sleep = 500

        SetEntityAnimSpeed(currentArea.shopPed, "missheist_agency2ahands_up", "handsup_anxious", 1.0)

        if IsPlayerFreeAiming(PlayerId()) then

            sleep = 250

            SetEntityAnimSpeed(currentArea.shopPed, "missheist_agency2ahands_up", "handsup_anxious", 1.5)

        end



        if IsPedArmed(currentPed, 7) then

			if GetAmmoInClip(currentPed, GetSelectedPedWeapon(currentPed)) > 0 then

				if IsControlPressed(0, 24) then

					sleep = 150

					SetEntityAnimSpeed(currentArea.shopPed, "missheist_agency2ahands_up", "handsup_anxious", 2.5)

				end

			end

        end



        sleep = GetGameTimer() + sleep

        while sleep >= GetGameTimer() and not IsPedDeadOrDying(currentArea.shopPed) do

            Wait(0)

            DrawRect(0.5, 0.4, 0.2, 0.03, 75, 75, 75, 200)

            local draw = scared/500

            DrawRect(0.5, 0.4, draw, 0.03, 0, 221, 255, 200)

        end

        scared = scared + 1

    end



	EndRobbery(currentIndex)

end



Citizen.CreateThread(function()

	Citizen.Wait(10000)



	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)



Citizen.CreateThread(function ()

	Citizen.Wait(10000)



	local newBlip



	for k,item in pairs(areas) do

		if not DoesEntityExist(item.currentPed) then

			RequestModel(item.ped)

			while not HasModelLoaded(item.ped) do

				Citizen.Wait(1)

			end



			item.shopPed = CreatePed(5, item.ped, item.x, item.y, item.z, item.h, false, false)

			DecorRegister("RainbowLand", 2)

			DecorSetBool(item.shopPed, "RainbowLand", true)



			SetModelAsNoLongerNeeded(item.ped)



			SetEntityAsMissionEntity(item.shopPed, true, true)

			SetPedRelationshipGroupHash(item.shopPed, GetHashKey("CIVMALE"))

			SetPedHearingRange(item.shopPed, 0.0)

			SetPedSeeingRange(item.shopPed, 0.0)

			SetPedAlertness(item.shopPed, 0.0)

			SetPedFleeAttributes(item.shopPed, 0, 0)

			SetBlockingOfNonTemporaryEvents(item.shopPed, true)

			SetPedCombatAttributes(item.shopPed, 46, true)

			SetPedFleeAttributes(item.shopPed, 0, 0)

			SetEntityInvincible(item.shopPed, false)

			FreezeEntityPosition(item.shopPed, true)



			newBlip = AddBlipForCoord(item.x, item.y, item.z)

			SetBlipSprite(newBlip, 430)

			SetBlipScale(newBlip, 1.0)

			SetBlipAsShortRange(newBlip, true)

			BeginTextCommandSetBlipName("STRING")

			AddTextComponentString("Superette")

			EndTextCommandSetBlipName(newBlip)

		end

	end

end)



Citizen.CreateThread(function()

	Citizen.Wait(15000)



	while true do

		if not isTryingToRob then

			for index, item in pairs(areas) do

				local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, currentPos.x, currentPos.y, currentPos.z, true)

				if(distance < 6.0) then

					if IsPlayerTargettingAnything(PlayerId()) or IsPlayerFreeAiming(PlayerId()) and IsPedArmed(currentPed, 7) then

						DisplayHelpText("~INPUT_CONTEXT~ Pour lancer le braquage !")



						if(IsControlJustReleased(1, 51))then

							if exports.metiers:getIsInService() or exports.metiers:getIsCop() then

								TriggerEvent('chatMessage', "", {0, 255, 0}, "T'es un flic, tu ne peux pas braquer !")

							else

								TriggerServerEvent('police:isSupRobbable', index)

								Citizen.Wait(5000)

							end

						end

					end

				end

			end

		end



		Citizen.Wait(1)

	end

end)


RegisterNetEvent('avanyarobberyshop:isRobpossible')
AddEventHandler('avanyarobberyshop:isRobpossible', function(index, cops)
    local neededNumberOfCops = 2
    if cops < neededNumberOfCops then
        TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage", false, "Braquage ~r~non autorisé~w~. Manque de policer (min : ~y~" .. neededNumberOfCops .. "~w~).")
    else
        TriggerServerEvent('avanyarobberyshop:tryRob', index)
    end
end)

RegisterNetEvent('avanyarobberyshop:startRobbing')

AddEventHandler('avanyarobberyshop:startRobbing', function(i)

	TryRob(i)

end)



local currentBlip

RegisterNetEvent("avanyarobberyshop:warnClient")

AddEventHandler("avanyarobberyshop:warnClient", function(index)

	if exports.metiers:getIsCop() then

		local currentArea = areas[index]



		TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Braquage de superette", false, "GPS mis a jour ! vas-y fonce !")



		RemoveBlip(currentBlip)



		currentBlip = AddBlipForCoord(currentArea.x, currentArea.y, currentArea.z)

		SetBlipSprite(currentBlip, 432)

		SetBlipScale(currentBlip, 1.5)

		SetBlipAsShortRange(currentBlip, true)

		BeginTextCommandSetBlipName("STRING")

		AddTextComponentString("Braquage de superette")

		EndTextCommandSetBlipName(currentBlip)



		SetNewWaypoint(currentArea.x, currentArea.y)

	end

end)