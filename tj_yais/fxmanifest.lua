fx_version "cerulean"
game "gta5"

description "Yet Another Interaction Script"

author "TechJess#0"
version "0.1"

client_scripts {client_scripts {"client/*.lua", "client/**/*.lua"}}

server_scripts {"server/*.lua"}

shared_scripts { "config.lua", '@ox_lib/init.lua'}

lua54 'yes'

escrow_ignore{
    'config.lua',
    'beds/*.lua'
}