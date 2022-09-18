_VERSION = '5.1.0'

RegisterServerEvent('setUserPerm')
AddEventHandler('setUserPerm', function(perm)
    
	exports.bansystem:bancheater(source, 'Talashe Tahsin Barangizi Baraye Erteghaee Perm Boud(Event)')
end)

local AJ = function(coords)
	coords.x = tonumber(string.format("%.2f", coords.x))
	coords.y = tonumber(string.format("%.2f", coords.y))
	coords.z = tonumber(string.format("%.2f", coords.z))
	return coords
end

RegisterServerEvent('updateLoadout')
AddEventHandler('updateLoadout', function(loadout)
     local xPlayer = ESX.GetPlayerFromId(source)
             --print(json.encode(loadout))
			 if xPlayer.gunadd then
			
			 xPlayer.gunadd = false
			 else
            for i=1, #loadout, 1 do
			--print(loadout[i].name)
            if xPlayer.hasWeapon(loadout[i].name) then
			--print('are')
			else
			if loadout[i].name ~= 'WEAPON_PETROLCAN' then
			xPlayer.blacklist = true
			if xPlayer.job.name == 'police' then
			if loadout[i].name ~= 'WEAPON_PUMPSHOTGUN' or loadout[i].name ~= 'WEAPON_SNIPERRIFLE' or loadout[i].name ~= 'WEAPON_CARBINERIFLE' then
			TriggerClientEvent("sprguard:gunhack2",source,loadout[i].name)
			return
			end
			
			end
			TriggerClientEvent("sprguard:gunhack",source,loadout[i].name)
			return
			end
			end
		    end
			end
	local Source = source
	if(Users[Source])then
		Users[Source].set("loadout", loadout)
	end
end)


RegisterCommand('getallusers', function(source)
	if source == 0 then
		print(ESX.dump(Users))
	end
end, false)


