local coords = {x = 1025.812, y = -3101.339, z = -38.99987 }



local function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

currentPed = nil

currentPos = nil



Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)


Citizen.CreateThread(function()

	Citizen.Wait(10000)



	while true do

		if(Vdist(coords.x, coords.y, coords.z, currentPos.x, currentPos.y, currentPos.z) < 20.0) then

			DrawMarker(25, coords.x, coords.y, coords.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 205, 0, 60, 0,0, 0,0)

			if(Vdist(coords.x, coords.y, coords.z, currentPos.x, currentPos.y, currentPos.z) < 1.5) then

				DisplayHelpText("~INPUT_CONTEXT~ Vendre bijoux/Lingots !")

				if IsControlJustPressed(1, 51) then

					TriggerEvent('player:sellItemSale', 16, 3000)

					Citizen.Wait(250)
					
				end

			end

		end



		Citizen.Wait(1)

	end

end)