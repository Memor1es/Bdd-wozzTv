-----------------------------------------------------------
-----------------------------------------------------------
---------------------- INFOS ILLEGAL ----------------------
------------------- DEVELOPPER PAR BAJA -------------------
-----------------------------------------------------------
-----------------------------------------------------------

local coords = { ['x'] = 1268.616, ['y'] = -1710.157, ['z'] = 54.77149}

Citizen.CreateThread(function()

	Citizen.Wait(500)

	while true do

		Citizen.Wait(0)

		local pos = GetEntityCoords(GetPlayerPed(-1), false)

		if(Vdist(coords.x, coords.y, coords.z, pos.x, pos.y, pos.z) < 2.5) then

			DisplayHelpText("~INPUT_CONTEXT~ Prendre des infos")

			if(IsControlJustReleased(1, 51))then

				Notify("~r~Cambriolage~s~ : Va acheter un Boxville, attends la nuit.. je dirai entre 00h et 05h30 du matin.")

				Citizen.Wait(3000)
				
				Notify("Place toi en conducteur et appuie sur le ~g~bouton [E]~s~ de ton tableau de bord.")

				Citizen.Wait(3000)

			end

		end

	end

end)

function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

function Notify(str)

	SetNotificationTextEntry("STRING")

	AddTextComponentString(str)

	DrawNotification(false, false)

end