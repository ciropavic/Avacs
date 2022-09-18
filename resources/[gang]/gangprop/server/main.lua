ESX = nil
gangs = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterServerEvent('gangprop:giveWeapon')
-- AddEventHandler('gangprop:giveWeapon', function(weapon, ammo)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     xPlayer.addWeapon(weapon, ammo)
-- end)

RegisterNetEvent('gangprop:forceBlip')
AddEventHandler('gangprop:forceBlip', function()
	TriggerClientEvent('gangprop:updateBlip', -1)
end)
ESX.RegisterServerCallback('gangprop:getOnlinePlayers', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local players  = {}

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		table.insert(players, {
			source     = xPlayer.source,
			identifier = xPlayer.identifier,
			name       = xPlayer.name,
			gang        = xPlayer.gang
		})
	end

	cb(players)
end)

RegisterServerEvent("gangprop:setArmor")
AddEventHandler("gangprop:setArmor", function()

  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.gang.name ~= "nogang" then
    if xPlayer.money >= 8000 then

      xPlayer.removeMoney(8000)
      TriggerClientEvent('setArmorHandler', source)
      TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ba movafaghiat armor poshidid!")

    else
      TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma pol kafi baraye kharid jelighe zed golule nadarid gheymat jelighe ^220000$ ^0ast!")
    end
  else
    exports.bansystem:bancheater(source, "Tried to buy armor without being part of any gang", "Cheat Lua executor")
	
  end

end)

ESX.RegisterServerCallback('gangprop:carAvalible', function(source, cb, plate)
  exports.ghmattimysql:scalar('SELECT `stored` FROM `owned_vehicles` WHERE plate = @plate', {
    ['@plate']  = plate
  }, function(stored)
      cb(stored)
  end)
end)

ESX.RegisterServerCallback('gangprop:getCars', function(source, cb)
  local ownedCars = {}
  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.fetchAll('SELECT * FROM `owned_vehicles` WHERE LOWER(owner) = @gang AND type = \'car\' AND @stored = @stored', {
    ['@player']  = xPlayer.identifier,
    ['@gang']    = string.lower(xPlayer.gang.name),
    ['@stored']  = true
  }, function(data)
    for _,v in pairs(data) do
      local vehicle = json.decode(v.vehicle)
      table.insert(ownedCars, {vehicle = vehicle, stored = v.stored, plate = v.plate})
    end
    cb(ownedCars)
  end)
end)

RegisterServerEvent('gangprop:handcuff')
AddEventHandler('gangprop:handcuff', function(target)
  local xPlayer = ESX.GetPlayerFromId(source)
  local zPlayer = ESX.GetPlayerFromId(target)
  if xPlayer.gang.name ~= "nogang" then 
  if zPlayer.admin then
 xPlayer.showNotification("Nemituni Admin Ro Handcuff Koni")
  else
    TriggerClientEvent('gangprop:handcuff', target)
   end
  else
      exports.BanSql:BanTarget(source, "Tried to handcuff someone without being part of the gang", "Cheat Lua executor")
    end
end)

RegisterServerEvent('gangprop:drag')
AddEventHandler('gangprop:drag', function(target)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.gang.name ~= "nogang" then
    TriggerClientEvent('gangprop:drag', target, source)
  else
    exports.BanSql:BanTarget(source, "Tried to drag someone without being part of the gang", "Cheat Lua executor")
  end
end)

RegisterServerEvent('gangprop:putInVehicle')
AddEventHandler('gangprop:putInVehicle', function(target, netId)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.gang.name ~= "nogang" then
    TriggerClientEvent('gangprop:putInVehicle', target, netId)
  else
    exports.BanSql:BanTarget(source, "Tried to put someone in vehicle without being part of the gang", "Cheat Lua executor")
  end
end)

RegisterServerEvent('gangprop:OutVehicle')
AddEventHandler('gangprop:OutVehicle', function(target)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.gang.name ~= "nogang" then
    TriggerClientEvent('gangprop:OutVehicle', target)
  else
    exports.BanSql:BanTarget(source, "Tried to take out someone from vehicle without being part of the gang", "Cheat Lua executor")
  end
end)

ESX.RegisterServerCallback('gangprop:getPlayerInventory', function(source, cb)

         local xPlayer = ESX.GetPlayerFromId(source)
        local items   = xPlayer.inventory

         cb({
            items = items
        })

 end)

-- RegisterServerEvent('gangprop:spawned')
-- AddEventHandler('gangprop:spawned', function()
-- 	local xPlayer = ESX.GetPlayerFromId(source)
  
-- 	if xPlayer.gang.name == "mafia" then
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent('gangprop:updateBlip', -1)
--   end
  
-- end)

--  AddEventHandler('onResourceStart', function(resourceName)
--   if (GetCurrentResourceName() == resourceName) then
--     Wait(2000)
--     local xPlayers = ESX.GetPlayers()
--       for i=1, #xPlayers, 1 do
--         local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
--           if xPlayer then
--             xPlayer.setGang(xPlayer.gang.name, xPlayer.gang.grade)
--           end
--       end
--   end
-- end)