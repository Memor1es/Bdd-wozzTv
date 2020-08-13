---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------- Blanchiement par Bajà ------------------------------------------------------
---------------------------------- Développé pour Avanya ------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------



local waitTime = 5000

local coords = { ['x'] = 859.1207, ['y'] = 2877.289, ['z'] = 57.98275 }



Citizen.CreateThread(function()

	Citizen.Wait(500)



	while true do

		Citizen.Wait(0)



		local pos = GetEntityCoords(GetPlayerPed(-1), false)



		if(Vdist(coords.x, coords.y, coords.z, pos.x, pos.y, pos.z) < 2.5) then

			DisplayHelpText("~INPUT_CONTEXT~ Blanchir de l'argent (40% de perte)")

			if(IsControlJustReleased(1, 51))then

				TryCleanDirtyMoney()

			end

		end

	end

end)



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



function TryCleanDirtyMoney()

	local value = GetValue()

	if value ~= 0 then

		local ped = GetPlayerPed(-1)



		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, false)

		Wait(waitTime)

		ClearPedTasks(ped)



        TriggerServerEvent('avanyablanchi:addMoneyServer', value)
        TriggerEvent("es_freeroam:notify", "CHAR_LESTER_DEATHWISH", 1, "Blanchisseur", false, "Vous avez blanchi votre argent !")



		Wait(10000)

	end

end



function GetValue()

	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 7)

	while (UpdateOnscreenKeyboard() == 0) do

		DisableAllControlActions(0);

		Wait(0);

	end

	if (GetOnscreenKeyboardResult()) then

		local res = tonumber(GetOnscreenKeyboardResult())

		if(res ~= nil and res ~= 0) then 

			return res		

		end

	end

	return 0

end