RegisterServerEvent('joaillier:Car')
AddEventHandler('joaillier:Car', function()
	TriggerClientEvent('joaillier:getCar',source)
end)

RegisterServerEvent('joaillier:serverRequest')
AddEventHandler('joaillier:serverRequest', function (typeRequest)
	local mysource = source
	TriggerEvent ('es:getPlayerFromId', mysource, function(user)
		local player = user.getIdentifier()

		if typeRequest == "GetOr" then
			MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=3 AND user_id=@identifier", {['@identifier'] = player},
				function(result)
					TriggerClientEvent('joaillier:drawGetOr', mysource, result)
				end)
		elseif typeRequest == "GetBijoux" then
			MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=3 AND user_id=@identifier", {['@identifier'] = player},
				function(qteOr)
					MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=16 AND user_id=@identifier", {['@identifier'] = player},
						function(qteBijoux)
							TriggerClientEvent('joaillier:drawGetBijoux',mysource, qteOr, qteBijoux)
						end)
				end)
		elseif typeRequest == "SellBijoux" then
			MySQL.Async.fetchScalar("SELECT quantity FROM user_inventory WHERE item_id=16 AND user_id=@identifier", {['@identifier'] = player},
				function(qte)
					TriggerClientEvent('joaillier:drawSellBijoux', mysource, qte)
				end)
		else
			print('DEBUG : Une erreur de type de requête à été détectée')
		end

	end)
end)

RegisterServerEvent('joaillier:setService')
AddEventHandler('joaillier:setService', function (inService)
	TriggerEvent('es:getPlayerFromId', source , function (Player)
		Player.setSessionVar('joaillierInService', inService)
	end)
end)