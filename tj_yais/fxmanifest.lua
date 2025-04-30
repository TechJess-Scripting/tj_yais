fx_version "cerulean"
game "gta5"

author "TechJess#0"
version "1.4"

client_script "client/*.lua"

server_script "server/*.lua"

shared_scripts { "config.lua", '@ox_lib/init.lua'}

lua54 'yes'

escrow_ignore{
    'config.lua',
    'beds/*.lua'
}