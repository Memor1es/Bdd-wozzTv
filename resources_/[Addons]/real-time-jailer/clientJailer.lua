local cJ = false
local IsPlayerUnjailed = false

RegisterNetEvent("avanyajail:JailInStation")
AddEventHandler("avanyajail:JailInStation", function(Station, JailTime)
	jailing(Station, JailTime)
end)

function jailing(Station, JailTime)
	if cJ == true then
		return
	end
	local PlayerPed = GetPlayerPed(-1)
	if DoesEntityExist(PlayerPed) then
		
		Citizen.CreateThread(function()
			local spawnloccoords = {}
			spawnloccoords = SetPlayerSpawnLocationjail(Station)
			SetEntityCoords(PlayerPed, spawnloccoords.x, spawnloccoords.y, spawnloccoords.z )
			
			local hashSkin = GetHashKey("mp_m_freemode_01")
			if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
				SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)  -- Masque
				SetPedComponentVariation(GetPlayerPed(-1), 11, 5, 5, 2)  -- Debardeur
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)   -- sous t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 7, 2)   -- Pantalon
				SetPedComponentVariation(GetPlayerPed(-1), 3, 5, 0, 2)   -- bras
				SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 2)  --Chaussure
			else
				SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)  -- Masque
				SetPedComponentVariation(GetPlayerPed(-1), 11, 3, 0, 2)  -- Veste
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)   -- sous t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 4, 2, 0, 2)   -- Pantalon
				SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 2)   -- bras
				SetPedComponentVariation(GetPlayerPed(-1), 6, 4, 0, 2)  --Chaussure
			end
			
			cJ = true
			IsPlayerUnjailed = false
			while JailTime > 0 and not IsPlayerUnjailed do
				local remainingjailseconds = JailTime/ 60
				local jailseconds =  math.floor(JailTime) % 60 
				local remainingjailminutes = remainingjailseconds / 60
				local jailminutes =  math.floor(remainingjailseconds) % 60
				local remainingjailhours = remainingjailminutes / 24
				local jailhours =  math.floor(remainingjailminutes) % 24
				local remainingjaildays = remainingjailhours / 365 
				local jaildays =  math.floor(remainingjailhours) % 365

				
				PlayerPed = GetPlayerPed(-1)
				if IsPedInAnyVehicle(PlayerPed, false) then
					ClearPedTasksImmediately(PlayerPed)
				end
				if JailTime % 10 == 0 then
					if JailTime % 30 == 0 then
						TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, math.floor(jaildays).." jours, "..math.floor(jailhours).." heures,"..math.floor(jailminutes).." minutes, "..math.floor(jailseconds).." secondes avant d'être libéré.")
					end
				end
				Citizen.Wait(1000)
				local pL = GetEntityCoords(PlayerPed, true)
				local D = Vdist(spawnloccoords.x,spawnloccoords.y, spawnloccoords.z, pL['x'], pL['y'], pL['z'])
				if D > spawnloccoords.distance then 
					SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z)
				end
				JailTime = JailTime - 1.0
			end
			
			TriggerServerEvent('avanyajail:UnJailplayer2')
			local outsidecoords = {}
			outsidecoords = SetPlayerSpawnLocationoutsidejail(Station)
			SetEntityCoords(PlayerPed, outsidecoords.x,outsidecoords.y,outsidecoords.z )
			cJ = false
		end)
	end
end

function SetPlayerSpawnLocationjail(location)
	if location == 'JailPoliceStation1' then
		return {x=459.5500793457, y=-994.46508789063, z=23.914855957031, distance = 2}
	elseif location == 'JailPoliceStation2' then
		return {x=458.41693115234,y=-997.93572998047,z=23.914854049683, distance = 2}	
	elseif location == 'JailPoliceStation3' then
		return {x=458.29275512695,y=-1001.5576782227,z=23.914852142334, distance = 2}
	elseif location == 'JailPoliceStationNew1' then
		return {x = 467.85119628906, y = -994.48431396484, z = 23.914716720582, distance = 2}	
	elseif location == 'JailPoliceStationNew2' then
		return {x = 472.27560424804, y = -994.30017089844, z = 23.914716720582, distance = 2}
	elseif location == 'JailPoliceStationNew3' then
		return {x = 476.43008422852, y = -994.8037109375, z = 23.914710998536, distance = 2}
	elseif location == 'JailPoliceStationNew4' then
		return {x = 480.85150146484, y = -994.50964355468, z = 23.914710998536, distance = 2}
	elseif location == 'JailSherifftation1' then
		return {x=2451.315,y=-831.1877,z=-37.26652, distance = 2}	
	elseif location == 'JaiSheriffStation2' then
		return {x=2447.157,y=-835.1818,z=-37.26657, distance = 2}	
	elseif location == 'FederalJail' then
		return {x=1643.7593994141,y=2530.9877929688,z=44.564888000488, distance = 80}
	end
end

function SetPlayerSpawnLocationoutsidejail(location)
	if location == 'JailPoliceStation1' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStation2' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}	
	elseif location == 'JailPoliceStation3' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStationNew1' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStationNew2' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStationNew3' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStationNew4' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailSherifftation1' then
		return {x=2459.334,y=-827.2348,z=-37.26657}	
	elseif location == 'JaiSheriffStation2' then
		return {x=2459.334,y=-827.2348,z=-37.26657}	
	elseif location == 'FederalJail' then
		return {x=1847.5042724609,y=2586.2209472656,z=44.672046661377}
	end
end

RegisterNetEvent("avanyajail:UnJail")
AddEventHandler("avanyajail:UnJail", function()
	IsPlayerUnjailed = true
end)