print("^0======================================================================^7")
print("^0[^4Author^0] ^7 WozzTV^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")

local para = {
	["parachute1"] = {
		position = { ['x'] = 454.8185, ['y'] = 5584.343, ['z'] = 781.2034 },
		nompara = "Obtenir un parachute",
	},
	["parachute2"] = {
		position = { ['x'] = 1-80.7721328735352, ['y'] = -825.642822265625, ['z'] = 326.083953857422 },
		nompara = "Obtenir un parachute",
	},
	["parachute3"] = {
		position = { ['x'] = -128.143, ['y'] = -596.1727, ['z'] = 201.7354 },
		nompara = "Obtenir un parachute",
	},
	["parachute4"] = {
		position = { ['x'] = -1136.317, ['y'] = 4659.592, ['z'] = 243.9243 },
		nompara = "Obtenir un parachute",
	},
	["parachute5"] = {
		position = { ['x'] = 1665.401, ['y'] = -27.96845, ['z'] = 196.9363 },
		nompara = "Obtenir un parachute",
	},
	["parachute6"] = {
		position = { ['x'] = -546.6611, ['y'] = -2229.825, ['z'] = 122.3656 },
		nompara = "Obtenir un parachute",
	},
	["parachute7"] = {
		position = { ['x'] = -119.712, ['y'] = -976.443, ['z'] = 296.197 },
		nompara = "Obtenir un parachute",
	},
	["parachute8"] = {
		position = { ['x'] = -1070.658, ['y'] = -2868.311, ['z'] = 13.95186 },
		nompara = "Obtenir un parachute",
	},

	["parachute9"] = {
		position = { ['x'] = 1758.377, ['y'] = 3297.559, ['z'] = 41.1479 },
		nompara = "Obtenir un parachute",
	},
	["parachute10"] = {
		position = { ['x'] = 2122.915, ['y'] = 4784.773, ['z'] = 40.97 },
		nompara = "Obtenir un parachute",
	},
	["parachute11"] = {
		position = { ['x'] = -941.6469, ['y'] = -2955.152, ['z'] = 13.945 },
		nompara = "Obtenir un parachute",
	},
}


-- blips
--Citizen.CreateThread(function()
--	for k,v in pairs(para) do
--		local vpara = v.position
--
--		local blip = AddBlipForCoord(vpara.x, vpara.y, vpara.z)
--		SetBlipSprite(blip, 94)
--		SetBlipColour(blip, 15)
--		SetBlipScale(blip, 0.8)
--		SetBlipAsShortRange(blip, true)
--		BeginTextCommandSetBlipName("STRING")
--		AddTextComponentString(v.nompara)
--		EndTextCommandSetBlipName(blip)
--	end
--end)

currentPed = nil

currentPos = nil



Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(500)

	end

end)

local function giveParachute()
    GiveWeaponToPed(currentPed, GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end

Citizen.CreateThread(function()
	Citizen.Wait(1000)

	while true do
		Citizen.Wait(2)
		local pos = currentPos

		for k,v in pairs(para)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				DrawMarker(25, v.position.x, v.position.y, v.position.z - 0.90, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 72, 164, 255, 50, 0, 0, 2, 0, 0, 0, 0)
					
				if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
					DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour obtenir un ~b~parachute")
                    if IsControlJustPressed(1, 51) then
                        giveParachute()
                    end
				end
			end
		end
	end
end)

function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end
