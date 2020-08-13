RegisterServerEvent('avanyablanchi:addMoneyServer')
AddEventHandler('avanyablanchi:addMoneyServer', function (amount)
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
			local sale = user.getDirtyMoney()
			if sale > 0 then
        local realTransform = math.min(sale, amount)
				user.removeDirtyMoney(realTransform)
                user.addMoney(realTransform * math.min(1, 0.6))
            end
	end)
end)