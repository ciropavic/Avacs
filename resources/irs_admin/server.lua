ESX                = nil
AdminPlayers = {}
local rcount = 1
local chats = {}
local event = {name = "none", coords = "nothing", status = true}
tempOown = false
local reports = {}
local resetaccountAceess = {

	'steam:11000013b961c60',
	'steam:11000013f14587e',
	'steam:11000011bdae895',
	'steam:11000011bf03921',
	'steam:110000148adfa01'

}

local disbandfamilyAceess = {
	'steam:11000013b961c60',
	'steam:11000013f14587e',
    'steam:11000011bdae895',
	'steam:11000011bf03921',
	'steam:110000148adfa01'
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()

	local _source = source

	if _source ~= nil then

		local identifier = GetPlayerIdentifier(_source)
		if AdminPlayers[identifier] ~= nil then
			AdminPlayers[identifier] = nil
			TriggerClientEvent('aduty:set_tags', -1, AdminPlayers)
			TriggerEvent('DiscordBot:ToDiscord', 'adminoff', GetPlayerName(_source), 'OffDuty shod')
		end

	end
	--[[local _source = source
	local steamhex = GetPlayerIdentifier(_source)
	print(json.encode(reports))
	
	print(steamhex)
	
		for i=1, #reports, 1 do
		print(json.encode(reports[i]))
		   if reports[i].owner.identifier == steamhex then
			reports[i] = nil
			chats[steamhex] = nil
				      
			end
		end]]
	    

end)

AddEventHandler('esx:playerLoaded', function(source)

	TriggerClientEvent('aduty:set_tags', -1, AdminPlayers)
	
	for k,v in pairs(reports) do
		if v.owner.identifier == identifier then
			v.owner.id = source
		end
	end

end)

RegisterServerEvent("aduty:statusHandler")
AddEventHandler("aduty:statusHandler", function(status)

	tempOown = status

end)

RegisterServerEvent("aduty:changeDutyStatus")
AddEventHandler("aduty:changeDutyStatus", function()

	local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.permission_level >= 2 then
	if xPlayer then
		xPlayer.set('admin', false)
	end
	end

end)

RegisterServerEvent("irs_admin:setEventCoords")
AddEventHandler("irs_admin:setEventCoords", function(coords)

	if coords == nil then return end

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 11 then

		event.coords = coords
		TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Event ^3" .. event.name .. "^0 shoro shode ^1/event ^0jahat join dadan be event")

	else
		ban(source, "Tried to modify event coords without permission")
	end

end)

RegisterCommand('event', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)

	if not args[1] then
		if event.name ~= "none" then
			if event.status ~= true then
				if event.coords ~= "nothing" then
					TriggerClientEvent('es_admin:teleportUserwithoutcar', source, event.coords)
				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Moshkel Dar Daryaft Coords!!")
				end
			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Event Ghofl Shode Ast!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Hich Eventi Vojud Nadarad!")
		end
		return
	end

	if xPlayer.permission_level >= 11 then
		if args[1] == "set" then
			if event.name == "none" then
				
				if not args[2] then
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma esm event ra vared nakardid!")
					return
				end
				local eventName = table.concat(args, " ", 2)

				event.status = false
				event.name = eventName
				TriggerClientEvent('irs_admin:setEventCoords', source)

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Ghablan yek event start shode ast nemitavanid start konid!")
			end
		elseif args[1] == "status" then
			if event.name ~= "none" then
				
				if args[2] == "true" then
					
					event.status = true
					TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Event ^3" .. event.name .. "^0 ^1ghofl^0 shod, digar nemitavanid join dahid!")

				elseif args[2] == "false" then
					
					event.status = false
					TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Event ^3" .. event.name .. "^0 ^2baaz^0 shod, mitavanid join dahid!")

				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat vaziat faghat mitavanid true/false vared konid!")
				 end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Hich eventi shoro nashode ast!")
			end
		elseif args[1] == "remove" then
			if event.name ~= "none" then
				
				TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Event ^3" .. event.name .. "^0 ^2baste^0 shod, mamnon az tamam kasani ke join dadand!")
				event.status = true
				event.name = "none"
				event.coords = "nothing"

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Hich eventi shoro nashode ast!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Argument vared shode eshtebah ast!")
		end
	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kaafi baraye ^1estefade ^0az in dastor nadarid!")
	end
end, false)

ESX.RegisterServerCallback('esx_aduty:doesGangExist', function(source, cb, name, grade)
	if ESX.DoesGangExist(name, grade) then
		cb(true)
	else
		cb(false)
	end
end)
RegisterServerEvent("aduty:playerLoaded")
AddEventHandler("aduty:playerLoaded", function()

	TriggerClientEvent('aduty:set_tags', -1, AdminPlayers)

end)

ESX.RegisterServerCallback('esx_aduty:checkdutystatus', function(source, cb, target)
	CheckPlayerDutyStatus(target, cb)
end)
ESX.RegisterServerCallback('esx_aduty:getAdminPerm', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.permission_level)

end)

ESX.RegisterServerCallback('esx_aduty:checkAduty', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 1 then
		cb(xPlayer.get('admin'))
	else
		cb(false)
	end
	
end)

ESX.RegisterServerCallback('esx_aduty:checkAdmin', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 1 then
			cb(true)
		else
			cb(false)
		end

end)


function CheckPlayerDutyStatus(target, cb)
    local xPlayer = ESX.GetPlayerFromId(target)
	MySQL.Async.fetchAll(
		'SELECT IsOnDuty FROM users WHERE identifier=@identifier',
		{
            ['@identifier'] = xPlayer.identifier,
		}, function(result)
			if result[1].IsOnDuty then
				cb(true)
			else
				cb(false)
			end

		end)
end
ESX.RegisterServerCallback('esx_aduty:getAdminPerm', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.permission_level)

end)

function DutyHandler(target, state)
	local xPlayer = ESX.GetPlayerFromId(target)
	if state then
		xPlayer.set('admin', true)
		xPlayer.set('chatoff',false)
		AdminPlayers[xPlayer.identifier] = {source = xPlayer.source, permission = xPlayer.permission_level, hide = false}
		
		TriggerClientEvent('aduty:tagChanger', xPlayer.source, true)
		TriggerClientEvent('OnDutyHandler', xPlayer.source)
		TriggerClientEvent('aduty:addSuggestions', xPlayer.source)
		TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2OnDuty ^0Shodid!")
	else
		xPlayer.set('admin', false)
		AdminPlayers[xPlayer.identifier] = nil
		TriggerClientEvent('aduty:tagChanger', xPlayer.source, false)
		TriggerClientEvent("OffDutyHandler", xPlayer.source)
		TriggerClientEvent('aduty:removeSuggestions', xPlayer.source)
		TriggerClientEvent('aduty:visibleForce', xPlayer.source)
		TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^1OffDuty ^0Shodid!")
	end
end

