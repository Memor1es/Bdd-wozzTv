
function getIdentifiant(id)

	for _, v in ipairs(id) do
	    return v
	end

end

RegisterServerEvent('td_health:spawn')
AddEventHandler('td_health:spawn', function()


	local identifiers = GetPlayerIdentifiers(source)
	local perso = getIdentifiant(identifiers)
	local varsrc = source

	local varsrc = source
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = perso, ['@nb'] = tonumber(nb)}, function (result)

		if result[1].health == nil then
		else		
				
				local resultat = tonumber(result[1].health)
				
				TriggerClientEvent('td_health:setHealth', varsrc, resultat)
		end
	end)		
end)

--[[RegisterServerEvent('td_health:update')
AddEventHandler("td_health:update", function(health)
	local identifiers = GetPlayerIdentifiers(source)
	local perso = getIdentifiant(identifiers)
	local src = source
	
	TriggerEvent("es:getPlayerFromId", source, function(player)
		MySQL.Sync.execute("UPDATE users SET health=@health WHERE identifier = @username", { ['@health'] = health, ['@username'] = perso})
	end)
end)--]]

RegisterServerEvent('td_health:update')
AddEventHandler("td_health:update", function(health)
	local identifiers = GetPlayerIdentifiers(source)
	local perso = getIdentifiant(identifiers)
	local src = source
	MySQL.Sync.execute("UPDATE users SET health=@health WHERE identifier = @username", { ['@health'] = health, ['@username'] = perso})
end)