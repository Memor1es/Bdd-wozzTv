local spawnPos = { ['x'] = 13.46836, ['y'] = -1097.295, ['z'] = 29.83474 }

local removePos = { ['x'] = 8.07319, ['y'] = -1097.593, ['z'] = 29.79703 }

local mannequins = {}



local mannequinsPos =  {

	{ ['x'] = 25.72337, ['y'] = -1077.268, ['z'] = 29.79703 },

	{ ['x'] = 16.61473, ['y'] = -1073.31, ['z'] = 29.79703 },

	{ ['x'] = 17.55754, ['y'] = -1078.357, ['z'] = 29.79703 },

	{ ['x'] = 23.1002, ['y'] = -1080.651, ['z'] = 29.79703 },

	{ ['x'] = 17.33123, ['y'] = -1083.064, ['z'] = 29.79704 },

	{ ['x'] = 19.6833, ['y'] = -1084.28, ['z'] = 29.79704 },

	{ ['x'] = 13.24034, ['y'] = -1086.717, ['z'] = 29.79703 },

	{ ['x'] = 20.79028, ['y'] = -1089.704, ['z'] = 29.79589 }

}



function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end



function RemoveOldPeds()

	for index,value in ipairs(mannequins) do

		DeleteEntity(value)

		mannequins[index] = nil

	end



	ClearAreaOfEverything(18.94864, -1082.618, 29.79703, 20.0, false, false, false, false)

end



function SpawnPeds()

	RemoveOldPeds()



	local hash = GetHashKey("g_m_m_chicold_01")

	while not HasModelLoaded(hash) do

		RequestModel(hash)

		Wait(20)

	end

	

	local ped

	

	for index,value in ipairs(mannequinsPos) do

		ped = CreatePed(4, hash, value.x, value.y, value.z+1, 180.0, true, true)

		DecorRegister("RainbowLand", 2)

		DecorSetBool(ped, "RainbowLand", true)

		SetBlockingOfNonTemporaryEvents(ped, true)

		SetPedCombatAttributes(ped, 46, true)

		SetPedFleeAttributes(ped, 0, 0)

		table.insert(mannequins, ped)

	end



	SetEntityAsNoLongerNeeded(hash)



	Citizen.Wait(30000)



	RemoveOldPeds()

end



Citizen.CreateThread(function()

	Citizen.Wait(1000)



	while true do		

		if(Vdist(spawnPos.x, spawnPos.y, spawnPos.z, GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z) < 20.0) then

			DrawMarker(1, spawnPos.x, spawnPos.y, spawnPos.z - 1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 0, 0, 255, 50, 0,0, 0,0)

			if(Vdist(spawnPos.x, spawnPos.y, spawnPos.z, GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z) < 1.5) then

				DisplayHelpText("~INPUT_CONTEXT~ Pour ~g~ajouter~w~ des mannequins pour 1min")

				if(IsControlJustReleased(1, 51))then

					SpawnPeds()

				end

			end

		end



		Citizen.Wait(1)

	end

end)