RegisterCommand('admin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
     MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', 
							{
								['@identifier'] =  xPlayer.identifier

							}, function(data)
					--		print(data[1].permission_level)
				if xPlayer.permission_level > 0 then

				if data[1].permission_level > 0 then
				
                   
				if xPlayer.get('admin') then
                if xPlayer.group == 'streamer' then
				xPlayer.set('admin', false)
				TriggerClientEvent("OffDutyHandlerStreamer", source)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^1OffDuty ^0Shodid!")
				return
				end
					xPlayer.set('admin', false)
					AdminPlayers[xPlayer.identifier] = nil
					--TriggerClientEvent('aduty:tag', source, false)
					TriggerClientEvent('aduty:tagChanger', xPlayer.source, false)
					
					TriggerClientEvent("OffDutyHandler", source)
					TriggerClientEvent('esx_basicneeds:healPlayer', source)
					TriggerClientEvent('aduty:removeSuggestions', source)
					TriggerClientEvent('aduty:visibleForce', source)
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^1OffDuty ^0Shodid!")
					TriggerEvent('DiscordBot:ToDiscord', 'adminoff', GetPlayerName(source), '```css\n' ..xPlayer.name ..' Off Duty Shod\n```')

				else
                if xPlayer.group == 'streamer' then
				xPlayer.set('admin', true)
				TriggerClientEvent("OnDutyHandlerStreamer", source, "")
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Ba Rank("..xPlayer.permission_level..")^2OnDuty ^0Shodid!")
				return
				end
					if not xPlayer.get('jailed') then
                       
						xPlayer.set('admin', true)
						if xPlayer.permission_level < 7 then
		                TriggerClientEvent('tpborj',xPlayer.source)
		                end
						TriggerClientEvent('aduty:tagChanger', xPlayer.source, false)
						AdminPlayers[xPlayer.identifier] = {source = source, permission = xPlayer.permission_level, hide = false}
					--	TriggerClientEvent('aduty:tag', source, true)
						TriggerClientEvent('aduty:tagChanger', xPlayer.source, true)
						TriggerClientEvent("miladify:resetcharForce", source, false)
						TriggerClientEvent("OnDutyHandler", source, "")
						TriggerClientEvent('esx_basicneeds:healPlayer', source)
						TriggerClientEvent('aduty:addSuggestions', source)
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Ba Rank("..xPlayer.permission_level..")^2OnDuty ^0Shodid!")
						TriggerEvent('DiscordBot:ToDiscord', 'adminon', GetPlayerName(source), '```css\n' ..xPlayer.name ..' On Duty Shod\n```')					

					end

				end
				else
				ban(source,'ZCAC | Try To Set Admin Power')
	           end
									
				end
				end)
	
end)

RegisterCommand('admin2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
     MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', 
							{
								['@identifier'] =  xPlayer.identifier

							}, function(data)
					--		print(data[1].permission_level)
				if xPlayer.permission_level > 10 then

				if data[1].permission_level > 10 then
                   
				if xPlayer.get('admin') then

					xPlayer.set('admin', false)
					AdminPlayers[xPlayer.identifier] = nil
					--TriggerClientEvent('aduty:tag', source, false)
					--TriggerClientEvent('aduty:tagChanger', xPlayer.source, false)
					
					TriggerClientEvent("OffDutyHandler", source)
					TriggerClientEvent('esx_basicneeds:healPlayer', source)
					TriggerClientEvent('aduty:removeSuggestions', source)
					TriggerClientEvent('aduty:visibleForce', source)
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^1OffDuty ^0Shodid!")
					TriggerEvent('DiscordBot:ToDiscord', 'adminoff', GetPlayerName(source), '```css\n' ..xPlayer.name ..' Off Duty(Hidden) Shod\n```')

				else

					

						xPlayer.set('admin', true)
						if xPlayer.permission_level < 7 then
		                TriggerClientEvent('tpborj',xPlayer.source)
		                end
						--TriggerClientEvent('aduty:tagChanger', xPlayer.source, false)
						AdminPlayers[xPlayer.identifier] = {source = source, permission = xPlayer.permission_level, hide = false}
					--	TriggerClientEvent('aduty:tag', source, true)
						--TriggerClientEvent('aduty:tagChanger', xPlayer.source, true)
						TriggerClientEvent("miladify:resetcharForce", source, false)
						TriggerClientEvent("OnDutyHandler", source, "")
						TriggerClientEvent('esx_basicneeds:healPlayer', source)
						TriggerClientEvent('aduty:addSuggestions', source)
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Ba Rank("..xPlayer.permission_level..")^2OnDuty(Hidden) ^0Shodid!")
						TriggerEvent('DiscordBot:ToDiscord', 'adminon', GetPlayerName(source), '```css\n' ..xPlayer.name ..' On Duty Shod\n```')
						

				end
				else
				ban(source,'ZCAC | Try To Set Admin Power')
	           end
									
				end
				end)
	
end)

RegisterServerEvent("aduty:spectag")
AddEventHandler("aduty:spectag", function(sc)
    local xPlayer = ESX.GetPlayerFromId(sc)
	print(sc)
	    if AdminPlayers[xPlayer.identifier].hide == false then

				AdminPlayers[xPlayer.identifier].hide = true
				TriggerClientEvent('aduty:tagChanger', sc, false)
				TriggerClientEvent('aduty:set_tags', -1, AdminPlayers)
			--	TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2tag^0 khod ra khamosh kardid")

			else

				AdminPlayers[xPlayer.identifier].hide = false
				TriggerClientEvent('aduty:tagChanger', sc, true)
				TriggerClientEvent('aduty:set_tags', -1, AdminPlayers)
			--	TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2tag^0 khod ra roshan kardid")

			end

end)
--[[RegisterCommand('changetag', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 8 then

		if xPlayer.get('admin') then

			if AdminPlayers[xPlayer.identifier].hide == false then

				AdminPlayers[xPlayer.identifier].hide = true
				TriggerClientEvent('toggletag',source)
				TriggerEvent('esx_idoverhead:changeLabelHideStatus', source, true)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2tag^0 khod ra khamosh kardid")

			else

				AdminPlayers[xPlayer.identifier].hide = false
			TriggerClientEvent('toggletag',source)
			TriggerEvent('esx_idoverhead:changeLabelHideStatus', source, false)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2tag^0 khod ra roshan kardid")

			end

		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
	end

end, false)]]

--[[RegisterCommand('owntoggle', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 2  then

		if xPlayer.get('admin') then

			TriggerClientEvent('aduty:returnStatus', source)
			Citizen.Wait(250)
			if tempOown then
				TriggerClientEvent('aduty:tagChanger', source, false)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2tag^0 khod ra baraye khod khamosh kardid")
			else
				TriggerClientEvent('aduty:tagChanger', source, true)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^2tag^0 khod ra baraye khod roshan kardid")
			end

		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
	end

end, false)]]

RegisterCommand("changeped", function(source, args, user)

	local xPlayer = ESX.GetPlayerFromId(source)

			if xPlayer.permission_level >= 12 then

				if xPlayer.get('admin') then

					if args[1] then

						if args[2] == nil then

							local requestped = tostring(args[1])

							TriggerClientEvent("changepedHandler", source, requestped)

						else

							TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma esm ped ra faghat bayad dar argument aval vared konid")

						end

					else

						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma hich pedi vared nakardid")


					end

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
			end

end)
msg = ""
RegisterCommand('alert', function(source, args, user)
		local xPlayer = ESX.GetPlayerFromId(source)
        
		if xPlayer.permission_level >= 11 then
			for i,v in pairs(args) do
				msg = msg .. " " .. v
			end
			TriggerClientEvent("alert", -1, msg)
			msg = ""
    end
end)

RegisterCommand("molgha", function(source, args, user)

	local xPlayer = ESX.GetPlayerFromId(source)

			if xPlayer.permission_level >= 12 then

				if xPlayer.get('admin') then

					

                           if tonumber(args[1]) then
							TriggerClientEvent("changepedHandler", tonumber(args[1]), 'mp_m_freemode_01')
							
							end

						

					

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
			end

end)

--[[RegisterCommand("drive", function(source, user)

	local xPlayer = ESX.GetPlayerFromId(source)

			if xPlayer.permission_level >= 3 then

				if xPlayer.get('admin') then

					TriggerClientEvent("aduty:drive", source)

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
			end

end)
RegisterCommand("rgb", function(source, user)

	local xPlayer = ESX.GetPlayerFromId(source)

			if xPlayer.permission_level > 0 then

				if xPlayer.get('admin') then

					TriggerClientEvent("aduty:rgb", source)

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
			end

end)

RegisterCommand('resetped', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level > 9 then

				if xPlayer.get('admin') then

					TriggerClientEvent("resetpedHandler", source, "s_m_m_chemsec_01")
		            TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Ped shoma ba movafaghat reset shod!")

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
	end


end)]]

