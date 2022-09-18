-- 2018 Henric 'Kekke' Johansson

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('persianpixelazgoddevmrluagodluadev')
AddEventHandler('persianpixelazgoddevmrluagodluadev', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "police" or xPlayer.job.name == "swat" or xPlayer.job.name == "sheriff" or xPlayer.job.name == "fbi" or xPlayer.job.name == "cia" or xPlayer.job.name == "xray" then
		TriggerClientEvent('esx_kekke_tackle:getTackled', target, source)
		TriggerClientEvent('esx_kekke_tackle:playTackle', source)
	else
		exports.bansystem:bancheater(xPlayer.source, "Try To Ktackle Player")
	end
end)