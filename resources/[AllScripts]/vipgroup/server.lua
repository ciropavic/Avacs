ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
vip1 = {
handcuff = 2
}
vip2 = {
handcuff = 2
}
ESX.RegisterServerCallback('vipmenu:check', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
     exports.ghmattimysql:scalar("SELECT vip FROM users WHERE identifier = @identifier",{
		["identifier"] = xPlayer.identifier
	}, function(result)
	
		if result == 'vip1' then
                cb(vip1)
				elseif result == 'vip2' then
				cb(vip2)
				else 
				cb(nil)
			  end
	end)
			 

end)

ESX = nil
gangs = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterServerEvent('vipmenu:giveWeapon')
-- AddEventHandler('vipmenu:giveWeapon', function(weapon, ammo)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     xPlayer.addWeapon(weapon, ammo)
-- end)


RegisterServerEvent('vipmenu:handcuff')
AddEventHandler('vipmenu:handcuff', function(target)
  local xPlayer = ESX.GetPlayerFromId(source)
  local zPlayer = ESX.GetPlayerFromId(target)
  --if xPlayer.gang.name ~= "nogang" then 
  if zPlayer.admin then
 xPlayer.showNotification("Nemituni Admin Ro Handcuff Koni")
  else
    TriggerClientEvent('vipmenu:handcuff', target)
   end
 -- else
  --    exports.BanSql:BanTarget(source, "Tried to handcuff someone without being part of the gang", "Cheat Lua executor")
  --  end
end)

RegisterServerEvent('vipmenu:drag')
AddEventHandler('vipmenu:drag', function(target)
  local xPlayer = ESX.GetPlayerFromId(source)
  --if xPlayer.gang.name ~= "nogang" then
    TriggerClientEvent('vipmenu:drag', target, source)
 -- else
  --  exports.BanSql:BanTarget(source, "Tried to drag someone without being part of the gang", "Cheat Lua executor")
 -- end
end)

RegisterServerEvent('vipmenu:putInVehicle')
AddEventHandler('vipmenu:putInVehicle', function(target, netId)
  local xPlayer = ESX.GetPlayerFromId(source)
  --if xPlayer.gang.name ~= "nogang" then
    TriggerClientEvent('vipmenu:putInVehicle', target, netId)
--  else
 --   exports.BanSql:BanTarget(source, "Tried to put someone in vehicle without being part of the gang", "Cheat Lua executor")
 -- end
end)

RegisterServerEvent('vipmenu:OutVehicle')
AddEventHandler('vipmenu:OutVehicle', function(target)
  local xPlayer = ESX.GetPlayerFromId(source)
  --if xPlayer.gang.name ~= "nogang" then
    TriggerClientEvent('vipmenu:OutVehicle', target)
 -- else
 --   exports.BanSql:BanTarget(source, "Tried to take out someone from vehicle without being part of the gang", "Cheat Lua executor")
 -- end
end)

ESX.RegisterServerCallback('vipmenu:getPlayerInventory', function(source, cb)

         local xPlayer = ESX.GetPlayerFromId(source)
        local items   = xPlayer.inventory

         cb({
            items = items
        })

 end)