RegisterCommand("pm", function(source, args)

local xPlayer = ESX.GetPlayerFromId(source)

if xPlayer.permission_level >= 2 then
		if args[1] and args[2] then
			if tonumber(args[1]) then
				local target = tonumber(args[1])
				if GetPlayerName(target) then

				local targetPlayer = ESX.GetPlayerFromId(target)
				local message = table.concat(args, " ",2)

					TriggerClientEvent('chatMessage', target, "^0(^1" .. "^1STAFF | " .. GetPlayerName(source) .. "^0)" .. " ^3>>", {255, 0, 0}, "^0" .. message)
					TriggerClientEvent('chatMessage', source, "^0(^1" .. GetPlayerName(target) .. "^0)" .. " ^3>>", {255, 0, 0}, "^0" .. message)

				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")
				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")
			end

		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Syntax vared shode eshtebah ast!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
	end

end)

RegisterCommand("register", function(source, args)

local xPlayer = ESX.GetPlayerFromId(source)

if xPlayer.permission_level >= 11 then
		if args[1] then
			if tonumber(args[1]) then
				local target = tonumber(args[1])
				if GetPlayerName(target) then

				 TriggerClientEvent("showRegisterForm",target)

				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")
				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")
			end

		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Syntax vared shode eshtebah ast!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
	end

end)

RegisterCommand("setarmor", function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 8 then

				if xPlayer.get('admin') then

					if args[1] and args[2] then
						if tonumber(args[1]) then

							local target = tonumber(args[1])

							  if tonumber(args[2]) then

									  local armor = tonumber(args[2])

								 if armor <= 100 then

										if GetPlayerName(target) then

										local targetPlayer = ESX.GetPlayerFromId(target)
                                              if armor <99 then
											TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^2" .. GetPlayerName(source) .. " ^0 Armor shomara be ^3" .. armor ..  " ^0Taghir dad!")
											TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0 Shoma be ^2 " .. GetPlayerName(target) .. "^3 " .. armor .. " ^0Armor dadid!")
											TriggerClientEvent('armorHandler', target, armor)
											else
											TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^2" .. GetPlayerName(source) .. " ^0 Armor shomara be ^3" .. armor ..  " ^0Taghir dad!")
											TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0 Shoma be ^2 " .. GetPlayerName(target) .. "^3 " .. armor .. " ^0Armor dadid!")
											TriggerClientEvent('armorHandler', target, 98)
											end

										else
											TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")
										end
								else
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitavanid meghdar armor ra bishtar az 100 vared konid!")
								end

								else
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat Armor faghat mitavanid adad vared konid!")
								end

						else
							TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")
						end

					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Syntax vared shode eshtebah ast!")
					end

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

		else
			if xPlayer.permission_level > 1 then
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye estefade az in dastor nadarid!")
			else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")
			end
		end

	end)

RegisterCommand('fineoffline', function(source, args, users)
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.permission_level >= 7 then

					if xPlayer.get('admin') then

						if args[1] and args[2] and args[3] then

							local OnlinePlayers = ESX.GetPlayers()
							local run = true

									for i=1, #OnlinePlayers, 1 do

										local xPlayers = ESX.GetPlayerFromId(OnlinePlayers[i])

										if xPlayers.name == args[1] then

											run = false

										end

									end

							if run then
									local money = tonumber(args[2])
									if money then

										MySQL.Async.fetchAll('SELECT * FROM users WHERE playerName = @playername',
										{
											['@playername'] = args[1]

										}, function(data)
											if data[1] then

												if #data > 1 then

													TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Bish az yek player ba in naam vojoud darad!")

													for i=1, #data, 1 do

														TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0player haye mojoud:" .. data[i].playerName )

													end

												else

													local playerMoney = data[1].bank

													if playerMoney >= money then

																MySQL.Async.execute('UPDATE users SET bank = bank - @money WHERE identifier=@identifier',
																{
																	['@identifier'] = data[1].identifier,
																	["@money"] = money

																}, function(rowsChanged)
																	if rowsChanged > 0 then

																		local previousmoney = playerMoney
																		local currentmoney = playerMoney - money

																		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma az^1 " .. args[1] .. " ^0Mablagh ^2" .. money .. "$ ^0kam kardid!" )
																		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Pool ghadimi ^3" .. args[1] .. " ^1" .. previousmoney .. "$^0 Pool jadid ^2" .. currentmoney .. "$" )

																		local reason = table.concat(args, " ",3)
																		TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^6" .. args[1] .. " ^2" .. money .. "$ ^0 Jarime shod be elat ^3^*" .. reason )


																		MySQL.Async.execute('INSERT INTO fines (identifier, name, fineamount, reason, punisher) VALUES (@identifier, @name, @fineamount, @reason, @punisher)',
																		{
																			['@identifier'] = data[1].identifier,
																			['@name'] = args[1],
																			['@fineamount'] = money,
																			['@reason'] = reason,
																			['@punisher']= GetPlayerName(source)
																		})

																	end
																end)

														else

															TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Pool player mored nazar baraye in meghdar az jarime kafi nist!")
															TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Poole ^1" .. args[1] .. " ^2" .. playerMoney .. "$ ^0ast!" )
													end


												end

											else
												TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar vojoud nadarad!")
											end
										end)


									else
										TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat fine faghat mitavanid adad vared konid!")
									end

								else
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online ast!")
								end

							else
								TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Syntax vared shode eshtebah ast!")
							end

					else

						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

					end

		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma admin nistid!")
		end
end)


RegisterCommand('plate', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.permission_level >= 11 then

				if xPlayer.get('admin') then

					if args[1] then
						local licenseplate = table.concat(args, " ")
						TriggerClientEvent("aduty:vehiclelicenseHandler", source, licenseplate)
					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma hich pelaki vared nakardid!")
					end

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

        else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma admin nistid!")
    end
end)

RegisterCommand("dtype", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.permission_level >= 10 then
        if not args[1] then
            TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0Shoma dar ghesmat vehicle chizi vared nakardid!")
            return
         end
    
         local input = args[1]
         local hash = GetHashKey(input)
         local count = 0
    
         for k,v in pairs(GetAllVehicles()) do
             local vehHash = GetEntityModel(v)
             if vehHash == hash then
                Citizen.InvokeNative(0xFAA3D236, v)
                count = count + 1
             end
         end
    
         TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0Server ba movafaghiat ^1" .. count .. "^0 adad ^3" .. input .. "^0 hazf kard!")
    else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kaafi baraye ^1estefade ^0az in dastor nadarid!")
    end
end, false)

RegisterCommand("dv3", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.permission_level >= 1 then
        if not args[1] then
            TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0Shoma Hich Pelaki Ro Vared Nakardid!")
            return
         end
    
         local input = args[1]
    
         for k,v in pairs(GetAllVehicles()) do
             if GetVehicleNumberPlateText(v) == input then
                 Citizen.InvokeNative(0xFAA3D236, v)
             end
         end
    
         TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0Server ba movafaghiat ^3" .. input .. "^0 ro hazf kard!")
    else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kaafi baraye ^1estefade ^0az in dastor nadarid!")
    end
end, false)



RegisterCommand('ac', function(source, args)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.permission_level >= 1 then
        if args[1] then

                        local name = GetPlayerName(source)
                        local message = table.concat(args, " ")


                            local xPlayers = ESX.GetPlayers()

                            for i=1, #xPlayers, 1 do

                                local xP = ESX.GetPlayerFromId(xPlayers[i])

                                if xP.permission_level > 0 and xP.group ~= 'streamer' then
                                    if xP.chatoff ~= true then 
									TriggerClientEvent('chatMessage', xPlayers[i], "", {255, 0, 0}, "^4[^1Admin Chat^4] ^3" .. name .. "("..source..")^0: " .. "^0^*" .. message .. "^4") 
									end
                                   

                                end

                            end


                    else
                        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitavanid matn khali befrestid!")
                    end

    else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma admin nistid!")
    end

end)

