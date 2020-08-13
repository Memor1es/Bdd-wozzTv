--=============================================================================
--  Jonathan D @ Gannon
--=============================================================================

fx_version 'adamant'
games { 'gta5' }

-- General
client_scripts {
  'taxi_Menu.lua',
  'taxi_client.lua'
}

server_scripts {
  'taxi_server.lua'
}

export 'getIsInServiceTaxi'