Citizen.CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do

		Citizen.Wait(0)

		if IsEntityDead(PlayerPedId()) then

			Citizen.Wait(500)

			local PedKiller = GetPedSourceOfDeath(PlayerPedId())

			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())

			Weapon = WeaponNames[tostring(DeathCauseHash)]



			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then

				Killer = NetworkGetPlayerIndexFromPed(PedKiller)

			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then

				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))

			end

			

			if (Killer == PlayerId()) then

				DeathReason = 's\'est suicide'

			elseif (Killer == nil) then

				DeathReason = 'est mort'

			else

				if IsMelee(DeathCauseHash) then

					DeathReason = 'a tue'

				elseif IsTorch(DeathCauseHash) then

					DeathReason = 'a brule'

				elseif IsKnife(DeathCauseHash) then

					DeathReason = 'a plante'

				elseif IsPistol(DeathCauseHash) then

					DeathReason = 'a tue avec un pistolet'

				elseif IsSub(DeathCauseHash) then

					DeathReason = 'a tue avec une mitraillette'

				elseif IsRifle(DeathCauseHash) then

					DeathReason = 'a tue avec un fusil d\'assaut'

				elseif IsLight(DeathCauseHash) then

					DeathReason = 'a tue avec une mitrailleuse lourde'

				elseif IsShotgun(DeathCauseHash) then

					DeathReason = 'a tue avec un fusil a pompe'

				elseif IsSniper(DeathCauseHash) then

					DeathReason = 'a snipe'

				elseif IsHeavy(DeathCauseHash) then

					DeathReason = 'a explose'

				elseif IsMinigun(DeathCauseHash) then

					DeathReason = 'a tue avec un minigun'

				elseif IsBomb(DeathCauseHash) then

					DeathReason = 'a explose'

				elseif IsVeh(DeathCauseHash) then

					DeathReason = 'a tue avec un helico'

				elseif IsVK(DeathCauseHash) then

					DeathReason = 'a ecrase'

				else

					DeathReason = 'a tue'

				end

			end

			

			local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

			local distanceFrom1v1 = GetDistanceBetweenCoords(-14.5228, 7337.042, 155.0157, plyCoords['x'], plyCoords['y'], plyCoords['z'], true)

			if (distanceFrom1v1 > 100.0) then

				if DeathReason == 's\'est suicide' or DeathReason == 'est mort' then

					TriggerServerEvent('DiscordBot:PlayerDied', '[' .. GetPlayerServerId(PlayerId()) .. '] ' .. GetPlayerName(PlayerId()) .. ' ' .. DeathReason .. '.', Weapon)

				else

					TriggerServerEvent('DiscordBot:PlayerDied', '[' .. GetPlayerServerId(Killer) .. '] ' .. GetPlayerName(Killer) .. ' ' .. DeathReason .. ' [' .. GetPlayerServerId(PlayerId()) .. '] ' .. GetPlayerName(PlayerId()) .. '.', Weapon)

				end

			end



			Killer = nil

			DeathReason = nil

			DeathCauseHash = nil

			Weapon = nil

		end

		while IsEntityDead(PlayerPedId()) do

			Citizen.Wait(0)

		end

	end

end)

function IsMelee(Weapon)
	local Weapons = {'WEAPON_UNARMED', 'WEAPON_CROWBAR', 'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_HAMMER', 'WEAPON_NIGHTSTICK'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsTorch(Weapon)
	local Weapons = {'WEAPON_MOLOTOV'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsKnife(Weapon)
	local Weapons = {'WEAPON_DAGGER', 'WEAPON_KNIFE', 'WEAPON_SWITCHBLADE', 'WEAPON_HATCHET', 'WEAPON_BOTTLE'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsPistol(Weapon)
	local Weapons = {'WEAPON_SNSPISTOL', 'WEAPON_HEAVYPISTOL', 'WEAPON_VINTAGEPISTOL', 'WEAPON_PISTOL', 'WEAPON_APPISTOL', 'WEAPON_COMBATPISTOL'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsSub(Weapon)
	local Weapons = {'WEAPON_MICROSMG', 'WEAPON_SMG'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsRifle(Weapon)
	local Weapons = {'WEAPON_CARBINERIFLE', 'WEAPON_MUSKET', 'WEAPON_ADVANCEDRIFLE', 'WEAPON_ASSAULTRIFLE', 'WEAPON_SPECIALCARBINE', 'WEAPON_COMPACTRIFLE', 'WEAPON_BULLPUPRIFLE'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsLight(Weapon)
	local Weapons = {'WEAPON_MG', 'WEAPON_COMBATMG'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsShotgun(Weapon)
	local Weapons = {'WEAPON_BULLPUPSHOTGUN', 'WEAPON_ASSAULTSHOTGUN', 'WEAPON_DBSHOTGUN', 'WEAPON_PUMPSHOTGUN', 'WEAPON_HEAVYSHOTGUN', 'WEAPON_SAWNOFFSHOTGUN'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsSniper(Weapon)
	local Weapons = {'WEAPON_MARKSMANRIFLE', 'WEAPON_SNIPERRIFLE', 'WEAPON_HEAVYSNIPER', 'WEAPON_ASSAULTSNIPER', 'WEAPON_REMOTESNIPER'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsHeavy(Weapon)
	local Weapons = {'WEAPON_GRENADELAUNCHER', 'WEAPON_RPG', 'WEAPON_FLAREGUN', 'WEAPON_HOMINGLAUNCHER', 'WEAPON_FIREWORK', 'VEHICLE_WEAPON_TANK'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsMinigun(Weapon)
	local Weapons = {'WEAPON_MINIGUN'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsBomb(Weapon)
	local Weapons = {'WEAPON_GRENADE', 'WEAPON_PROXMINE', 'WEAPON_EXPLOSION', 'WEAPON_STICKYBOMB'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsVeh(Weapon)
	local Weapons = {'VEHICLE_WEAPON_ROTORS'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

function IsVK(Weapon)
	local Weapons = {'WEAPON_RUN_OVER_BY_CAR', 'WEAPON_RAMMED_BY_CAR'}
	for i, CurrentWeapon in ipairs(Weapons) do
		if GetHashKey(CurrentWeapon) == Weapon then
			return true
		end
	end
	return false
end

