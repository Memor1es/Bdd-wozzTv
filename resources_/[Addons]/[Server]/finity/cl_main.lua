myServerID = 0



RegisterNetEvent("avanyafinity:tryspecGetCoords")

AddEventHandler("avanyafinity:tryspecGetCoords", function(otherSource)

	local myCoords = GetEntityCoords(GetPlayerPed(-1))

	TriggerServerEvent("avanyafinity:trySpecSendCoords", otherSource, myCoords)

end)



local oldCoords

local localID = 1337

local isSpectating = false



RegisterNetEvent("avanyafinity:teleprotandspec")

AddEventHandler("avanyafinity:teleprotandspec", function(coords, serverID)

	oldCoords = GetEntityCoords(GetPlayerPed(-1))

	SetEntityVisible(GetPlayerPed(-1), false, true)

	Citizen.Wait(200)

	SetEntityCoords(GetPlayerPed(-1), coords.x, coords.y, coords.z + 20, 1, 0, 0, 1)

	Citizen.Wait(200)

	FreezeEntityPosition(GetPlayerPed(-1), true)



	Citizen.Wait(1000)



	localID = 1337

	local localplayers = {}

	for _, i in ipairs(GetActivePlayers()) do

		if GetPlayerServerId(i) == serverID then

			localID = i

		end

	end



	if localID ~= 1337 then

		NetworkSetInSpectatorMode(true, GetPlayerPed(localID))



		isSpectating = true

		while isSpectating do

			if(IsControlJustReleased(1, 47)) or not NetworkIsInSpectatorMode() then

				NetworkSetInSpectatorMode(false, GetPlayerPed(localID))



				isSpectating = false



				SetEntityCoords(GetPlayerPed(-1), oldCoords.x, oldCoords.y, oldCoords.z, 1, 0, 0, 1)



				SetEntityVisible(GetPlayerPed(-1), true, true)



				FreezeEntityPosition(GetPlayerPed(-1), false)

			end

			Citizen.Wait(0)

		end

	else

		SetEntityCoords(GetPlayerPed(-1), oldCoords.x, oldCoords.y, oldCoords.z, 1, 0, 0, 1)



		SetEntityVisible(GetPlayerPed(-1), true, true)



		FreezeEntityPosition(GetPlayerPed(-1), false)

	end

end)



RegisterNetEvent("avanyafinity:initSpec")

AddEventHandler("avanyafinity:initSpec", function(otherSource)

	if isSpectating then

		NetworkSetInSpectatorMode(false, GetPlayerPed(localID))



		isSpectating = false



		SetEntityCoords(GetPlayerPed(-1), oldCoords.x, oldCoords.y, oldCoords.z, 1, 0, 0, 1)



		SetEntityVisible(GetPlayerPed(-1), true, true)



		FreezeEntityPosition(GetPlayerPed(-1), false)

	end



	TriggerServerEvent("avanyafinity:initialSpec", otherSource)

end)



Citizen.CreateThread(function()

    Citizen.Wait(20000)

    while true do

		ClearPedBloodDamage(GetPlayerPed(-1))

		Citizen.Wait(10000)

    end

end)