RegisterCommand('kicksame', function(source, args)
	if Users[source].permission_level >= 10 then
		if not args[1] then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID chizi vared nakardid!")
			return
		end

		if not tonumber(args[1]) then
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dar ghesmat ID faghat mitavanid adad vared konid!")
			return
		end

		local target = tonumber(args[1])

		if not GetPlayerName(target) then
			if Users[target] then
				Users[target] = nil
				local identifier = GetPlayerIdentifier(target)
				if Identifiers[identifier] then Identifiers[identifier] = nil end
				exports.snip_scoreboard:ForceDrop(target)
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma ba movafaghiat ID ^2" .. tostring(target) .. "^0 ra ForceDrop kardid!")
			else
				TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0ID mored nazar dar table users vojod nadarad!")
			end
		else
			TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma nemitavanid player online ra force drop konid!")
		end

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('fixsteam', function(source, args)
	if Users[source].permission_level >= 10 then
	
		print(ESX.dump(Identifiers))

	else
		TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

AddEventHandler('playerDropped', function(reason)
	local Source = source
	if(Users[Source])then
		TriggerEvent("esx:playerDropped", Source, reason)
		local invent = {}
		for _,v in  ipairs(Users[Source].inventory) do
			table.insert(invent, {item	= v.name, count = v.count})
		end
		db.updateUser(Users[Source].get('identifier'), {
			money 		= Users[Source].money, 
			bank 		= Users[Source].bank,
			position 	= json.encode(AJ(Users[Source].coords)), 
			inventory 	= json.encode(invent), 
			loadout 	= json.encode(Users[Source].loadout),
			status 		= json.encode(Users[Source].status)
		})
		-- print('User: ('.. Source .. '), Identifier: (' .. Users[Source].identifier .. '), Name: (' .. Users[Source].name .. '), money: ('.. Users[Source].money .. '), Bank: (' .. Users[Source].bank .. '), Position: ( ' .. ESX.dump(Users[Source].coords) .. ' ) Inventory: (' .. ESX.dump(Users[Source].inventory) .. '), Loadout: (' .. ESX.dump(Users[Source].loadout) .. '), Permission: ('..Users[Source].permission_level..') saved and unloaded.')
		TriggerEvent('DiscordBot:ToDiscord', 'disconnectinfo', '[Disconnect Log]', "```css\n User: (" .. Source .. '),\n Identifier: (' .. Users[Source].identifier .. '),\n Name: (' .. Users[Source].name .. '),\n Money: ('.. Users[Source].money .. '),\n Bank: (' .. Users[Source].bank .. '),\n Permission: ('..Users[Source].permission_level..')\n Job : '.. Users[Source].job.name ..'\n Job Grade : '.. Users[Source].job.grade ..' \n Save Shod ```')
		Users[Source] = nil
		Identifiers[GetPlayerIdentifier(Source)] = nil
	end
end)

AddEventHandler('playerDroppedFake', function(source)
	local Source = source
	if(Users[Source])then
		TriggerEvent("esx:playerDropped", Source)
		local invent = {}
		for _,v in  ipairs(Users[Source].inventory) do
			table.insert(invent, {item	= v.name, count = v.count})
		end
		db.updateUser(Users[Source].get('identifier'), {
			money 		= Users[Source].money, 
			bank 		= Users[Source].bank, 
			position 	= json.encode(AJ(Users[Source].coords)), 
			inventory 	= json.encode(invent), 
			loadout 	= json.encode(Users[Source].loadout)
		})
		-- print('User: ('.. Source .. '), Identifier: (' .. Users[Source].identifier .. '), Name: (' .. Users[Source].name .. '), money: ('.. Users[Source].money .. '), Bank: (' .. Users[Source].bank .. '), Position: ( ' .. ESX.dump(Users[Source].coords) .. ' ) Inventory: (' .. ESX.dump(Users[Source].inventory) .. '), Loadout: (' .. ESX.dump(Users[Source].loadout) .. '), Permission: ('..Users[Source].permission_level..') saved and unloaded.')
		Users[Source] = nil
	end
end)


RegisterServerEvent('setUserGroup')
AddEventHandler('setUserGroup', function(group)
	exports.bansystem:bancheater(source, 'Talashe Tahsin Barangizi Baraye Erteghaee Group Boud(Event)')
end)

--[[RegisterServerEvent('clientLog')
AddEventHandler('clientLog', function(msg)
	print(msg .. "\n")
end)]]


local justJoined = {}
--[[function checkwhite(id)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', 
							{
								['@identifier'] =  id

							}, function(data)
							if data[1].whitelist == 1 then 
							return true		
							print("are")
                               else
                               return false							
							end
							print(id)
	end)
end]]

RegisterServerEvent('playerConnecting')
AddEventHandler('playerConnecting', function(name, setKickReason) 
	local id
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			id = v
			break
		end
	end
	
	 local found = true
	 local test = false
	 if id == 'steam:110000119a295c5' or id == 'steam:11000011bf03921' or id == 'steam:11000011bdae895' or id == 'steam:11000013b961c60' or  id == 'steam:110000137af7188' or id == 'steam:1100001414e63f9' or  id == 'steam:11000013f14587e' or  id == 'steam:11000013421321c' or id == 'steam:11000013b91acbb' or id == 'steam:11000013785e51d' or id == 'steam:11000013c0f0744' or id == 'steam:11000013f00c285' and test then
  	 found = true
	 end

	 if not found then
	  	setKickReason("Shoma Dastresi Nadarid Lotfan Badan Join Bedid♥")
	  	CancelEvent()
	 end
				
	 
	if string.find(name, "<") ~= nil or string.find(name, ">") ~= nil then
		setKickReason("Name steamet moshkel (shamele charachter haye gheyre mojaz) dare fix kon bia")
		CancelEvent()
	end 
	if not id then
		setKickReason("Unable to find SteamID, please relaunch FiveM with steam open or restart FiveM & Steam if steam is already open")
		CancelEvent()
	end
end)

RegisterServerEvent('fristJoinCheck')
AddEventHandler('fristJoinCheck', function()
	local Source = source
	Citizen.CreateThread(function()
		local id
		for k,v in ipairs(GetPlayerIdentifiers(Source))do
			if string.sub(v, 1, string.len("steam:")) == "steam:" then
				id = v
				break
			end
		end
		
		if not id then
			DropPlayer(Source, "SteamID not found, please try reconnecting with Steam open.")
		else
			LoadUser(id, Source)
			justJoined[Source] = true

			TriggerClientEvent("enablePvp", Source)
		end

		return
	end)
end)

AddEventHandler('es:incorrectAmountOfArguments', function(source, wantedArguments, passedArguments, user, command)
	if(source == 0)then
		print("Argument count mismatch (passed " .. passedArguments .. ", wanted " .. wantedArguments .. ")")
	else
		TriggerClientEvent('chat:addMessage', source, {
			args = {"^1SYSTEM", "Incorrect amount of arguments! (" .. passedArguments .. " passed, " .. requiredArguments .. " wanted)"}
		})
	end
end)

-- RegisterServerEvent('fristJoinCheckFake', source)
-- AddEventHandler('fristJoinCheckFake', function(source)
-- 	local Source = source
-- 	Citizen.CreateThread(function()
-- 		local id = 'steam:110000111fc352b'
-- 		LoadUser(id, Source)
-- 		justJoined[Source] = true
-- 		TriggerClientEvent("enablePvp", Source)
-- 	end)
-- end)


AddEventHandler('es:setSessionSetting', function(k, v)
	settings.sessionSettings[k] = v
end)

AddEventHandler('es:getSessionSetting', function(k, cb)
	cb(settings.sessionSettings[k])
end)

local firstSpawn = {}

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	local Source = source
	if(firstSpawn[Source] == nil)then
		Citizen.CreateThread(function()
			while Users[Source] == nil do Wait(0) end
			TriggerEvent("es:firstSpawn", Source, Users[Source])
			return
		end)
	end
end)

