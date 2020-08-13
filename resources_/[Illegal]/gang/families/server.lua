function addFamilies(identifier)
	MySQL.Async.execute("INSERT INTO families (`identifier`) VALUES (@identifier)", { ['@identifier'] = identifier})
end

function remFamilies(identifier)
	MySQL.Async.execute("DELETE FROM families WHERE identifier = @identifier", { ['@identifier'] = identifier})
end

function checkIsFamilies(identifier, source)
	MySQL.Async.fetchScalar("SELECT identifier FROM families WHERE identifier = @identifier", { ['@identifier'] = identifier},
		function(result)
			if(not result) then
				TriggerClientEvent('families:receiveIsfamilies', source, "inconnu")
			else
				TriggerClientEvent('families:receiveIsfamilies', source, result.identifier)
			end
		end)
end

RegisterServerEvent('families:checkIsfamilies')
AddEventHandler('families:checkIsfamilies', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.getIdentifier()
		checkIsFamilies(identifier, source)
	end)
end)

TriggerEvent('es:addGroupCommand', 'famadd', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /famadd [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                addFamilies(target.getIdentifier())
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu fais partis des Families !~w~")
				TriggerClientEvent('families:setInfos', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)

TriggerEvent('es:addGroupCommand', 'famrem', "admin", function(source, args, user)
	if(not args[1]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Utilisation : /famrem [ID]")
	else
		if(GetPlayerName(tonumber(args[1])) ~= nil)then
			local player = tonumber(args[1])
            TriggerEvent("es:getPlayerFromId", player, function(target)
                remFamilies(target.getIdentifier())
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_LESTER_DEATHWISH", 1, "Lester", false, "Tu n'es plus un Families !~w~.")
                TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Bien reçu !")
                TriggerClientEvent('families:removeGang', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Pas de joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Tu n'as pas la permission de faire ça !")
end)