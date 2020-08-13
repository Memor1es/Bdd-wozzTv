local canDriveBy = true



Citizen.CreateThread(function()

	while true do

		local car = GetVehiclePedIsIn(GetPlayerPed(-1), false)

		if car then 

			if GetPedInVehicleSeat(car, -1) == GetPlayerPed(-1) then

				if GetEntitySpeed(car) * 3.6 > 40.0 then

					if canDriveBy then

						canDriveBy = false

						SetPlayerCanDoDriveBy(PlayerId(), false)

					end

				else

					if not canDriveBy then

						canDriveBy = true

						SetPlayerCanDoDriveBy(PlayerId(), true)

					end

				end

			else

				if not canDriveBy then

					canDriveBy = true

					SetPlayerCanDoDriveBy(PlayerId(), true)

				end

			end

			Wait(500)

		else

			Wait(2000)

		end

	end

end)