--=============================================================================
--  Jonathan D @ Gannon
--=============================================================================

fx_version 'adamant'
games { 'gta5' }

-- General
client_scripts {
  'event_Menu.lua',
  'event_client.lua',
  'menuEventSpawn.lua'
}

server_scripts {
  'event_server.lua'
}

export 'getIsInServiceEvent'