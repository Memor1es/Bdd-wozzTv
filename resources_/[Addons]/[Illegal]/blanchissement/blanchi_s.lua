RegisterServerEvent('avanyablanchi:addMoneyServer')
AddEventHandler('avanyablanchi:addMoneyServer', function (amount)
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
			local sale = user.getDirtyMoney()
			if sale > 0 then
				local realTransform = math.min(sale, amount)
				local result = realTransform * math.min(1, 0.6)
				local result2 = math.floor(result)
					user.removeDirtyMoney(realTransform)
            		user.addMoney(result2)
            end
	end)
end)