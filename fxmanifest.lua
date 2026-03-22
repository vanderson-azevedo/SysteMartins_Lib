fx_version "cerulean"
game "gta5"
lua54 "yes"

author "SysteMartins Scripts / Ortega"
description "Biblioteca da SysteMartins"
discord "https://discord.systemartins.com.br"
website "https://systemartins.com.br"
version '1.1.1'

--[[
    ================================================================================
    FRAMEWORK - Configuracao do fxmanifest
    ================================================================================
    
    Se usar VRP: mantenha as linhas VRP descomentadas e comente as linhas QBX
    Se usar QBX: comente as linhas VRP e descomente as linhas QBX
    ================================================================================
]]

shared_scripts {
    'config.lua'
}

client_scripts {
    -- [VRP] Descomente a linha abaixo para VRP ou Creatives / Comente para QBX
    '@vrp/lib/utils.lua',

    -- [QBX] Descomente a linha abaixo para QBX / Comente para VRP
    -- '@ox_lib/init.lua',

    'client/client.lua'
} 

server_scripts { 
    -- [VRP] Descomente as 2 linhas abaixo para VRP / Comente para QBX
    "@vrp/lib/utils.lua",

    -- [QBX] Descomente a linha abaixo para QBX / Comente para VRP
    -- '@ox_lib/init.lua',

    'server/server.lua'
}