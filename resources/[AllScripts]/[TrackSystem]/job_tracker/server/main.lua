local Table	= {
	ambulance = {},
	taxi	  = {},
	mechanic	  = {},
	police	  = {}
}
ESX 		= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx:playerDropped')
AddEventHandler('esx:playerDropped', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer and Table[xPlayer.job.name] and xPlayer.job.grade > 0 then
		TriggerClientEvent('job_tracker:RemovePlayerBlip', -1, xPlayer.job.name, _source)
		Table[xPlayer.job.name][_source] = nil
	end
	-- if Table.ambulance[source] then
	-- 	TriggerClientEvent('job_tracker:RemovePlayerBlip', -1, 'ambulance', source)
	-- 	Table.ambulance[_source] = nil
	-- elseif Table.taxi[source] then
	-- 	TriggerClientEvent('job_tracker:RemovePlayerBlip', -1, 'taxi', source)
	-- 	Table.taxi[_source] = nil
	-- elseif Table.mechanic[source] then
	-- 	TriggerClientEvent('job_tracker:RemovePlayerBlip', -1, 'mechanic', source)
	-- 	Table.mechanic[_source] = nil
	-- elseif Table.police[source] then
	-- 	TriggerClientEvent('job_tracker:RemovePlayerBlip', -1, 'police', source)
	-- 	Table.police[_source] = nil
	-- end

end)

RegisterServerEvent('job_tracker:AddToTable')
AddEventHandler('job_tracker:AddToTable', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if not Table[xPlayer.job.name] then
		return
	end
	
	Table[xPlayer.job.name][_source] = xPlayer.name

	TriggerClientEvent('job_tracker:InsertBlip', _source, xPlayer.job.name, Table[xPlayer.job.name])
	TriggerClientEvent('job_tracker:AddPlayerBlip', -1, xPlayer.job.name, xPlayer.name, _source)

end)

RegisterServerEvent('job_tracker:RemoveFromTable')
AddEventHandler('job_tracker:RemoveFromTable', function(job)
	local _source = source

	Table[job][_source] = nil 

	TriggerClientEvent('job_tracker:RemovePlayerBlip', -1, job, _source)

end)