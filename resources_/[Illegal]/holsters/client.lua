local holstered = true

local weapons = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_SNSPISTOL",
	"WEAPON_KNIFE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_BAT",
	"WEAPON_CROWBAR",
	"WEAPON_MACHETE",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_KNUCKLE",
	"WEAPON_BATTLEAXE",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_FLAREGUN",
	"WEAPON_APPISTOL",
	"WEAPON_MINISMG",
}

local PlayerPedId = PlayerPedId

local wait = 1000

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(wait)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then
			loadAnimDict( "reaction@intimidation@1h" )
			local verifArme = CheckWeapon(ped)
			if verifArme then
			wait = 10
				if holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
					Citizen.Wait(1000)
					ClearPedTasks(ped)
					holstered = false
				end
				--SetPedComponentVariation(ped, 9, 0, 0, 0)
			elseif not verifArme then
			wait = 1000
				if not holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
					Citizen.Wait(800)
					ClearPedTasks(ped)
					holstered = true
				end
				--SetPedComponentVariation(ped, 9, 1, 0, 0)
			end
		end
	end
end)

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 10 )
	end
end
