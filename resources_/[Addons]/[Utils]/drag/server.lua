RegisterServerEvent("avanyadrag:Drag")
AddEventHandler("avanyadrag:Drag", function(Target)
	local Source = source
	TriggerClientEvent("avanyadrag:Drag", Target, Source)
end)