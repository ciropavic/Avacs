ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

RegisterCommand('headlight', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.job.name
    local grade = xPlayer.job.grade
	if job == "mechanic" then
		TriggerClientEvent('esx_swiatla:otworz', source)
	else
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma ^2ozv ^0Job ^3Mechanici ^0Nistid.")
	end
end)
RegisterServerEvent('esx_swiatla:usun_swiatla')
AddEventHandler('esx_swiatla:usun_swiatla', function()
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('headlight', 1)
end)

ESX.RegisterServerCallback("esx_swiatla:zapisz_swiatla", function(source, cb, vehProps,color)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local plate = string.gsub(vehProps["plate"], " ", "")
	local color = color
		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_headlights WHERE `plate` LIKE  "%' .. plate .. '%"', {}, function(result)
			if result[1] ~= nil then
				local wyniki = MySQL.Sync.fetchAll('UPDATE `owned_vehicles_headlights` SET `color`=@color WHERE `plate`=@plate', {['@color'] = color,['@plate'] = plate})
				cb(true)
			else
				local wyniki = MySQL.Sync.fetchAll('INSERT INTO `owned_vehicles_headlights` (`id`, `plate`, `color`) VALUES (NULL,@plate,@color)', {['@plate'] = plate,['@color'] = color})
				cb(true)
			end
		end)
end)

ESX.RegisterServerCallback("esx_swiatla:pobierz_swiatla", function(source, cb, vehProps,color)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local color = color
	plate = string.gsub(vehProps, " ", "")
	if plate == nil then
		plate = "AA0000"
	end
		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_headlights WHERE `plate` LIKE  "%' .. plate .. '%"', {}, function(result)
			if result[1] ~= nil then
				color = result[1].color
				cb(color)
			else
				color = 0
				cb(color)
			end
		end)
end)
