--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 16/05/2017
-- Time: 19:57
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
    'menu.lua'
}