RegisterCommand('kick', function(source, args, user)

    local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 4 then

		if args[1] and args[2] then

			target = tonumber(args[1])

				if target then

					local name = GetPlayerName(target)
					if name then

                        targetPlayer = ESX.GetPlayerFromId(target)
						local message = table.concat(args, " ", 2)
						targetPlayer.kick(GetPlayerName(source) .. " Shomara kick kard be dalil: " .. message)
						TriggerClientEvent('chatMessage', -1, "[Admin]", {255, 0, 0}, "^1" .. name .. " ^0tavasot ^2" .. GetPlayerName(source) .. " ^0kick shod dalil ^3" .. message)

					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")
					end

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")

				end


			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Syntax vared shode eshtebah ast!")

		end

    else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma admin nistid!")
	end

end)

RegisterCommand('reloadskin', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 1 then

				if xPlayer.get('admin') then

					if args[1] then
							local target = tonumber(args[1])
											

								if target then

									if GetPlayerName(target) then



											TriggerClientEvent('irsadmin:skin',target)
											TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar load shod!")

										

									else

										TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")

									end

								else

									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")

								end							


					else

						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID chizi vared nakardid!")

					end

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

	else

		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

	end

end)

RegisterCommand('chatoff', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 1 then

				
				if xPlayer.chatoff == true then
				-- off
				xPlayer.set('chatoff', false)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Chat Admin On Shod")
				else
				--on
				xPlayer.set('chatoff', true)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Chat Admin Off Shod")
				end

	else

		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

	end

end)

RegisterCommand('unmute', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 1 then

				if xPlayer.get('admin') then

					if args[1] then
						local target = tonumber(args[1])

							if target then

								if GetPlayerName(target) then


										TriggerClientEvent('chat:setMuteStatus', target, false)
										TriggerClientEvent('aduty:setMuteStatus', target, false)
										TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^3" .. GetPlayerName(target) .. "^0 ra ^2unmute ^0kardid!")
										TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma tavasot ^2" .. GetPlayerName(source) .. "^0 ^3unmute ^0shodid!")

								else

									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")

								end

							else

								TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")

							end

					else

						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID chizi vared nakardid!")

					end

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

	else

		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

	end

end)

RegisterCommand('disablefire', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 11 then
     
	ncz = not ncz
	TriggerClientEvent('irs:ncz', -1, ncz)

	else

		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

	end

end)

RegisterCommand("toggleid", function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 1 then

				if xPlayer.get('admin') then

					TriggerClientEvent('aduty:changeShowStatus', source)

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

	else

		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

	end

end)

RegisterCommand("resetaccount", function(source, args)

		if isAllowedToReset(source) then

			if args[1] then
				if args[2] then
					local hex = args[1]
					local reason = table.concat(args, " ", 2)

					MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
					{
						['@identifier'] = hex

					}, function(data)
						if data[1] then

							CK({identifier = data[1].identifier, name = data[1].playerName}, source, reason)

						else
							TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar vojoud nadarad!")
						end
				end)

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat dalil chizi vared nakardid!")
			end

			else

				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat esm chizi vared nakardid!")

			end


		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye esfade az in dastor ra nadarid!")

		end

end, false)

RegisterCommand("deletecar", function(source, args)

		if isAllowedToReset(source) then

			if args[1] then
				
            MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', { ['@plate'] = args[1]})
            TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Ba Mofavaghiat Yek Mashin Ba Pelak " .. args[1] .. " Hazf Kardid") 
			else

				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Dar Ghesmat Pelak Chizi Vared Nakardid!")

			end


		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye esfade az in dastor ra nadarid!")

		end

end, false)

RegisterCommand("setmoneyall", function(source, args)

		if isAllowedToReset(source) then

			if tonumber(args[1]) then
				
            local xPlayers   = ESX.GetPlayers()
	        for i=1, #xPlayers, 1 do
	      	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	    	xPlayer.addMoney(tonumber(args[1]))
	     	TriggerClientEvent('chatMessage', xPlayer.source , " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Tabrik Shoma Mablagh ".. tonumber(args[1]) .. " Tavasot Admin Jayeze Gereftid :)!!!")
	        end
			
			else

				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Dar Ghesmat Meghdar Poul Chizi Vared Nakardid!")

			end


		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye esfade az in dastor ra nadarid!")

		end

end, false)

