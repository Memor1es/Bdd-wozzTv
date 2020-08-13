fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'avocat_client.lua',
	'avocat_Menu.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'avocat_server.lua',
}

export 'getIsInServiceAvocat'

