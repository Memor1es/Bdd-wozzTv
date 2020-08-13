
TriggerEvent('es:addGroupCommand', 'updateweapons', 'user', function(source, args, user)
    TriggerClientEvent('avanyaguns:needUpdateWeapons', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'give current weapon to closet player', params = {}})

TriggerEvent('es:addGroupCommand', 'toggleweapons', 'user', function(source, args, user)
    TriggerClientEvent('avanyaguns:toggleWeapons', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'toggle weapons', params = {}})


TriggerEvent('es:addGroupCommand', 'giveweapon', 'user', function(source, args, user)
    TriggerClientEvent('avanyaguns:tryGiveWeapon', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'give current weapon to closet player', params = {}})

TriggerEvent('es:addGroupCommand', 'takeeweapon', 'admin', function(source, args, user)
    TriggerClientEvent('avanyaguns:tryTakeWeapon', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'takes current weapon from closet player', params = {}})

TriggerEvent('es:addGroupCommand', 'giveweaponself', 'admin', function(source, args, user)
    TriggerClientEvent('avanyaguns:giveWeaponSelf', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'give current weapon to player', params = {}})

TriggerEvent('es:addGroupCommand', 'removeweaponself', 'admin', function(source, args, user)
    TriggerClientEvent('avanyaguns:removeWeaponSelf', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'remove current weapon from player', params = {}})

