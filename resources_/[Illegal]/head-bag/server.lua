RegisterServerEvent('es_worek:closest')
AddEventHandler('es_worek:closest', function()
    local name = GetPlayerName(najblizszy)
    TriggerClientEvent('es_worek:nalozNa', najblizszy)
end)

RegisterServerEvent('es_worek:sendclosest')
AddEventHandler('es_worek:sendclosest', function(closestPlayer)
    najblizszy = closestPlayer
end)

RegisterServerEvent('es_worek:zdejmij')
AddEventHandler('es_worek:zdejmij', function()
    TriggerClientEvent('es_worek:zdejmijc', najblizszy)
end)