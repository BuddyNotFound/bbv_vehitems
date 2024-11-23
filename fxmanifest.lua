fx_version 'cerulean'
game 'gta5'

description 'bbv_vehitems'
version '1.0.0'

client_scripts {
    'config.lua',
    'client/cl_main.lua',
}

server_scripts {
    'server/sv_main.lua',
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}


lua54 'yes'

