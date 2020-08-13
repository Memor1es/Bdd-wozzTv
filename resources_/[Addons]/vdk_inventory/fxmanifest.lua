fx_version 'adamant'
games { 'gta5' }

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
	's_menufood.lua'
}
client_script {
	'vdkinv.lua',
	'GUI.lua',
	'c_menufood.lua'
}

exports{
	'getQuantity',
	'notFull'
} 