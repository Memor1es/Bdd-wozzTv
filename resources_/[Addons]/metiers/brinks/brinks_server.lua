

RegisterServerEvent('brinks:Car')
AddEventHandler('brinks:Car', function()
	TriggerClientEvent('brinks:getCar',source)
end)

RegisterServerEvent('brinks:serverRequest')
AddEventHandler('brinks:serverRequest', function (typeRequest)
	local mysource= source
	TriggerEvent ('es:getPlayerFromId', mysource, function(user)
		local player = user.getIdentifier()

		if typeRequest == "GetArgent" then
			MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=38 AND user_id=@identifier", {['@identifier'] = player},
				function(result)
					TriggerClientEvent('brinks:drawGetArgent', mysource, result)
				end)

		elseif typeRequest == "GetLingot" then
			MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=38 AND user_id=@identifier", {['@identifier'] = player},
				function(qteArgent)
					MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=9 AND user_id=@identifier", {['@identifier'] = player},
						function(qteLingot)
							TriggerClientEvent('brinks:drawGetLingot',mysource, qteArgent, qteLingot)
						end)
				end)

		elseif typeRequest == "SellLingot" then
			MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=9 AND user_id=@identifier", {['@identifier'] = player},
				function(qte)
					TriggerClientEvent('brinks:drawSellLingot', mysource, qte)
				end)
		else
			print('DEBUG : Une erreur de type de requête à été détectée')
		end

	end)
end)

RegisterServerEvent('brinks:setService')
AddEventHandler('brinks:setService', function (inService)
	TriggerEvent('es:getPlayerFromId', source , function (Player)
		Player.setSessionVar('brinksInService', inService)
	end)
end)
