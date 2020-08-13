RegisterServerEvent('avanyashop:testprix')
AddEventHandler('avanyashop:testprix', function(item,prixmenu)
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if(user.getMoney() >= prixmenu)then
			user.removeMoney(prixmenu)
			TriggerClientEvent('avanyashop:getItem',source,item)
		end
	end)
end)