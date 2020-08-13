fx_version 'adamant'
games { 'gta5' }

description 'ES Locker by rick'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua',
	'server/commands.lua',
}

client_scripts {
	'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',
	'config.lua',
	'client/main.lua'
}

exports {
}

server_exports {
}