TriggerEvent('es:addAdminCommand', 'bringall', 11, function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers   = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
	Wait(200)
		local yPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('es_admin:teleportUserwithoutcar', yPlayer.source , user.coords)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Bring All"})

function CK(target, iniator, reason)
local xPlayer = ESX.GetPlayerFromIdentifier(target.identifier)
if xPlayer then
	DropPlayer(xPlayer.source, "Shoma character kill shodid, lotfan dobare join dahid!")
end

MySQL.Async.execute('DELETE FROM addon_account_data WHERE owner = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('DELETE FROM addon_inventory_items WHERE owner = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('DELETE FROM billing WHERE identifier = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('DELETE FROM billing WHERE sender = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('DELETE FROM datastore_data WHERE owner = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('DELETE FROM owned_properties WHERE owner = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('DELETE FROM owned_vehicles WHERE owner = @identifier', { ['@identifier'] = target.identifier })
MySQL.Async.execute('UPDATE users SET bank = 0, money = 0, job = "unemployed", job_grade = 0, inventory = "[]", loadout = "[]", position = NULL, skin = NULL WHERE identifier = @identifier', { ['@identifier'] = target.identifier })

--[[PerformHttpRequest("https://irpixel.ir/crime.php?id=" .. target.identifier .. "&pass=zB3ekDS9KPjVvuXHvGdQJ735Cbfxs54BgVttaacKAmgFsQZxp4cHZQDtRJPT", function (errorCode, resultData, resultHeaders)

	if errorCode == 200 then
		if resultData ~= "OK" then
			if tonumber(iniator) then TriggerClientEvent('chatMessage', iniator, "", {255, 0, 0}, "Identifier shakhs mored nazar baraye pak kardan criminal record ha peyda nashod be developer etelaa dahid!") end
		end
	else
		if tonumber(iniator) then TriggerClientEvent('chatMessage', iniator, "", {255, 0, 0}, "Khatayi dar pak kardan criminal record ha pish amad be developer etelaa dahid!") end
	end

end, "GET")]]

TriggerEvent('DiscordBot:ToDiscord', 'disband', 'ResetAccount Log', (GetPlayerName(iniator) or iniator) .. " accounte " .. target.name .. " ra reset kard be dalil: " .. reason,'user', true, iniator or 1, false)
if tonumber(iniator) then TriggerClientEvent('chatMessage', iniator, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Account ^1" .. target.name .. " ^0ba ^2movafaghiat ^0reset shod, Dalil: " .. reason) end
TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Account ^2" .. target.name .. " ^0be dalil ^1" .. reason .. " ^0reset shod!")
end

RegisterCommand("disband", function(source, args)

	if isAllowedToDisband(source) then

		if args[1] then
			if args[2] then

				local gang = args[1]
				local reason = table.concat(args, " ", 2)

				MySQL.Async.fetchAll('SELECT gang_name FROM gangs_data WHERE gang_name = @gang',
				{
					['@gang'] = gang

				}, function(data)
					if data[1] then

						MySQL.Async.execute('DELETE FROM gangs WHERE name = @gang', { ['@gang'] = gang })
						MySQL.Async.execute('DELETE FROM gang_grades WHERE gang_name = @gang', { ['@gang'] = gang })
						MySQL.Async.execute('DELETE FROM gang_account WHERE name = @gang', { ['@gang'] = "gang_" .. string.lower(gang) })
						MySQL.Async.execute('DELETE FROM addon_inventory_items WHERE inventory_name = @gang', { ['@gang'] = "gang_" .. string.lower(gang) })
						MySQL.Async.execute('DELETE FROM gang_account_data WHERE gang_name = @gang', { ['@gang'] = "gang_" .. string.lower(gang) })
						MySQL.Async.execute('DELETE FROM datastore_data WHERE name = @gang', { ['@gang'] = "gang_" .. string.lower(gang) })
						MySQL.Async.execute('DELETE FROM datastore WHERE name = @gang', { ['@gang'] = "gang_" .. string.lower(gang) })
						MySQL.Async.execute('DELETE FROM addon_inventory WHERE name = @gang', { ['@gang'] = "gang_" .. string.lower(gang) })
						MySQL.Async.execute('DELETE FROM gangs_data WHERE gang_name = @gang', { ['@gang'] = gang })
						MySQL.Async.execute('DELETE FROM owned_vehicles WHERE owner = @gang', { ['@gang'] = gang })
						MySQL.Async.execute('UPDATE users SET gang = "nogang" WHERE gang = @gang', { ['@gang'] = gang })
						local xPlayers = ESX.GetPlayers()

						for i=1, #xPlayers, 1 do

							local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

							if xPlayer.gang.name == gang then

								xPlayer.setGang("nogang", 0)

							end

						end
					TriggerEvent('DiscordBot:ToDiscord', 'disband', 'Disband Log', GetPlayerName(source) .. " gange " .. gang .. " ra disband kard be dalil: " .. reason,'user', true, source, false)
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0gang ^1" .. gang .. " ^0ba ^2movafaghiat ^0disband shod, dalil: " ..  reason)
						TriggerClientEvent('chatMessage', -1, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0gang ^2" .. gang .. " ^0be dalil ^1" .. reason .. " ^0disband shod!")


					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Family mored nazar vojoud nadarad!")
					end
				end)

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat dalil chizi vared nakardid!")
			end

		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat esm family chizi vared nakardid!")

		end


	else

		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye esfade az in dastor ra nadarid!")

	end

end, false)

RegisterCommand('fuel', function(source, args)

		local xPlayer = ESX.GetPlayerFromId(source)

			if xPlayer.permission_level >= 4 then

				if xPlayer.get('admin') then

					TriggerClientEvent('aduty:refuel', source)

				else

					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

				end

			else

				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

			end

end, false)

RegisterCommand('invis', function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 9 then

			if xPlayer.get('admin') then
                 TriggerEvent('esx_idoverhead:changeLabelHideStatus', source, false)
				TriggerClientEvent('aduty:vanish', source)

			else

				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Off Duty Hasti Bitch!")

			end

		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

		end

end, false)

--[[RegisterCommand('forcevisible', function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 16 then

		if args[1] then

			if args[1] == "true" then
				TriggerClientEvent('aduty:forceStatus', -1, true)
			elseif args[1] == "false" then
				TriggerClientEvent('aduty:forceStatus', -1, false)
			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Dade na malom ast!")
			end

		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Dar ghesmat dade chizi vared nakardid")
	end

		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

		end

end, false)]]

RegisterCommand('dv2', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 1 then
			TriggerClientEvent('aduty:deleteVehicle', source)
		end

end, false)

RegisterCommand('getplate', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 1 then
			TriggerClientEvent('aduty:getplateVehicle', source)
		end

end, false)

RegisterCommand('name', function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 1 then

			if args[1] then
				local target = tonumber(args[1])
					if target then
						local targetPlayer = ESX.GetPlayerFromId(target)

							if targetPlayer then

								TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Esm IC player mored nazar ^3" .. string.gsub(targetPlayer.name, "_", " ") .. " ^0ast!")

							else
								TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist!")
							end

					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid.")
					end
			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID chizi vared nakardid.")
			end

		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " Dast Nazan Peshkel")

		end

end, false)

RegisterCommand('kickall', function(source, args)

	if source ~= 0 then

		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 11 then

			local xPlayers = ESX.GetPlayers()

				for i=1, #xPlayers, 1 do

					Citizen.Wait(50)
					xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					xPlayer.kick('Server Dar Hal Restart Shodan Ast Lotfan Sabour Bashid('.. xPlayer.name ..')')

				end


		else

			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ^1Dastresi ^0kafi baraye estefade az in dastor ra nadarid!")

		end

	else

		local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do

				xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				xPlayer.kick('Server dar hale restart shodan ast lotfan shakiba bashid')

			end

	end


end, false)

RegisterCommand("removeallweapon", function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 11 then
		if not args[1] then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat esm gun chizi vared nakardid!")
			return
		end

		local weapon = string.upper(args[1])
		local gangs, properties, totalusers, totalvehicles, desiredWeapon = 0, 0, 0, 0, 0
		local gangsd, propertiesd, totalusersd, totalvehiclesd = 0, 0, 0, 0

		MySQL.Async.fetchAll('SELECT * FROM datastore_data', {}, function(data)

			for i=1, #data do
				if data[i].name == "property" then

						local weaponData = json.decode(data[i].data)
						if weaponData.weapons then
							local found = false

							for j,v in ipairs(weaponData.weapons) do
								if v.name == weapon then
									found = true
									 print("found weapon on property: " .. data[i].owner .. " at index: " .. tostring(j))
									table.remove(weaponData.weapons, j)
									desiredWeapon = desiredWeapon + 1
									propertiesd = propertiesd + 1
								end
							end

							if found then
								MySQL.Async.execute('UPDATE datastore_data SET `data` = @data WHERE `owner` = @identifier', { ['@identifier'] = data[i].owner, ['@data'] = json.encode(weaponData) })
							end
							
						end
						
					properties = properties + 1
				elseif string.match(data[i].name, "gang") then
					local weaponData = json.decode(data[i].data)
					if weaponData.weapons then
						local found = false

						for j,v in ipairs(weaponData.weapons) do
							if v.name == weapon then
								found = true
								 print("found weapon on gang: " .. data[i].name .. " at index: " .. tostring(j))
								table.remove(weaponData.weapons, j)
								desiredWeapon = desiredWeapon + 1
								gangsd = gangsd + 1
							end
						end

						if found then
							MySQL.Async.execute('UPDATE datastore_data SET `data` = @data WHERE `name` = @name', { ['@identifier'] = data[i].name, ['@data'] = json.encode(weaponData) })
						end
					end
					
					gangs = gangs + 1
				end
			end

			MySQL.Async.fetchAll('SELECT * FROM users', {}, function(users)
				for i=1, #users do
					if users[i].loadout then
						local loadout = json.decode(users[i].loadout)
						if loadout then
							local found = false

							for j,v in ipairs(loadout) do
								if v.name == weapon then
									found = true
									 print("found weapon on player: " .. users[i].playerName .. " at index: " .. tostring(j))
									table.remove(loadout, j)
									desiredWeapon = desiredWeapon + 1
									totalusersd = totalusersd + 1
								end
							end

							if found then
								MySQL.Async.execute('UPDATE users SET `loadout` = @data WHERE `identifier` = @identifier', { ['@identifier'] = users[i].identifier, ['@data'] = json.encode(loadout) })
							end
						end
					end

					totalusers = totalusers + 1
				end

				MySQL.Async.fetchAll('SELECT * FROM trunk_inventory', {}, function(vehicles)
					for i=1, #vehicles do
						if vehicles[i].data then
							local loadout = json.decode(vehicles[i].data)
							if loadout.weapons then
								local found = false

								for j,v in ipairs(loadout.weapons) do
									if v.name == weapon then
										found = true
										 print("found weapon on player: " .. users[i].playerName .. " at index: " .. tostring(j))
										table.remove(loadout.weapons, j)
										desiredWeapon = desiredWeapon + 1
										totalvehiclesd = totalvehiclesd + 1
									end
								end

								if found then
									MySQL.Async.execute('UPDATE trunk_inventory SET `data` = @data WHERE `id` = @id', { ['@id'] = vehicles[i].id, ['@data'] = json.encode(loadout) })
								end

							end
						end

						totalvehicles = totalvehicles + 1
					end

					local info = {
						iniator = "Purge wave",
						weapon = weapon,
						utotal = totalusers,
						udtotal = totalusersd,
						ptotal = properties,
						pdtotal = propertiesd,
						gtotal = gangs,
						gdtotal = gangsd,
						vtotal = totalvehicles,
						vdtotal = totalvehiclesd,
						dtotal = desiredWeapon
					}
					TriggerEvent('esx_logger:log2', source, info)
				end)


			end)
			
		end)

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye esfade az in dastor ra nadarid!")
	end
	
end, false)

RegisterCommand("countweapon", function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level >= 11 then
		if not args[1] then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat esm gun chizi vared nakardid!")
			return
		end

		local weapon = string.upper(args[1])
		local gangs, properties, totalusers, totalvehicles, desiredWeapon = 0, 0, 0, 0, 0
		local gangsd, propertiesd, totalusersd, totalvehiclesd = 0, 0, 0, 0

		MySQL.Async.fetchAll('SELECT * FROM datastore_data', {}, function(data)

			for i=1, #data do
				if data[i].name == "property" then

						local weaponData = json.decode(data[i].data)
						if weaponData.weapons then
							local found = false

							for j,v in ipairs(weaponData.weapons) do
								if v.name == weapon then
									found = true
								--	TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0},  "Property : " .. data[i].owner)
									desiredWeapon = desiredWeapon + 1
									propertiesd = propertiesd + 1
								end
							end
							
							
						end
						
					properties = properties + 1
				elseif string.match(data[i].name, "gang") then
					local weaponData = json.decode(data[i].data)
					if weaponData.weapons then
						local found = false

						for j,v in ipairs(weaponData.weapons) do
							if v.name == weapon then
								found = true					
                                 --  TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0},  "Gang : " .. data[i].name)								
								desiredWeapon = desiredWeapon + 1
								gangsd = gangsd + 1
							end
						end

						
					end
					
					gangs = gangs + 1
				end
			end

			MySQL.Async.fetchAll('SELECT * FROM users', {}, function(users)
				for i=1, #users do
					if users[i].loadout then
						local loadout = json.decode(users[i].loadout)
						if loadout then
							local found = false

							for j,v in ipairs(loadout) do
								if v.name == weapon then
									found = true			
                                    -- TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0},  "User : " .. users[i].playerName)									
									desiredWeapon = desiredWeapon + 1
									totalusersd = totalusersd + 1
								end
							end

							
						end
					end

					totalusers = totalusers + 1
				end

				MySQL.Async.fetchAll('SELECT * FROM trunk_inventory', {}, function(vehicles)
					for i=1, #vehicles do
						if vehicles[i].data then
							local loadout = json.decode(vehicles[i].data)
							if loadout.weapons then
								local found = false

								for j,v in ipairs(loadout.weapons) do
									if v.name == weapon then
										found = true
										--TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0},  "Trunk : " .. vehicles[i].plate)							
										desiredWeapon = desiredWeapon + 1
										totalvehiclesd = totalvehiclesd + 1
									end
								end

								

							end
						end

						totalvehicles = totalvehicles + 1
					end

					local info = {
						iniator = "Purge wave",
						weapon = weapon,
						utotal = totalusers,
						udtotal = totalusersd,
						ptotal = properties,
						pdtotal = propertiesd,
						gtotal = gangs,
						gdtotal = gangsd,
						vtotal = totalvehicles,
						vdtotal = totalvehiclesd,
						dtotal = desiredWeapon
					}
					
				end)
				
            TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Tedad Mojod Az Gun("..weapon..") : " .. desiredWeapon)

			end)
			
		end)

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye esfade az in dastor ra nadarid!")
	end
	
