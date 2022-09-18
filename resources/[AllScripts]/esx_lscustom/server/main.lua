ESX = nil
local Vehicles
local VehiclesInWatingList = {}
local IsPlayerReq = {}
local Mechanics = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(price, vehicle)
	local _source = source
	price = tonumber(price)
	if IsPlayerReq[vehicle] then
		IsPlayerReq[vehicle].price = tonumber(IsPlayerReq[vehicle].price) + price
	else
		TriggerClientEvent('esx_lscustom:DontInstallMod', _source)
	end
end)

RegisterServerEvent('esx_lscustom:refreshOwnedVehicle')
AddEventHandler('esx_lscustom:refreshOwnedVehicle', function(vehicleProps)

	MySQL.Async.fetchAll('SELECT vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = vehicleProps.plate
	}, function(result)
		if result[1] then
			local vehicle = json.decode(result[1].vehicle)

			if vehicleProps.model == vehicle.model then
				exports.ghmattimysql:execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
					['@plate'] = vehicleProps.plate,
					['@vehicle'] = json.encode(vehicleProps)
				})
			end
		end
	end)
end)

RegisterServerEvent('esx_lscustom:VehiclesInWatingList')
AddEventHandler('esx_lscustom:VehiclesInWatingList', function(Plate, vehicleProps , thenz)
	local _Source = source
	if thenz then
		if not IsPlayerReq[Plate] then
			IsPlayerReq[Plate] = {source = _Source, incustom = false ,customer = 0, price = 0, props = vehicleProps}
		end
	else
		IsPlayerReq[Plate] = nil
	end
end)

ESX.RegisterServerCallback('esx_lscustom:IsRequstedVehicle', function(source, cb, cVehicle)
	if IsPlayerReq[cVehicle] then
		if IsPlayerReq[cVehicle].customer == 0 or IsPlayerReq[cVehicle].customer == source then
			if Mechanics[source] then
			    if Mechanics[source] ~= cVehicle then return TriggerClientEvent('esx:showNotification', source, '~r~Shoma dar hale custom mashin digari hasitd!') end
			end
			cb(true)
			IsPlayerReq[cVehicle].customer = source
			IsPlayerReq[cVehicle].incustom = true
			Mechanics[source] = cVehicle
			if IsPlayerReq[cVehicle].source ~= source then
				TriggerClientEvent('esx_lscustom:CloseMenus', IsPlayerReq[cVehicle].source)
			end
			TriggerClientEvent('esx:showNotification', IsPlayerReq[cVehicle].source, '~g~Mashin shoma dar hale custom ast!')
		else
			TriggerClientEvent('esx:showNotification', source, '~r~Yaki digar az mechanic ha dar hale custom in mashin hast!')
		end
	else
		TriggerClientEvent('esx:showNotification', source, '~r~Hich Kas barye upgrade in mashin darkhast nadade!')
	end
end)

ESX.RegisterServerCallback('esx_lscustom:checkStatus', function(source, cb, vehicle)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plate = vehicle.plate
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {["@plate"]=tostring(plate)},
	function(result)
		if result[1] ~= nil then
			if xPlayer.identifier == result[1].owner or xPlayer.gang.name == result[1].owner then
				if IsPlayerReq[plate] then
					if IsPlayerReq[plate].incustom then return TriggerClientEvent('esx:showNotification', source, '~r~Mashin Shoma dar hale custom ast!') end
					cb(true)
				else
					cb(false)
				end
			else
				TriggerClientEvent('esx:showNotification', source, '~r~In mashin motalegh be shoma nist!!')
			end
		else
			TriggerClientEvent('esx:showNotification', source, '~r~In mashin motalegh be shoma nist!')
		end
    end)
end)

RegisterCommand('finish', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "mechanic" then
		if Mechanics[source] then
			local ThisCar = Mechanics[source]
			IsPlayerReq[ThisCar].customer = source
			IsPlayerReq[ThisCar].incustom = false
			TriggerClientEvent('esx_lscustom:CloseMenus', source)
			TriggerClientEvent('esx_lscustom:CloseMenus', IsPlayerReq[ThisCar].source)
			TriggerClientEvent('esx_lscustom:Default', IsPlayerReq[ThisCar].source , IsPlayerReq[ThisCar].props)
			TriggerClientEvent('esx:showNotification', IsPlayerReq[ThisCar].source, '~g~Custom mashin shoma be payan resid!')
			TriggerClientEvent('esx:showNotification', source, '~b~FINISH CUSTOM!\nmablaghe ghabel pardakht: ~r~'..IsPlayerReq[ThisCar].price)
			Mechanics[source] = nil
		else
			TriggerClientEvent('esx:showNotification', source, '~r~Shoma darkhasti nadashtid!')
		end
	end
end)

ESX.RegisterServerCallback('esx_lscustom:PayVehicleOrders', function(source, cb, vehicle, payWithBank)
	xPlayer = ESX.GetPlayerFromId(source)
	if IsPlayerReq[vehicle] then
		if payWithBank then
			if xPlayer.bank >= IsPlayerReq[vehicle].price then
				xPlayer.removeBank(tonumber(IsPlayerReq[vehicle].price))
				cb(true)
			else
				cb(false)
			end
		else
			if xPlayer.money >= IsPlayerReq[vehicle].price then
				xPlayer.removeMoney(tonumber(IsPlayerReq[vehicle].price))
				cb(true)
			else
				cb(false)
			end

		end
	else
		cb(true)
	end
end)

ESX.RegisterServerCallback('esx_lscustom:PriceOfBill', function(source, cb, vehicle)
	if IsPlayerReq[vehicle] then
		cb(IsPlayerReq[vehicle].price)
	else
		cb(0)
	end
end)

ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if not Vehicles then
		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)