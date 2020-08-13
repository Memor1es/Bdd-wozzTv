RegisterNetEvent("avanyacamb:finished")

CreateThread(function()
	while true do
		Wait(0)
		
		local door = doors[lastDoor].coords
		
		-- if time is up
		if TimeToSeconds(GetClockTime()) > TimeToSeconds(5, 30, 0) and onMission then
			-- if still in the house
			if GetCurrentHouse() then
				-- mission failed we'll get em next time
				ShowMPMessage("~r~Cambriolage échoué", "Tu n'es pas sorti de la maison avant le matin.", 3500)
				TriggerServerEvent("avanyacamb:ended", true, true, lastDoor, GetStreet(door.x, door.y, door.z))
			else
				-- player made it before time
				TriggerServerEvent("avanyacamb:ended", false)
			end
			
			ForceEndMission()
		end

		if onMission then		
			if CanPedHearPlayer(PlayerId(), peds[1]) then
				ShowMPMessage("~r~Cambriolage échoué", "Tu as reveillé le résident.", 3500)
				TriggerServerEvent("burglary:ended", true, true, lastDoor, GetStreet(door.x, door.y, door.z))
				
				ClearPedTasks(peds[1])
				PlayPain(peds[1], 7, 0)
				
				-- if resident is aggresive
				if HasPedGotWeapon(peds[1], GetHashKey("WEAPON_PISTOL"), false) then
					SetCurrentPedWeapon(peds[1], GetHashKey("WEAPON_PISTOL"), true)
					
					TaskShootAtEntity(peds[1], PlayerPedId(), -1, 2685983626)
				end
				
				ForceEndMission()
			end
		end
		
		if IsPedCuffed(PlayerPedId()) and onMission then
			ShowMPMessage("~r~Cambriolage échoué", "Tu as été arrêter.", 3500)
			TriggerServerEvent("avanyacamb:ended", true, false)
			
			ForceEndMission()
		end
		
		-- cancel mission if player is dead
		if IsPedDeadOrDying(PlayerPedId()) and onMission then
			TriggerServerEvent("avanyacamb:ended", true, false)
			
			ForceEndMission()
		end
		
		-- check if van is not destroyed
		--[[if IsEntityDead(currentVan) and onMission then
			ShowMPMessage("~r~Burglary failed", "Your van got destroyed.", 3500)
			TriggerServerEvent("burglary:ended", true, false)
			
			ForceEndMission()
		end]]--
	end
end)

function ForceEndMission()
	if isHolding then
		DetachEntity(holdingProp)
	end
	
	-- lot of cleanup
	isHolding = false
	holdingProp = nil
	
	stolenItems = {}
	currentItem = {}
	
	-- reset anim
	ClearPedTasks(PlayerPedId())
	SetPedCanSwitchWeapon(PlayerPedId(), not isHolding)
	
	onMission = false
	SetVehicleAsNoLongerNeeded(NetToVeh(currentVan))
	
	RemoveBlips()
	RemovePickups()
end

AddEventHandler("avanyacamb:finished", function(sum)
	ShowMPMessage("~g~Cambriolage réussi", "Tu as vendu tes objets pour une valeur de $" .. sum, 3500)
	TriggerServerEvent("avanyacamb:money", sum)
end)
