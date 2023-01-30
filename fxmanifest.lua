fx_version 'cerulean'
game 'gta5'

description 'A simple safezone script'
version '1.0.0'

dependency 'PolyZone'

client_scripts {
    '@PolyZone/client.lua',
    "client/main.lua"
}

shared_scripts {
    "config.lua"
}