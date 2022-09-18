ESX = nil
local Blips = {

	["police"] = {

	},

	["ambulance"] = {

	},

	["government"] = {

	},

	["doc"] = {
		 
	},

	["mechanic"] = {

	},

	["taxi"] = {

	},

	["weazel"] = {
		
	}
	
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
	local _source = source
	
	if _source ~= nil then

		local part = isPlayerPartOfAnyBlip(_source)
		if part then
			Blips[part][_source] = nil
			TriggerClientEvent('esx_tracker:updateTable', -1, Blips)
		end
		
	end	
end)

AddEventHandler('esx:playerLoaded',function(source, xPlayer)
	if xPlayer then
		if Blips[xPlayer.job.name] then
			Blips[xPlayer.job.name][source] = {id = source, name = string.gsub(xPlayer.name, "_", " "), job = xPlayer.job, gang = xPlayer.gang}
			TriggerClientEvent('esx_tracker:updateTable', -1, Blips)
			Wait(300)
			TriggerClientEvent('esx_tracker:updateBlips', -1, xPlayer.job.name)
		end
	end
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	local part = isPlayerPartOfAnyBlip(playerId)

	if part then
		Blips[part][playerId] = nil
		TriggerClientEvent('esx_tracker:updateTable', -1, Blips)
		Wait(300)
		TriggerClientEvent('esx_tracker:updateBlips', -1, part)
	end

	if Blips[job.name] then
		local xPlayer = ESX.GetPlayerFromId(playerId)

		  if xPlayer then
			 Blips[xPlayer.job.name][xPlayer.source] = {id = xPlayer.source, name = string.gsub(xPlayer.name, "_", " "), job = xPlayer.job, gang = xPlayer.gang}
			 TriggerClientEvent('esx_tracker:updateTable', -1, Blips)
			 Wait(300)
			 TriggerClientEvent('esx_tracker:updateBlips', -1, xPlayer.job.name)
		  end

	end
	
end)




ESX.RegisterServerCallback('esx_tracker:getBlips', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "ambulance" or xPlayer.job.name == "police" or xPlayer.job.name == "government" or xPlayer.job.name == "doc" then
		cb(Blips)
	else
		exports.bansystem:bancheater(source, "Tried to fetch blips without permission")
		cb(false)
	end
end)

function isPlayerPartOfAnyBlip(source)
	for k,v in pairs(Blips) do
		if Blips[k][source] then
			return k
		end
	end

	return false
end
