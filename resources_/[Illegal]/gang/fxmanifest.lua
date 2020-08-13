fx_version 'adamant'
games { 'gta5' }

client_scripts {
    'ballas/client.lua',
    'vagos/client.lua',
    'families/client.lua',
    'garduna/client.lua',
    'yiddish/client.lua'
    --'camorra/server.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'ballas/server.lua',
    'vagos/server.lua',
    'families/server.lua',
    'garduna/server.lua',
    'yiddish/server.lua'
    --'camorra/server.lua'
}