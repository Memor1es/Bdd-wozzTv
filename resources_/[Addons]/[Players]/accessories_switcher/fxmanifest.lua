--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 24/05/2017
-- Time: 02:37
-- To change this template use File | Settings | File Templates.
--
fx_version 'adamant'
games { 'gta5' }

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}
client_script {
    'client.lua',
}