end, false)

--[[RegisterCommand('setbadge', function(source, args)


		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 4 or xPlayer.job.name == 'police' then

			if args[1] then
			if args[2] then
				local target = tonumber(args[1])
				if target ~= nil then
				local target2 = tonumber(args[2])
				if target2 ~= nil then

					if GetPlayerName(target) then

							MySQL.Async.fetchAll('SELECT * FROM users WHERE badge=@badge', 
							{
								['@badge'] = target2

							}, function(data)
								if data[1] then

									TriggerClientEvent('chatMessage', source, "[BADGE]", {255, 0, 0}, "^2" ..args[2]  .. " ^0In Bdge Vojud Darad!")
													
								else
                                    targetp = ESX.GetPlayerFromId(target)
									TriggerEvent('esx_license:addLicense', target, type)
									MySQL.Async.execute('UPDATE users SET badge = @code WHERE identifier = @identifier', {
				                    ['@code']        = target2,
				                    ['@identifier'] = targetp.identifier
			                        }, function(rowsChanged)

		                            	end)
									TriggerClientEvent('chatMessage', source, "[BADGE]", {255, 0, 0}, " ^0Shoma Be^2 " .. GetPlayerName(target) .. "^0 BADGE " .. target2 .. " Dadid!" )
									TriggerClientEvent('chatMessage', target, "[LICENSE]", {255, 0, 0}, " ^0Shoma BADGE" .. target2 .. " Gereftid!")
									
								end
							end)

					else
						TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0ID vared shode na motabar ast!")
					end
				else
					TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat code badge faghat adad vared konid!")
				end

				else
					TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat ID faghat adad vared konid!")
				end

			else
				TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma dar ghesmat code badge chizi vared nakardid!")
			end
		else
			TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma bayad ID player marbote ra vared konid!")
		end

		end
end, false)]]

RegisterCommand('setperm', function(source, args)


		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 11 then

			if args[1] then
			if args[2] then
				local target = tonumber(args[1])
				if target ~= nil then
				local target2 = tonumber(args[2])
				if target2 ~= nil then

					if GetPlayerName(target) then

							
                                    targetp = ESX.GetPlayerFromId(target)
									targetp.set('permission_level',target2)
									MySQL.Async.execute('UPDATE users SET permission_level = @perm WHERE identifier = @identifier', {
				                    ['@perm']        = target2,
				                    ['@identifier'] = targetp.identifier
			                        }, function(rowsChanged)
                      
		                            	end)
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Be^2 " .. GetPlayerName(target) .. "^0 Perm " .. target2 .. " Dadid!" )
									TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Perm " .. target2 .. " Gereftid!")
									
								

					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0ID vared shode na motabar ast!")
					end
				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat permission faghat adad vared konid!")
				end

				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat ID faghat adad vared konid!")
				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat permission chizi vared nakardid!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad ID player marbote ra vared konid!")
		end

		end
end, false)

RegisterCommand('setgroup', function(source, args)


		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 11 then

			if args[1] then
			if args[2] then
				local target = tonumber(args[1])
				if target ~= nil then
				local target2 = args[2]

					if GetPlayerName(target) then

							
                                    targetp = ESX.GetPlayerFromId(target)
									targetp.set('group',target2)
									MySQL.Async.execute('UPDATE users SET `group` = @group WHERE identifier = @identifier', {
				                    ['@group']        = target2,
				                    ['@identifier'] = targetp.identifier
			                        }, function(rowsChanged)
                      
		                            	end)
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Be^2 " .. GetPlayerName(target) .. "^0 Group " .. target2 .. " Dadid!" )
									TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Group " .. target2 .. " Gereftid!")
									
								

					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0ID vared shode na motabar ast!")
					end
				

				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat ID faghat adad vared konid!")
				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat permission chizi vared nakardid!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad ID player marbote ra vared konid!")
		end

		end
end, false)

