function addVagos(identifier)
	MySQL.Async.execute("INSERT INTO vagos (`identifier`) VALUES (@identifier)", { ['@identifier'] = identifier})
end

function remVagos(identifier)
	MySQL.Async.execute("DELETE FROM vagos WHERE identifier = @identifier", { ['@identifier'] = identifier})
end

function checkIsVagos(identifier, source)
	MySQL.Async.fetchScalar("SELECT identifier FROM vagos WHERE identifier = @identifier", { ['@identifier'] = identifier},
		function(result)
			if(not result) then
				TriggerClientEvent('vagos:receiveIsvagos', source, "inconnu")
			else
				TriggerClientEvent('vagos:receiveIsvagos', source, result.identifier)
			end
		end)
end

RegisterServerEvent('vagos:checkIsvagos')
AddEventHandler('vagos:checkIsvagos', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.getIdentifier()
		checkIsVagos(identifier, source)
	end)
end)

TriggerEvent('es:addGroupCommand', 'vagosadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /vagosadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                addVagos(target.getIdentifier())
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu fais partis des Vagos !~w~")
				TriggerClientEvent('vagos:setInfos', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'vagosrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /vagosrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                remVagos(target.getIdentifier())
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu n'es plus un Vagos !~w~.")
                TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
                TriggerClientEvent('vagos:removeGang', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)