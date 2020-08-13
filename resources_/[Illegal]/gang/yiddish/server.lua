function addyiddish(identifier)
	MySQL.Async.execute("INSERT INTO yiddish (`identifier`) VALUES (@identifier)", { ['@identifier'] = identifier})
end

function remyiddish(identifier)
	MySQL.Async.execute("DELETE FROM yiddish WHERE identifier = @identifier", { ['@identifier'] = identifier})
end

function checkIsyiddish(identifier, source)
	MySQL.Async.fetchScalar("SELECT identifier FROM yiddish WHERE identifier = @identifier", { ['@identifier'] = identifier},
		function(result)
			if(not result) then
				TriggerClientEvent('yiddish:receiveIsyiddish', source, "inconnu")
			else
				TriggerClientEvent('yiddish:receiveIsyiddish', source, result.identifier)
			end
		end)
end

RegisterServerEvent('yiddish:checkIsyiddish')
AddEventHandler('yiddish:checkIsyiddish', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.getIdentifier()
		checkIsyiddish(identifier, source)
	end)
end)

TriggerEvent('es:addGroupCommand', 'yiddishadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /yiddishadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                addyiddish(target.getIdentifier())
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu es yiddish !~w~")
				TriggerClientEvent('yiddish:setInfos', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'yiddishrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /bsrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                remyiddish(target.getIdentifier())
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu n'es plus yiddish !~w~.")
                TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
                TriggerClientEvent('yiddish:removeGang', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)