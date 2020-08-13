-- NO
-- RegisterServerEvent('playerSpawn')
-- AddEventHandler('playerSpawn', function()
-- 	TriggerClientEvent('es_freeroam:spawnPlayer', source, spawnCoords.x, spawnCoords.y, spawnCoords.z)
-- end)

--AddEventHandler('es:playerLoaded', function(source)
	-- Get the players money amount
	--TriggerEvent("es:getPlayerFromId", source, function(user)
	--user:setMoney((user.money))
	--TriggerClientEvent('es:activateDirtyMoney', source, user.dirty_money)
	--end)
--end)

RegisterServerEvent('mission:completed')
AddEventHandler('mission:completed', function(total)
	-- Get the players money amount
TriggerEvent('es:getPlayerFromId', source, function(user)
  -- update player money amount
  user:addMoney((total))
 TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_FLEECA", 1, "Banque Fleeca", false, "Vous avez reçu ~b~$".. tonumber(total))
 end)
end)

RegisterServerEvent('es_freeroam:pay')
AddEventHandler('es_freeroam:pay', function(amount)
	-- Get the players money amount
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if(user.money > amount) then
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_FLEECA", 1, "Banque Fleeca", false, "Votre transaction est ~b~terminée.")
			user:removeMoney((amount))
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_FLEECA", 1, "Banque Fleeca", false, "Votre transaction est ~r~rejetée.")
		end
	end)
end)
