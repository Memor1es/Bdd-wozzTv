fx_version 'adamant'
games { 'gta5' }

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

client_script {
	'client.lua',
	'GUI.lua'
}