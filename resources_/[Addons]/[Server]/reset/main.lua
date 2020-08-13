local dbname = 'essentialmode'

TriggerEvent('es:addGroupCommand', 'reset', "admin", function(source, args, user)
	if(GetPlayerName(tonumber(args[1])))then
		local player = tonumber(args[1])
		TriggerEvent("es:getPlayerFromId", player, function(target)
			wipe(player, getId(player))
		end)
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'L\'ID du joueur n\'est pas valide' } })
	end
end)

function getId(player)
	local id
	for k,v in ipairs(GetPlayerIdentifiers(player))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			id = v
			break
		end
	end

	return id
end

function wipe(player, id)
	DropPlayer(player, 'Vous avez été reset, recommencez une nouvelle histoire !.')

    MySQL.Async.fetchAll("SELECT table_name FROM information_schema.tables WHERE table_schema = @table_schema", { ['@table_schema'] = dbname }, function(result)
        for k, v in pairs(result) do
            MySQL.Async.execute(string.format('DELETE FROM %s WHERE identifier = @identifier', v.table_name), {
				['@identifier'] = id
			})
			MySQL.Async.execute(string.format('DELETE FROM user_inventory WHERE user_id = @identifier'), {
				['@identifier'] = id
			})
			MySQL.Async.execute(string.format('DELETE FROM user_vehicle WHERE owner = @identifier'), {
				['@identifier'] = id
			})
        end
	end)
end