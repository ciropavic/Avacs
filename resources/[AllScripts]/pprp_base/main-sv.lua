ESX = nil
Spams = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- /reviveall
TriggerEvent('es:addAdminCommand', 'reviveall', 4, function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local admin = GetPlayerName(source)

	if xPlayer.get('admin') then

		TriggerClientEvent('esx_ambulancejob:ReviveIfDead', -1)
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Shoma Tamami Player Haye Server Ra Revive Kardid.")
		TriggerClientEvent('chatMessage', -1, "[SYSTEM]", {255, 0, 0}, " ^0 Tamami Player Ha Tavasot ^2" .. admin .. " ^0Revive Shodand")
		Log('Admin ' ..admin.. ' Ba Id '..source..' Tamami Player Hara Revive Kard.')

	else
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
	end	
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Revive All Players'})
-- /healall
TriggerEvent('es:addAdminCommand', 'healall', 4, function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local admin = GetPlayerName(source)

	if xPlayer.get('admin') then

		TriggerClientEvent('adler:heal', -1)
		TriggerClientEvent('chatMessage', -1, "[SYSTEM]", {255, 0, 0}, " ^0 Tamami Player Ha Tavasot ^2" .. admin .. " ^0Heal Shodand")
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Shoma Be Tamami Player Haye Server Heal Dadid.")
		Log(' Admin ' .. admin .. ' Ba Id '..source..' Be Tamami Player Ha Heal Dad.')

	else
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
	end	
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Heal All Players'})

-- /heal [id] OR /heal [id] [amount]
TriggerEvent('es:addAdminCommand', 'heal', 4, function(source, args, user)

 	local admin = GetPlayerName(source)
	local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
	local tplayer = GetPlayerName(xPlayer.source)
	local heal = tonumber(args[2])
    local pHeal = GetEntityHealth(pPed) - 100

	if tplayer == nil then
		TriggerClientEvent('chatMessage', admin, "[SYSTEM]", {255, 0, 0}, " Arguman Vared Shode Eshtebah Ast ya Fard dar Server Hozoor Nadarad.")
		return
	end
	if xPlayer and tPlayer and heal == nil then
		TriggerClientEvent('adler:heal', source)
	end

 	if args[1] ~= nil then
 		if GetPlayerName(tonumber(args[1])) ~= nil then
			TriggerClientEvent('adler:heal', xPlayer.source)
 		end
 	else
 		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Arguman Vared Shode Eshtebah Ast ya Fard dar Server Hozoor Nadarad.")
 	end

	if args[2] ~= nil then
		TriggerClientEvent('adler:a-heal', tonumber(args[1]), heal)
		TriggerClientEvent('chatMessage', xPlayer.source, "[SYSTEM]", {255, 0, 0}, 'Heal Shoma Tavasot ^2' .. admin .. ' ^0rooye ^2' .. args[2] .. '^2% ^0set shod .' )	
		Log('Admin ' ..admin.. ' Ba Id '..source..' Be ' .. tplayer .. ' Ba Id **'.. xPlayer.source ..'** Ba Heal ' .. pHeal .. ' Heal ' .. args[2] .. ' dad.')
	return
	end

	TriggerClientEvent('chatMessage', xPlayer.source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma Tavasot ^2" .. admin .. " ^0 Heal Kamel Daryaft Kardid. ")
	Log('Admin ' ..admin.. ' Ba Id '..source.. ' Be ' .. tplayer .. ' ba Id '..xPlayer.source..' Ba Heal '  .. pHeal ..  ' Heal Kamel Dad.')
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, 'Shoma Dastresi Kafi Baraye Estefade az In Command Ra Nadarid' )	
end, {help = 'Heal Player', params = { { name = 'id', help = 'Id Fardi Ke Mikhahid Heal Shavad .' }, { name = 'Meghdar Heal', help = 'Meghdar Heali Ke Mikhahid Be Fard Bedahid' }}})
-- /mheal
TriggerEvent('es:addAdminCommand', 'arheal', 4, function(source, args, user)

   local admin   = GetPlayerName(source)
   local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
   local tplayer = GetPlayerName(xPlayer.source)
   local pPed    = GetPlayerPed(args[1])
   local pHeal   = GetEntityHealth(pPed) - 100
   local nHeal   = tonumber(args[1])

   if xPlayer == nil then
	   TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Arguman Vared Shode Eshtebah Ast ya Fard dar Server Hozoor Nadarad.")
	   return
   end

	if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			TriggerClientEvent('adler:mheal', tonumber(args[1]), nHeal)
			TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, "Name : ^2 " .. tplayer .. "^0 , Heal : ^2"..pHeal.." ^0.")
		end
	else
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Arguman Vared Shode Eshtebah Ast ya Fard dar Server Hozoor Nadarad.")
	end
    Log(' Admin '..admin..' Request Heal ID '..xPlayer.source..' ra dad. **Resault : '..pHeal..'**')

end, function(source, args, user)
   TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, 'Shoma Dastresi Kafi Baraye Estefade az In Command Ra Nadarid' )	
end, {help = 'Get Player Heal', params = { { name = 'id', help = 'Id Fardi Ke Mikhahid Heal an ra bebinid .' }}})

