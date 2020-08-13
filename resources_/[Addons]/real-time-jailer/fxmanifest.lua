fx_version 'adamant'
games { 'gta5' }

client_script "clientJailer.lua"
client_script "config.lua"
server_script "serverJailer.lua"
server_script '@mysql-async/lib/MySQL.lua'
