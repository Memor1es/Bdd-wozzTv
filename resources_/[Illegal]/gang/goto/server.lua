function addGoto(identifier)
	MySQL.Async.execute("INSERT INTO goto (`identifier`) VALUES (@identifier)", { ['@identifier'] = identifier})
end

function remGoto(identifier)
	MySQL.Async.execute("DELETE FROM goto WHERE identifier = @identifier", { ['@identifier'] = identifier})
end

function checkIsGoto(identifier, source)
	MySQL.Async.fetchScalar("SELECT identifier FROM goto WHERE identifier = @identifier", { ['@identifier'] = identifier},
		function(result)
			if(not result) then
				TriggerClientEvent('goto:receiveIsgoto', source, "inconnu")
			else
				TriggerClientEvent('goto:receiveIsgoto', source, result.identifier)
			end
		end)
end

RegisterServerEvent('goto:checkIsgoto')
AddEventHandler('goto:checkIsgoto', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.getIdentifier()
		checkIsGoto(identifier, source)
	end)
end)

TriggerEvent('es:addGroupCommand', 'gotoadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /gotoadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                addGoto(target.getIdentifier())
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu fais partis des Goto !~w~")
				TriggerClientEvent('goto:setInfos', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'gotorem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /gotorem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                remGoto(target.getIdentifier())
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu n'es plus un Goto !~w~.")
                TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
                TriggerClientEvent('goto:removeGang', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)