RegisterCommand('setpermoffline', function(source, args)


		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 11 then

			if args[1] then
			if args[2] then
				local target = args[1]
				local target2 = tonumber(args[2])
				
									MySQL.Async.execute('UPDATE users SET permission_level = @perm WHERE identifier = @identifier', {
				                    ['@perm']        = target2,
				                    ['@identifier'] = target
			                        }, function(rowsChanged)
                      
		                            	end)
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Be^2 " .. target .. "^0 Perm " .. target2 .. " Dadid!" )
									
								

				
				

				

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat permission chizi vared nakardid!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad steam hex player marbote ra vared konid!")
		end

		end
end, false)


RegisterCommand('setvip', function(source, args)


		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 11 then

			if args[1] then
			if args[2] then
				local target = tonumber(args[1])
				target2 = tostring(args[2])
				if target ~= nil then
				if target2 ~= nil then

					if GetPlayerName(target) then

							
                                    targetp = ESX.GetPlayerFromId(target)
									--targetp.set('group',target2)
									MySQL.Async.execute('UPDATE users SET vip = @grp WHERE identifier = @identifier', {
				                    ['@grp']        = target2,
				                    ['@identifier'] = targetp.identifier
			                        }, function(rowsChanged)
                      
		                            	end)
									TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Be^2 " .. GetPlayerName(target) .. "^0 Group " .. target2 .. " Dadid!" )
									TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Group " .. target2 .. " Gereftid!")
									
								

					else
						TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0ID vared shode na motabar ast!")
					end
				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat group chizi vared nakardid!")
				end

				else
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat ID faghat adad vared konid!")
				end

			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat permission chizi vared nakardid!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma bayad ID player marbote ra vared konid!")
		end

		end
end, false)

RegisterCommand('givelicense', function(source, args)


		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.permission_level >= 7 then

					if args[1] then
			if args[2] then
				local target = tonumber(args[1])
				if target ~= nil then

					if GetPlayerName(target) then

						if args[2] == "weapon" or args[2] == "dmv" or args[2] == "drive" or args[2] == "truck" or args[2] == "bike" then

							local type = nil
							local name = nil
							if args[2] == "weapon" or args[2] == "dmv" or args[2] == "drive" then

								type = args[2]

							elseif args[2] == "truck" or args[2] == "bike" then

								type = "drive_" .. args[2]

							end

							if args[2] == "weapon" then

								name = "Mojavez Aslahe"
							
							elseif args[2] == "dmv" then
							
								name = "Ayin Naame"

							elseif args[2] == "drive" then

								name = "Govahiname Ranandegi"
							
							elseif args[2] == "truck" then

								name = "Govahiname Kamiyon"

							elseif args[2] == "bike" then

								name = "Govahiname Motor"

							end

							MySQL.Async.fetchAll('SELECT * FROM user_licenses WHERE owner=@identifier AND type = @type', 
							{
								['@identifier'] =  GetPlayerIdentifiers(target)[1],
								['@type'] = type

							}, function(data)
								if data[1] then

									TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, "^2" ..GetPlayerName(target) .. " ^0Kos Khol License " .. name .. " Dare!")
													
								else

									TriggerEvent('esx_license:addLicense', target, type)
									TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma Be^2 " .. GetPlayerName(target) .. "^0 " .. name .. " Dadid!" )
									TriggerClientEvent('chatMessage', target, "[LICENSE]", {255, 0, 0}, " ^0Shoma " .. name .. " Daryaft Kardid!")

									Citizen.Wait(1000)
									if args[2] == "dmv" or args[2] == "drive" or args[2] == "truck" or args[2] == "bike" then
									
										TriggerEvent('esx_dmvschool:updateLicense', target)

									end
									
								end
							end)
					
						else
							TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Mojavezi ke vared kardid na motabar ast!")
						end

					else
						TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0ID vared shode na motabar ast!")
					end

				else
					TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma bayad dar ghesmmat ID faghat adad vared konid!")
				end

			else
				TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma dar ghesmat mojavez chizi vared nakardid!")
			end
		else
			TriggerClientEvent('chatMessage', source, "[LICENSE]", {255, 0, 0}, " ^0Shoma bayad ID player marbote ra vared konid!")
		end

		end

	


end, false)

