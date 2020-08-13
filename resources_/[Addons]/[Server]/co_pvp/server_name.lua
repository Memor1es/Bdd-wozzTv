function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry('PM_PANE_LEAVE', '~w~Déconnexion de ~b~Listory RP')
	AddTextEntry('PM_PANE_QUIT', '~w~Quitter ~b~Listory RP ~w~et ~r~FiveM')
	AddTextEntry('FE_THDR_GTAO', '~b~Listory RP~w~ | discord.gg/S64vBqC')
	AddTextEntry('PM_SCR_MAP', 'Map ~b~Listory RP~w~')
end)