--/acoord [id] + [Log]
TriggerEvent('es:addAdminCommand', 'arcoord', 4, function(source, args, user)

	local admin   = GetPlayerName(source)
	local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
	local tplayer = GetPlayerName(xPlayer.source)
	local pPed    = GetPlayerPed(args[1])
	local pHeal   = GetEntityHealth(pPed) - 100
	local nHeal   = tonumber(args[1])
	local pCoord  = GetEntityCoords(pPed)
 
	if xPlayer == nil then
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Arguman Vared Shode Eshtebah Ast ya Fard dar Server Hozoor Nadarad.")
		return
	end
 
	if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, "Name : ^2 " .. tplayer .. "^0 , Coord : ^2"..pCoord.." ^0.")
			Log(' Admin '..admin..' Request Coord ID '..xPlayer.source..' ra dad. **Resault : '..pCoord..'**')
		end
	else
		TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " Arguman Vared Shode Eshtebah Ast ya Fard dar Server Hozoor Nadarad.")
	end
 
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, 'Shoma Dastresi Kafi Baraye Estefade az In Command Ra Nadarid' )	
end, {help = 'Get Player Coords', params = { { name = 'id', help = 'Target Player' }}})

-- Search System

TriggerEvent('es:addCommand', 'search', function(source, args)
    local playerName = GetPlayerName(source)
    if not args[1] then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255,0,0},
            args = {'[Search System]', 'Lotfan Id Player Hadaf Ra Vared Konid'}
        })
        return
    end

    local targetId = tonumber(args[1])
    local TargetIdName = GetPlayerName(targetId)

	if Spams[source] then 
        TriggerClientEvent('chat:addMessage', source, {
            color = {255,0,0},
            args = {'[Search System]', 'Lotfan ^3Spam ^0Nakonid.'}
        })
        return
    end

    TriggerClientEvent('search:requestSearch', targetId, source)
    TriggerClientEvent('search:checkSearchAvailable', source, targetId)
    searchLog('Player ' .. playerName .. ' ba id ' .. source .. ' Darkhast Serach Player ' .. TargetIdName .. ' ba Id ' ..targetId.. ' ra Dad.')

	Citizen.CreateThread(function() 
        Spams[source] = true
        Citizen.Wait(Config.SpamTime)
        Spams[source] = nil
    end)

end, {
    help = "Darkhast Search Kardan Player", params = { {name = "id", help = "Id Fard"} }
})

RegisterNetEvent('search:acceptSearch')
AddEventHandler('search:acceptSearch', function(searcher)
    TriggerClientEvent('search:acceptSearch', searcher, source)
    TriggerClientEvent('chat:addMessage', searcher, {
        color = {255,0,0},
        args = {'[Search System]', ''..GetPlayerName(source)..' Darkhast Search Shomara ^2Accept ^0Kard.'}
    })
	searchLog(''..GetPlayerName(source)..' ba ID '..source..' Darkhast Search '..GetPlayerName(searcher)..' ba ID '..searcher..' ra **Accept** Kard.')
end)

RegisterNetEvent('search:denySearch')
AddEventHandler('search:denySearch', function(source, args, searcher)
    TriggerClientEvent('chat:addMessage', source, {
        color = {255,0,0},
        args = {'[Search System]', ''..GetPlayerName(source)..' Darkhast Search Shomara ^2Deny ^0Kard. [^5Ta 5 Sanie Digar Cooldown Hastid^0] '}
    })
    searchLog('Fard ba Id ' ..source.. ' va Name ' ..GetPlayerName(source).. ' Darkhast Search ' ..GetPlayerName(searcher).. ' Ba Id ' ..searcher.. ' ra **Deny** Kard.')
end)

-- Log in chat or everyone when player dissconnected

AddEventHandler('playerDropped', function(reason)
	if reason ~= nil then
		TriggerClientEvent('chatMessage', -1, "[SYSTEM]", {255, 0, 0},"^2 "..GetPlayerName(source).." ^0Az Server Kharej shod,  ^3("..reason.."^3) .")
		print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. ')')
		Log('``` \n Player '..GetPlayerName(source)..' az Server Kharej shod . ( '..reason..' ) \n ```')
	else
		print('PAYER DISCONNECT LOG IN CHAT WITH ERROR')
	end
	return
end)

local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    -- mandatory wait!
    Wait(5)


    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

end

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
	local player = source
    local identifiers = GetPlayerIdentifiers(player)[1]

	if player ~= nil then
		if identifiers ~= nil then
			Log('``` \n Player ba Name '..name..' va steam hex '..identifiers..' be server connect shod. \n ```')
		end
	end
end)

-- gang system
TriggerEvent('es:addAdminCommand', 'addgangweapon', 8, function(source, args) 
                
    local gName = tostring(args[1])
    local count = tonumber(args[3])
	local wName = tostring(args[2])
    local gLabel = ESX.GetWeaponLabel(wName)
	
    if gLabel == nil or gLabel == '' then
        TriggerClientEvent('chat:addMessage', source, {color = {255,0,0}, args = {'[SYSTEM]', 'weapon not exists'}})
        return
    end
                
    TriggerEvent('gangs:addToInventory-server', gName, 'item_weapon', wName, count)
	Log('Admin '..GetPlayerName(source)..' ba ID '..source..' be gang '..gName..' '..count..' Gun '..wName..' Dad .')
    TriggerClientEvent('chat:addMessage', source, {color = {0,255,0},args = {'[SYSTEM]', 'Gun ' .. gLabel .. ' Added To Gang ' .. gName}})
	end,function(source, args)

    TriggerEvent('chat:addMessage', source, {color = {255, 0, 0},args = {'[SYSTEM]', 'You Don\'t Have Permission To Use This Command .'}})

end, { help = "Dadan Gun Be Gang", params = { {name = "gang name", help = "esm gang"}, {name = "gun name", help = "esm gun"}, {name = "tedad", help = "tedad aslahe"} } })

--/down
TriggerEvent('es:addCommand', 'down', function(source, args, user)
	TriggerClientEvent('adler:downAnim', source, {})
end, {help = "Get down on your knees and put your hands on your head"})