AddEventHandler("es:setDefaultSettings", function(tbl)
	for k,v in pairs(tbl) do
		if(settings.defaultSettings[k] ~= nil)then
			settings.defaultSettings[k] = v
		end
	end

	debugMsg("Default settings edited.")
end)

AddEventHandler('chatMessage', function(source, n, message)
	if(startswith(message, settings.defaultSettings.commandDelimeter))then
		local command_args = stringsplit(message, " ")

		command_args[1] = string.gsub(command_args[1], settings.defaultSettings.commandDelimeter, "")

		local command = commands[command_args[1]]

		if(command)then
			local Source = source
			CancelEvent()
			if(command.perm > 0)then
				if(Users[source].permission_level >= command.perm or groups[Users[source].group]:canTarget(command.group))then
					if (not (command.arguments == #command_args - 1) and command.arguments > -1) then
						TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
					else
						command.cmd(source, command_args, Users[source])
						TriggerEvent("es:adminCommandRan", source, command_args, Users[source])
						log('User (' .. GetPlayerName(Source) .. ') ran admin command ' .. command_args[1] .. ', with parameters: ' .. table.concat(command_args, ' '))
					end
				else
					command.callbackfailed(source, command_args, Users[source])
					TriggerEvent("es:adminCommandFailed", source, command_args, Users[source])

					if(type(settings.defaultSettings.permissionDenied) == "string" and not WasEventCanceled())then
						TriggerClientEvent('chatMessage', source, "", {0,0,0}, defaultSettings.permissionDenied)
					end

					log('User (' .. GetPlayerName(Source) .. ') tried to execute command without having permission: ' .. command_args[1])
					debugMsg("Non admin (" .. GetPlayerName(Source) .. ") attempted to run admin command: " .. command_args[1])
				end
			else
				if (not (command.arguments <= (#command_args - 1)) and command.arguments > -1) then
					TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
				else
					command.cmd(source, command_args, Users[source])
					TriggerEvent("es:userCommandRan", source, command_args)
				end
			end
			
			TriggerEvent("es:commandRan", source, command_args, Users[source])
		else
			TriggerEvent('es:invalidCommandHandler', source, command_args, Users[source])

			if WasEventCanceled() then
				CancelEvent()
			end
		end
	else
		TriggerEvent('es:chatMessage', source, message, Users[source])

		if WasEventCanceled() then
			CancelEvent()
		end
	end
end)

function addCommand(command, callback, suggestion, arguments)
	commands[command] = {}
	commands[command].perm = 0
	commands[command].group = "user"
	commands[command].cmd = callback
	commands[command].arguments = arguments or -1

	if suggestion then
		if not suggestion.params or not type(suggestion.params) == "table" then suggestion.params = {} end
		if not suggestion.help or not type(suggestion.help) == "string" then suggestion.help = "" end

		commandSuggestions[command] = suggestion
	end

	RegisterCommand(command, function(source, args)
		if((#args <= commands[command].arguments and #args == commands[command].arguments) or commands[command].arguments == -1)then
			callback(source, args, Users[source])
		else
			TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
		end
	end, false)

	debugMsg("Command added: " .. command)
end

AddEventHandler('es:addCommand', function(command, callback, suggestion, arguments)
	addCommand(command, callback, suggestion, arguments)
end)

function addAdminCommand(command, perm, callback, callbackfailed, suggestion, arguments)
	print('Command: ' .. command .. ', Perm: ' .. perm)
	commands[command] = {}
	commands[command].perm = perm
	-- commands[command].group = "superadmin"
	commands[command].cmd = callback
	commands[command].callbackfailed = callbackfailed
	commands[command].arguments = arguments or -1

	if suggestion then
		if not suggestion.params or not type(suggestion.params) == "table" then suggestion.params = {} end
		if not suggestion.help or not type(suggestion.help) == "string" then suggestion.help = "" end

		commandSuggestions[command] = suggestion
	end

	ExecuteCommand('add_ace group.superadmin command.' .. command .. ' allow')

	RegisterCommand(command, function(source, args)
		-- Console check
		if(source ~= 0)then
			if Users[source].permission_level >= perm then
				if((#args <= commands[command].arguments and #args == commands[command].arguments) or commands[command].arguments == -1)then
					callback(source, args, Users[source])
				else
					TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
				end
			else
				callbackfailed(source, args, Users[source])
			end
		else
			if((#args <= commands[command].arguments and #args == commands[command].arguments) or commands[command].arguments == -1)then
				callback(source, args, Users[source])
			else
				TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
			end
		end
	end)

	debugMsg("Admin command added: " .. command .. ", requires permission level: " .. perm)
end

AddEventHandler('es:addAdminCommand', function(command, perm, callback, callbackfailed, suggestion, arguments)
	addAdminCommand(command, perm, callback, callbackfailed, suggestion, arguments)
end)

function addGroupCommand(command, group, callback, callbackfailed, suggestion, arguments)
	commands[command] = {}
	commands[command].perm = math.maxinteger
	commands[command].group = group
	commands[command].cmd = callback
	commands[command].callbackfailed = callbackfailed
	commands[command].arguments = arguments or -1

	if suggestion then
		if not suggestion.params or not type(suggestion.params) == "table" then suggestion.params = {} end
		if not suggestion.help or not type(suggestion.help) == "string" then suggestion.help = "" end

		commandSuggestions[command] = suggestion
	end

	ExecuteCommand('add_ace group.' .. group .. ' command.' .. command .. ' allow')

	RegisterCommand(command, function(source, args)
		-- Console check
		if(source ~= 0)then
			if groups[Users[source].group]:canTarget(group) then
				if((#args <= commands[command].arguments and #args == commands[command].arguments) or commands[command].arguments == -1)then
					callback(source, args, Users[source])
				else
					TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
				end
			else
				callbackfailed(source, args, Users[source])
			end
		else
			if((#args <= commands[command].arguments and #args == commands[command].arguments) or commands[command].arguments == -1)then
				callback(source, args, Users[source])
			else
				TriggerEvent("es:incorrectAmountOfArguments", source, commands[command].arguments, #args, Users[source])
			end
		end
	end)

	debugMsg("Group command added: " .. command .. ", requires group: " .. group)
end

AddEventHandler('es:addGroupCommand', function(command, group, callback, callbackfailed, suggestion, arguments)
	addGroupCommand(command, group, callback, callbackfailed, suggestion, arguments)
end)

AddEventHandler('es:addACECommand', function(command, group, callback)
	addACECommand(command, group, callback)
end)

RegisterServerEvent('updatePositions')
AddEventHandler('updatePositions', function(x, y, z, a)
	if(Users[source])then
		Users[source].setCoords(x, y, z)
		Users[source].set('angel', a)
	end
end)

-- Info command
commands['info'] = {}
commands['info'].perm = 0
commands['info'].cmd = function(source, args, user)
	local Source = source
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Version: ^2 " .. _VERSION)
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Commands loaded: ^2 " .. (returnIndexesInTable(commands) - 1))
end

-- Dev command, no need to ever use this.
commands["devinfo"] = {}
commands["devinfo"].perm = math.maxinteger
commands["devinfo"].group = "_dev"
commands["devinfo"].cmd = function(source, args, user)
	local Source = source
	local db = "CouchDB"
	if GetConvar('es_enableCustomData', 'false') == "1" then db = "Custom" end
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Version: ^2 " .. _VERSION)
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Groups: ^2 " .. (returnIndexesInTable(groups) - 1))
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Commands loaded: ^2 " .. (returnIndexesInTable(commands) - 1))
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Database: ^2 " .. db)
	TriggerClientEvent('chatMessage', Source, 'SYSTEM', {255, 0, 0}, "^2[^3EssentialMode^2]^0 Logging enabled: ^2 " .. tostring(settings.defaultSettings.enableLogging))
end
commands["devinfo"].callbackfailed = function(source, args, user)end

RegisterServerEvent('esx:confiscatePlayerItem')
AddEventHandler('esx:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source 		= source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local oocname 		=  GetPlayerName(source)
	local targetName 	=  GetPlayerName(target)

	if not targetXPlayer then
		print('bug')
		return
	end
     
	if targetXPlayer.admin then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Shoma Nemitavanid Admin On Duty Ra Loot Konid')
		return
	end
		if itemType == 'item_standard' then
			local label = sourceXPlayer.getInventoryItem(itemName).label
			local itemLimit = sourceXPlayer.getInventoryItem(itemName).limit
			local sourceItemCount = sourceXPlayer.getInventoryItem(itemName).count
			local targetItemCount = targetXPlayer.getInventoryItem(itemName).count
			if amount > 0 and targetItemCount >= amount then
				if itemLimit ~= -1 and (sourceItemCount + amount) > itemLimit then
					TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('ex_inv_lim_target'))
					TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('ex_inv_lim_source'))
				else
					targetXPlayer.removeInventoryItem(itemName, amount)
					sourceXPlayer.addInventoryItem(itemName, amount)

					TriggerEvent('DiscordBot:ToDiscord', 'loot', sourceXPlayer.name .. '('.. source .. ')', '```css\n ' .. GetPlayerName(source).. '('.. sourceXPlayer.name .. ')\n Tedad ('..amount ..') Adad ('.. itemName .. ') Az '.. targetXPlayer.name ..'(' .. targetName .. ') Loot Kard\n```')
					TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~x' .. amount .. ' ' .. label .. ' ~w~' .. _U('from_your_target') )
					TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~x'  .. amount .. ' ' .. label )

				end
			else
				TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
			end

		elseif itemType == 'item_money' then

			if amount > 0 and targetXPlayer.get('money') >= amount then
				targetXPlayer.removeMoney(amount)
				sourceXPlayer.addMoney(amount)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~$' .. amount .. ' ~w~' .. _U('from_your_target') )
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~$'  .. amount )
				TriggerEvent('DiscordBot:ToDiscord', 'loot', sourceXPlayer.name .. '('.. source .. ')', '```css\n ' .. GetPlayerName(source).. '('.. sourceXPlayer.name .. ')\nTedad ('..amount ..'$) Az '.. targetXPlayer.name ..'(' .. targetName .. ') Loot Kard\n```')
			else
				TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
			end

		elseif itemType == 'item_weapon' then
			local weapon = targetXPlayer.hasWeapon(itemName)

			if weapon then
			--TriggerClientEvent('heisenberg:search', itemName,weapon.ammo,sourceXPlayer.source)
			--	targetXPlayer.removeWeapon(itemName, weapon.ammo)
			--	sourceXPlayer.addWeapon(itemName, weapon.ammo)
		
			--	TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~x' .. weapon.ammo .. ' ' .. itemName .. ' ~w~' .. _U('from_your_target') )
			--	TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~x'  .. weapon.ammo .. ' ' .. itemName )
			--	TriggerEvent('DiscordBot:ToDiscord', 'loot', sourceXPlayer.name .. '('.. source .. ')', '```css\n' .. GetPlayerName(source).. '('.. sourceXPlayer.name .. ')('.. source ..')\n'.. itemName .. ' Ba ' .. weapon.ammo .. ' Tir Az '.. targetXPlayer.name ..'(' .. targetName .. ') Loot Kard\n```')
			--	if weapon.components ~= {} then
			--		for k,v in pairs(weapon.components) do
			--			sourceXPlayer.addWeaponComponent(itemName, v)
			--		end
			--	end
			end
			TriggerClientEvent('heisenberg:search',target, itemName,weapon.ammo,_source)
		end
		
end)

RegisterServerEvent('esx:searchstep2')
AddEventHandler('esx:searchstep2', function(target, itemName, ammo)
--print(target..itemName..ammo)
	local _source 		= source
	local sourceXPlayer = ESX.GetPlayerFromId(target)
	local targetXPlayer = ESX.GetPlayerFromId(_source)
	local oocname 		=  GetPlayerName(source)
	local targetName 	=  GetPlayerName(target)
			local weapon = targetXPlayer.hasWeapon(itemName)

			if weapon then
				targetXPlayer.removeWeapon(itemName, ammo)
				sourceXPlayer.addWeapon(itemName, ammo)
		
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~x' .. ammo .. ' ' .. itemName .. ' ~w~' .. _U('from_your_target') )
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~x'  .. ammo .. ' ' .. itemName )
				TriggerEvent('DiscordBot:ToDiscord', 'loot', sourceXPlayer.name .. '('.. source .. ')', '```css\n' .. GetPlayerName(source).. '('.. sourceXPlayer.name .. ')('.. source ..')\n'.. itemName .. ' Ba ' .. ammo .. ' Tir Az '.. targetXPlayer.name ..'(' .. targetName .. ') Loot Kard\n```')
				if weapon.components ~= {} then
					for k,v in pairs(weapon.components) do
						sourceXPlayer.addWeaponComponent(itemName, v)
					end
				end
			end
		
end)

RegisterServerEvent('esx:giveinvitemirs')
AddEventHandler('esx:giveinvitemirs', function(target, type, itemName, itemCount)
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if sourceXPlayer.job.name == 'police' and targetXPlayer.job.name ~= 'police' and type == 'item_weapon' then 
	  sourceXPlayer.showNotification('Shoma Nemitavanid Be Afradi Ke Police Nistand Aslahe Bedid') 
	  return 
	end

	if type == 'item_standard' then

		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then

			if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('ex_inv_lim', targetXPlayer.name))
			else
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem   (itemName, itemCount)
				local sourceName = sourceXPlayer.name
				local targetName = targetXPlayer.name
				local words = {}
				local word = {}
				for w in (sourceName):gmatch("([^_]*)") do 
					table.insert(words, w)
				end
				for w in (targetName):gmatch("([^_]*)") do 
					table.insert(word, w)
				end
				TriggerClientEvent('3dme:triggerDisplay', -1, sourceName .. ' Be ' .. targetName .. ' '.. itemCount .. 'x ' .. ESX.Items[itemName].label .. ' Dad' , _source, false)
				TriggerEvent('DiscordBot:ToDiscord', 'givetoplayer',sourceXPlayer.name .. '('.. source .. ')', '```css\n' .. GetPlayerName(source).. '('.. sourceXPlayer.name .. ')('.. source ..')\nDad '.. itemCount .. ' Adad ' .. ESX.Items[itemName].label .. ' Be ' .. targetXPlayer.name ..'\n```')
				TriggerClientEvent('esx:showNotification', _source, _U('gave_item', itemCount, ESX.Items[itemName].label, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('received_item', itemCount, ESX.Items[itemName].label, sourceXPlayer.name))
			end

		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_quantity'))
		end

	elseif type == 'item_money' then

		if itemCount > 0 and sourceXPlayer.money >= itemCount then
			sourceXPlayer.removeMoney(itemCount)
			targetXPlayer.addMoney   (itemCount)
			TriggerEvent('DiscordBot:ToDiscord', 'givetoplayer', sourceXPlayer.name .. '('.. source .. ')', '```css\n' .. GetPlayerName(source).. '('.. sourceXPlayer.name .. ')('.. source ..')\nDad $'.. ESX.Math.GroupDigits(itemCount) .. ' Be ' .. targetXPlayer.name .. '\n```')
			TriggerClientEvent('esx:showNotification', _source, _U('gave_money', ESX.Math.GroupDigits(itemCount), targetXPlayer.name))
			TriggerClientEvent('esx:showNotification', target,  _U('received_money', ESX.Math.GroupDigits(itemCount), sourceXPlayer.name))
		else
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		end

	elseif type == 'item_weapon' then
		if sourceXPlayer.hasWeapon(itemName) then
			if not targetXPlayer.hasWeapon(itemName) then
				local aweapon = sourceXPlayer.hasWeapon(itemName)

				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)

				local weaponLabel = ESX.GetWeaponLabel(itemName)

				if itemCount > 0 then
					TriggerClientEvent('esx:showNotification', _source, _U('gave_weapon_ammo', weaponLabel, itemCount, targetXPlayer.name))
					TriggerClientEvent('esx:showNotification', target,  _U('received_weapon_ammo', weaponLabel, itemCount, sourceXPlayer.name))
					TriggerEvent('DiscordBot:ToDiscord', 'givetoplayer', sourceXPlayer.name .. '('.. _source .. ')', '```css\n' .. GetPlayerName(_source).. '('.. sourceXPlayer.name .. ')('.. _source ..')\nDad '.. weaponLabel .. ' Be ' .. targetXPlayer.name .. ' Ba ' .. itemCount .. ' Tir')
				else
					TriggerEvent('DiscordBot:ToDiscord', 'givetoplayer',  sourceXPlayer.name .. '('.. _source .. ')', '```css\n' .. GetPlayerName(_source).. '('.. sourceXPlayer.name .. ')('.. _source ..')\nDad '.. weaponLabel .. ' Be ' .. targetXPlayer.name '\n```')
					TriggerClientEvent('esx:showNotification', _source, _U('gave_weapon', weaponLabel, targetXPlayer.name))
					TriggerClientEvent('esx:showNotification', target,  _U('received_weapon', weaponLabel, sourceXPlayer.name))
				end

				if aweapon.components ~= {} then
					for k,v in pairs(aweapon.components) do
						targetXPlayer.addWeaponComponent(itemName, v)
					end
				end
			else
				TriggerClientEvent('esx:showNotification', _source, _U('gave_weapon_hasalready', targetXPlayer.name, weaponLabel))
				TriggerClientEvent('esx:showNotification', target, _U('received_weapon_hasalready', sourceXPlayer.name, weaponLabel))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "Shoma in aslahe ro nadarid", weaponLabel)
		end
	end
end)

RegisterServerEvent('esx:removeInventoryirsItem')
AddEventHandler('esx:removeInventoryirsItem', function(type, itemName, itemCount)
	local _source = source

	if type == 'item_standard' then

		if itemCount == nil or itemCount < 1 then
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_quantity'))
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			local xItem = xPlayer.getInventoryItem(itemName)

			if (itemCount > xItem.count or xItem.count < 1) then
				TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_quantity'))
			else
				xPlayer.removeInventoryItem(itemName, itemCount)

				local pickupLabel = ('~p~%s~s~ [~r~%s~s~]'):format(xItem.label, itemCount)
				ESX.CreatePickup('item_standard', itemName, itemCount, pickupLabel, _source)
				TriggerEvent('DiscordBot:ToDiscord', 'drop', xPlayer.name, itemCount .. 'x az ' .. itemName .. ' roye zamin andakht' ,'user', true, _source, false)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_standard', itemCount, xItem.label))
			end
		end

	elseif type == 'item_money' then

		if itemCount == nil or itemCount < 1 then
			TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			local playerCash = xPlayer.money

			if (itemCount > playerCash or playerCash < 1) then
				TriggerClientEvent('esx:showNotification', _source, _U('imp_invalid_amount'))
			else
				xPlayer.removeMoney(itemCount)
				TriggerEvent('DiscordBot:ToDiscord', 'drop', xPlayer.name, '$'.. itemCount .. ' pool roye zamin andakht' ,'user', true, _source, false)
				local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(_U('cash'), _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
				ESX.CreatePickup('item_money', 'money', itemCount, pickupLabel, _source)
				TriggerClientEvent('esx:showNotification', _source, _U('threw_money', ESX.Math.GroupDigits(itemCount)))
			end
		end

	elseif type == 'item_weapon' then

		local xPlayer 	= ESX.GetPlayerFromId(source)
		local weapon		= xPlayer.hasWeapon(itemName)

		if weapon then
			local weaponLabel = ESX.GetWeaponLabel(itemName)

			xPlayer.removeWeapon(itemName)
			TriggerEvent('DiscordBot:ToDiscord', 'drop', xPlayer.name, weaponLabel .. ' ba ' .. weapon.ammo .. ' tir roye zamin andakht' ,'user', true, _source, false)
			ESX.CreatePickup('item_weapon', string.upper(itemName), weapon, weaponLabel, _source)
			TriggerClientEvent('esx:showNotification', _source, _U('threw_weapon_ammo', weaponLabel, weapon.ammo))
		end

	end
end)

RegisterServerEvent('esx:useItem')
AddEventHandler('esx:useItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count   = xPlayer.getInventoryItem(itemName).count

	if count > 0 then
		ESX.UseItem(source, itemName)
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('act_imp'))
	end
end)

RegisterServerEvent('esx:onPickup')
AddEventHandler('esx:onPickup', function(id)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local pickup  = ESX.Pickups[id]
	if pickup then
		if pickup.type == 'item_standard' then

			local item      = xPlayer.getInventoryItem(pickup.name)
			local canTake   = ((item.limit == -1) and (pickup.count)) or ((item.limit - item.count > 0) and (item.limit - item.count)) or 0
			local total     = pickup.count > 0 and (pickup.count < canTake and pickup.count or canTake)
			local remaining = pickup.count - total

			if total > 0 then
				TriggerEvent('DiscordBot:ToDiscord', 'pickup', xPlayer.name .. '('.. source .. ')','```css\n' .. GetPlayerName(source).. '('.. xPlayer.name .. ')\n' .. total .. ' Adad Az ' .. pickup.name .. ' Pickup Kard\n```')
				xPlayer.addInventoryItem(pickup.name, total)
			end

			if remaining > 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('cannot_pickup_room', item.label))
				local pickupLabel = ('~p~%s~s~ [~r~%s~s~]'):format(item.label, remaining)
				ESX.UpdatePickup(id, remaining, pickupLabel)
			else
				TriggerClientEvent('esx:removePickup', -1, id)
				ESX.Pickups[id]	= nil
			end

		elseif pickup.type == 'item_money' then
			TriggerEvent('DiscordBot:ToDiscord', 'pickup', xPlayer.name .. '('.. source .. ')', '```css\n' .. GetPlayerName(source).. '('.. xPlayer.name .. ')\n$' .. pickup.count .. ' Pool Pock Up Kard\n```')
			TriggerClientEvent('esx:removePickup', -1, id)
			xPlayer.addMoney(pickup.count)
			ESX.Pickups[id]	= nil
		elseif pickup.type == 'item_weapon' then
			TriggerEvent('DiscordBot:ToDiscord', 'pickup', xPlayer.name .. '('.. source .. ')', '```css\n' .. GetPlayerName(source).. '('.. xPlayer.name .. ')\n' .. pickup.name .. ' Ba ' .. pickup.count .. ' Tir Pick Up Kard\n```')
			TriggerClientEvent('esx:removePickup', -1, id)
			xPlayer.addWeapon(pickup.name, pickup.count)
			ESX.Pickups[id]	= nil
		end
	end
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(resoan)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.set('IsDead', resoan)
end)

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		identifier   = xPlayer.identifier,
		inventory    = xPlayer.inventory,
		job          = xPlayer.job,
		loadout      = xPlayer.loadout,
		lastPosition = xPlayer.coords,
		money        = xPlayer.money
	})
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb({
		identifier   = xPlayer.identifier,
		inventory    = xPlayer.inventory,
		job          = xPlayer.job,
		loadout      = xPlayer.loadout,
		lastPosition = xPlayer.coords,
		money        = xPlayer.money
	})
end)

ESX.RegisterServerCallback('esx:getOtherPlayerDataCard', function(source, cb, target)

	local xPlayer = ESX.GetPlayerFromId(target)

	local identifier = GetPlayerIdentifiers(target)[1]

	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = identifier
	})

	local name 		= result[1].playerName
	local dob       = result[1].dateofbirth
	local height    = result[1].height
	local sex

	if result[1].skin ~= nil then
		skin = json.decode(result[1].skin)
		local isMale = skin.sex == 0
		if isMale then sex = 'آقا' else sex = 'خانم' end
	end

	local data = {
		name      = name,
		money	  = xPlayer.money,
		job       = xPlayer.job,
		inventory = xPlayer.inventory,
		weapons   = xPlayer.loadout,
		sex       = sex
	}

	TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
		if status ~= nil then
			data.drunk = math.floor(status.percent)
		end
	end)

	TriggerEvent('esx_license:getLicenses', target, function(licenses)
		data.licenses = licenses
		cb(data)
	end)

end)

ESX.RegisterServerCallback('nameAvalibity', function(source, cb, name)
	exports.ghmattimysql:execute('SELECT * FROM users WHERE `playerName` = @playerName', {
		['playerName']	= name
	}, function(result)
		if result[1] then
			cb(false)
		else
			cb(true)
		end
	end)
end)

ESX.RegisterServerCallback('register:check', function(source, cb)
	                        local xPlayer = ESX.GetPlayerFromId(source)
	                        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', 
							{
								['@identifier'] =  xPlayer.identifier

							}, function(data)
							if not data[1].playerName or data[1].playerName == "" then
							cb(true)
							else
						    cb(false)
							end
							end)

end)

ESX.RegisterServerCallback('esx_eden_clotheshop:checkPropertyDataStore', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local foundStore = false
	local foundGang	 = false

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)
	if xPlayer.gang.name ~= 'nogang' and xPlayer.gang.grade == 6 then
		foundGang = {}
		for i=1, #ESX.Gangs[xPlayer.gang.name].grades do
			table.insert(foundGang, ESX.Gangs[xPlayer.gang.name].grades[i].label)
		end
	end
	cb(foundStore, foundGang)

end)

ESX.RegisterServerCallback('esx:checkDeath', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb(xPlayer.IsDead)
end)

ESX.RegisterServerCallback('esx:checkInjure', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb(xPlayer.Injure)
end)

-- TriggerEvent("es:addGroup", "jobmaster", "user", function(group) end)

-- ESX.StartDBSync()
ESX.StartPayCheck()