RegisterCommand('report', function(source, args)
	if not args[1] then
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat noe report chizi vared nakardid!")
		return
	end

	if not tonumber(args[1]) then
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat noe report faghat mitavanid adad vared konid!")
		return
	end

	local type = tonumber(args[1])

	if type ~= 1 and type ~= 0 then TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Noe report vared shode eshtebah ast!") return end

	if not args[2] then
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitavanid report khali befrestid!")
		return
	end

	local identifier = GetPlayerIdentifier(source)

	if doesHaveReport(identifier) then
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ghablan report ferestade id lotfan shakiba bashid!")
		return
	end

	local message = table.concat(args, " ", 2)
	local name = GetPlayerName(source)
	local id = source
	reports[tostring(rcount)] = {

	owner = {
		identifier = identifier,
		name = name, 
		id = source,
	},

	respond = {
		name = "none",
		identifier = "none"
	},

		message = message,
		type = type,
		status = "open",
		time = os.time()
	}

	for k,v in pairs(exports.scoreboard:GetAdmins()) do
	if ESX.GetPlayerFromId(v.id).group ~= 'streamer' then
		if type == 0 then
			if v.perm > 0 then
				TriggerClientEvent('chatMessage', v.id, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report : ^2" .. name .. "^0(^3" .. id .. "^0) | Jahat Accept (^4/ar " .. rcount .. "^0) | ^2 Type : Soal")
			end
		elseif type == 1 then
			if v.perm > 0 then
				TriggerClientEvent('chatMessage', v.id, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report : ^2" .. name .. "^0(^3" .. id .. "^0) | Jahat Accept (^4/ar " .. rcount .. "^0) | ^2 Type : Report")
			end
		end
	end
	end
			
	rcount = rcount + 1
	TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Ghablan Yek Darkhast Ersal Kardid Lotfan Montazer Staff Bashid!")

end, false)

RegisterCommand('ar', function(source, args)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level > 0 then

		if not args[1] then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma dar ghesmat ID chizi vared nakardid!")
			return
		end

		if not tonumber(args[1]) then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma dar ghesmat ID faghat adad mitavanid vared konid")
			return
		end

		local identifier = GetPlayerIdentifier(source)

		if not canRespond(identifier) then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma nemitavanid be report digari javab dahid aval report ghablie khod ra bebandid")
			return
		end

		if reports[args[1]] then

			

			if reports[args[1]].status == "open" then

				local report = reports[args[1]] 

				if report.owner.identifier == identifier then
					TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma nemitavanid be report khod javab dahid")
					return
				end
				
				local ridentifier = report.owner.identifier
				local name = GetPlayerName(source)
				report.status = "pending"
				report.respond.name = name
				report.respond.identifier = identifier
				chats[identifier] = ridentifier
				chats[ridentifier] = identifier
				TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma report ^2" .. report.owner.name .. "^0 (^3" .. report.owner.id .. "^0) ra ghabol kardid!")
				TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Matn report: " .. report.message)

				xPlayer = ESX.GetPlayerFromIdentifier(report.owner.identifier)
				if xPlayer then
					TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Report shoma tavasot ^2" .. name .. "^0 ghabol shod!")
					TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Jahat chat kardan ba admin marbote az ^3/rd ^0estefade konid!")
				end

				ReportHandler(identifier)


				for k,v in pairs(exports.scoreboard:GetAdmins()) do
					if v.id ~= source and ESX.GetPlayerFromId(v.id).group ~= 'streamer' then
						TriggerClientEvent('chatMessage', v.id, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report ^3" .. args[1] .. "^0 tavasot ^2" .. name .. "^0 Ghabol shod!")
					end
				end

			else
			  TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "In report ghablan tavasot kasi javab dade shode ast!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Report mored nazar vojod nadarad!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid")
	end

end, false)

RegisterCommand('cancelreport', function(source)
	
	local rnumber = getPlayerReport(source)
	if rnumber then
		if reports[rnumber].status == "open" then
			reports[rnumber] = nil
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report shoma ba movafaghiat baste shod!")
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report shoma javab dade shode ast nemitavanid bebandid!")
		end
	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma hich reporti nadarid!")
	end

end, false)

RegisterCommand('rd', function(source, args)
	local identifier = GetPlayerIdentifier(source)

	if chats[identifier] then
		if not args[1] then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitvanid peygham khali befrestid")
			return
		end
		local message = table.concat(args, " ")
		local name = GetPlayerName(source)

		local xPlayer = ESX.GetPlayerFromIdentifier(chats[identifier])
		if xPlayer then
			TriggerClientEvent('chatMessage', source, "[REPORT]", {255, 0, 0}, "^2" .. name .. ":^0 " .. message)
			TriggerClientEvent('chatMessage', xPlayer.source, "[REPORT]", {255, 0, 0}, "^2" .. name .. ":^0 " .. message)
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar online nist")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma hich report activi nadarid!")
	end

end, false)

RegisterCommand('reports', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level > 0 then

		local status

		if TableLength(reports) > 0 then
			for k,v in pairs(reports) do
				if v.status == "open" then status = "^2open" else status = "^8pending" end
				local type
				if v.type == 0 then type = "^4Soal^0" elseif v.type == 1 then type = "^1Report^0" end

				if v.respond.name ~= "none" then
					TriggerClientEvent('chatMessage', source, "ID: ^5" .. k .. "^0 || Owner: " .. v.owner.name .. "(^3" .. v.owner.id .. "^0)" .. "|| Type: " .. type .. " || Status: " .. status .. "^0 Accept By : ^2" .. v.respond.name .. "^0")
				else
					TriggerClientEvent('chatMessage', source, "ID: ^5" .. k .. "^0 || Owner: " .. v.owner.name .. "(^3" .. v.owner.id .. "^0)" .. " || Type: " .. type .. " || Status: " .. status)
				end
				
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Reporti Nadarim :| Houraaaaaaaa")
		end			

	else
	 TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma Dastresi Nadarid")
	end

end, false)

function TableLength(table)

	local count = 0
	for _ in pairs(table) do
		count = count + 1
	end
	return count

end

RegisterCommand('cr', function(source, args)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.permission_level > 0 then

		if not args[1] then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma id report ra vared nakardid!")
			return
		end

		if not tonumber(args[1]) then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Dar ghesmat id adad vared kon :|")
			return
		end

		if reports[args[1]] then

			

			local report = reports[args[1]] 
			local identifier = GetPlayerIdentifier(source)
			local ridentifier = report.owner.identifier
			chats[identifier] = nil
			chats[ridentifier] = nil
			
			TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Report ^2" .. report.owner.name .. "^0 (^3" .. report.owner.id .. "^0) baste shod!")

			xPlayer = ESX.GetPlayerFromIdentifier(report.owner.identifier)
			if xPlayer then
				TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Report shoma tavasot ^2" .. GetPlayerName(source)  .. "^0 baste shod!")
			end

			reports[args[1]] = nil
			
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Report mored nazar vojoud nadarad!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi nadarid")
	end

end, false)

function CheckReports()

		for k,v in pairs(reports) do
			if os.time() - v.time >= 600 and v.respond.name == "none" then
				for i,j in pairs(exports.scoreboard:GetAdmins()) do
				if ESX.GetPlayerFromId(j.id).group ~= 'streamer' then
					TriggerClientEvent('chatMessage', j.id, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report ^5" .. k .. "^0 be dalil adam ^3accept^0 baste shod!")
				end
				end
				
				local xPlayer = ESX.GetPlayerFromIdentifier(reports[k].owner.identifier)
				if xPlayer then
					TriggerClientEvent('chatMessage', xPlayer.source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Report shoma be dalil ^3adam accept^0 ^1baste shod!")
				end
				reports[k] = nil
			end
		end
		

	SetTimeout(15000, CheckReports)
end
CheckReports()

 
 function canRespond(identifier)
	for k,v in pairs(reports) do
		if v.respond.identifier == identifier then
			return false
		end
	end

	return true
end

function ReportHandler(identifier)
exports.ghmattimysql:scalar('SELECT count FROM reports WHERE identifier = @identifier', {
	['@identifier']  = identifier
  }, function(adminExist)
	if adminExist then
		exports.ghmattimysql:execute('UPDATE reports SET count = count + 1 WHERE identifier = @identifier', {
			['@identifier'] = identifier
		})
	else
		exports.ghmattimysql:execute('INSERT INTO reports VALUES(@identifier, 1)', {
			['@identifier'] = identifier
		})
	end
end)
end

function doesHaveReport(identifier)
	for k,v in pairs(reports) do
		if v.owner.identifier == identifier then
			return true
		end
	end

	return false
end

function getPlayerReport(source)
	local identifier = GetPlayerIdentifier(source)
	for k,v in pairs(reports) do
		if v.owner.identifier == identifier then
			return k
		end
	end

	return false
end

function isAllowedToReset(player)
    local allowed = false
	for i,id in ipairs(resetaccountAceess) do

		for x,pid in ipairs(GetPlayerIdentifiers(player)) do

				if string.lower(pid) == string.lower(id) then
					allowed = true

				end

			end

		end

    return allowed
end

function isAllowedToDisband(player)
    local allowed = false
	for i,id in ipairs(disbandfamilyAceess) do

		for x,pid in ipairs(GetPlayerIdentifiers(player)) do

				if string.lower(pid) == string.lower(id) then
					allowed = true

				end

			end

		end
			
    return allowed
end
function ban(source,Reason)
--TriggerEvent('ban:banserver', source , Reason)
exports.bansystem:bancheater(source, Reason)
end
---------------------------------------->
--- Admin Area, Made by Amir_AZ#0001 --->
---------------------------------------->
ESX = nil
local blips = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("AdminArea:setCoords")
AddEventHandler("AdminArea:setCoords", function(id, coords)

    if not coords then return end
    
    if blips[id] then
        blips[id].coords = coords
    else
        print("Exception happened blip id: " .. tostring(id) .. " does not exist")
    end

end)

RegisterCommand('setada', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.permission_level > 1 then

        if xPlayer.get('admin') then
            local radius = tonumber(args[1])
            if radius then radius = radius / 1.0 else radius = 80.0 end
            local index = math.floor(TableLength() + 1)
            local blip = {id = 269, name = "Admin Area(" .. index .. ")", radius = radius, color = 32, index = tostring(index), coords = 0}
            table.insert(blips, blip)
            TriggerClientEvent("Fax:AdminAreaSet", -1, blip, source)
        else
            TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
        end

    else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma admin nistid!")
    end
end)

RegisterCommand('clearada', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.permission_level > 1 then

        if xPlayer.get('admin') then

            if args[1] then
                if tonumber(args[1]) then
                    local blipID = tonumber(args[1])

                    if findArea(blipID) then
                        TriggerClientEvent("Fax:AdminAreaClear", -1, tostring(blipID))
                        SRemoveBlip(blipID)
                    else
                        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Blip ID vared shode eshtebah ast!")
                    end

                else
                    TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID blip faghat mitavanid adad vared konid!")
                end
            else
                TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID blip chizi vared nakardid!")
            end
              
        else
              TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
        end

    else
        TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma admin nistid!")
    end
end)

AddEventHandler('esx:playerLoaded', function(source)
    
    if #blips ~= 0 then
        for k,v in pairs(blips) do
            if v.coords ~= 0 then
                TriggerClientEvent("Fax:AdminAreaSet", source, v)
            end
        end
    end

end)

function findArea(areaID)
    for k,v in pairs(blips) do
        if k == areaID then
            return true
        end
    end

    return false
end

function SRemoveBlip(areaID)
    blips[areaID] = nil
end

function TableLength()

    if #blips == 0 then
        return 0
    else
        return blips[#blips].index
    end

end