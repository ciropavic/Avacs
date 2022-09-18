ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('register:check', function(source, cb)
_source = source
print(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
		print(xPlayer.identifier)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', 
							{
								['@identifier'] =  xPlayer.identifier

							}, function(data)
							if not data[1].playerName or data[1].playerName == "" then
							cb(true)
							else
						    cb(false)
							end
							print(data[1].playerName)
							end)
end)
