ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('carlock:isVehicleOwnerjob', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then
		DropPlayer(source, 'Shoma Be Relog Niyaz Darid')
	end
	job = xPlayer.job.name
			cb(job)
end)