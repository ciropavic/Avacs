
ESX              = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local limits = {jail = 45, prison = 120, solitary = 30}
local sentences = {}
local jails = {}
local paletos = {}
local solitaries = {}

for i,v in ipairs(Config.Jails) do
	table.insert(jails, {coords = v.coords, occupied = false})	
end

for i,v in ipairs(Config.Jails) do
	table.insert(jails, {coords = v.coords, occupied = false})	
end

for i,v in ipairs(Config.Solitaries) do
	table.insert(solitaries, {coords = v.coords, occupied = false})
end

AddEventHandler('playerDropped', function()
	local source = source 
	local identifier = GetPlayerIdentifier(source)
	 if sentences[identifier] then
		local sentence = {time = sentences[identifier].time, type = sentences[identifier].type, part = sentences[identifier].part or 0}
		exports.ghmattimysql:execute('UPDATE users SET jail = @data WHERE `identifier` = @identifier', 
		{
			['identifier'] = identifier,
			['data'] = json.encode(sentence)
		})
		
		local type = sentences[identifier].type
		local part = sentences[identifier].part or 0

		if type == "jail" then
			jails[part].occupied = false
		elseif type == "solitary" then
			solitaries[part].occupied =  false
		end

		sentences[identifier] = nil
	 end
end)

ESX.RegisterServerCallback("esx_jail:retriveJail", function(source, cb)
	local source = source 
	local identifier = GetPlayerIdentifier(source)
	exports.ghmattimysql:scalar("SELECT jail FROM users WHERE identifier = @identifier",{
		["@identifier"] = identifier
	}, function(jail)
		local sentence = json.decode(jail)
		if sentence.time > 0 then
			sentences[identifier] = {type = sentence.type, part = sentence.part or 0, expire = os.time() + (sentence.time * 60), time = sentence.time}
			JobStuff(source)
			AdminStuff(source)

			if sentence.type == "jail" then
				jails[sentence.part].occupied = true
			elseif sentence.type == "solitary" then
				solitaries[sentence.part].occupied = true
			end

		end

		cb(sentence)
	end)
end)

RegisterServerEvent('esx_jail:UpdateTime')
AddEventHandler('esx_jail:UpdateTime', function()
	local source = source
	local identifier = GetPlayerIdentifier(source)
	if sentences[identifier] then
		
			sentences[identifier].time = sentences[identifier].time - 1

			if sentences[identifier].time == 0 then
			   local current = os.time()
				if current >= sentences[identifier].expire then
					Unjail(source, identifier)
				else
					exports.bansystem:bancheater(source, "Got unjailed earlier: " .. sentences[identifier].expire)
				end
			end

		  
	else
		--exports.BanSql:BanTarget(source, "Tried to update his jail time without being jailed", "Cheat Lua executor")
	end
end)

RegisterCommand('cdebug', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 9 then

		local input = string.lower(args[1])
		if input == "cell" then
			for i,v in ipairs(jails) do
				print(i,v.occupied)
			end
		elseif input == "solitary" then
			for i,v in ipairs(solitaries) do
				print(i,v.occupied)
			end
		else
			sendMessage(source, "vorodi vared shode eshtebah ast!")
		end
		
	else
		sendMessage(source, ":| Angosht Nakon")
	end
end, false)

RegisterCommand('cfree', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 9 then

		local input = string.lower(args[1])
		if input == "cell" then
			for i,v in ipairs(jails) do
				jails[i].occupied = false
			end
			sendMessage(source, "Tamami selol haye PD azad shodand")
		elseif input == "solitary" then
			for i,v in ipairs(solitaries) do
				solitaries[i].occupied = false
			end
			sendMessage(source, "Tamami selol haye enferadi azad shodand")
		else
			sendMessage(source, "vorodi vared shode eshtebah ast!")
		end
		
	else
		sendMessage(source, "Khodayi in dastor ro az koja peyda kardi?!")
	end
end, false)

RegisterCommand('prison', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "police" or xPlayer.job.name == "doc" then
		if CheckForEntries(source, args[1], args[2], args[3]) then
			
			local target = tonumber(args[1])
			local identifier = GetPlayerIdentifier(target)
			local time =  tonumber(args[2])
			local reason = table.concat(args, " ", 3)

			if sentences[identifier] then
				sendMessage(source, "Player mored nazar ghablan jail shode ast!")
				return
			end

			if time <= limits["prison"] then

				Sentece(source, target, "prison", time, reason, nil)

			else
				sendMessage(source, "Time vared shode az hade aksar time prison bishtar ast!")
			end

		end
	else
		sendMessage(source, "Shoma dastresi kafi baraya estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('jail', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "police" then
		if CheckForEntries(source, args[1], args[2], args[3]) then

			local target = tonumber(args[1])
			local identifier = GetPlayerIdentifier(target)
			local time =  tonumber(args[2])
			local reason = table.concat(args, " ", 3)

			if sentences[identifier] then
				sendMessage(source, "Player mored nazar ghablan jail shode ast!")
				return
			end

			if time <= limits["jail"] then

				local cell = isACellFree(jails)
				if cell then
					
					Sentece(source, target, "jail", time, reason, cell.part)

				else
					sendMessage(source, "Hich selol khali dar PD vojod nadarad!")
				end

			else
				sendMessage(source, "Time vared shode az hade aksar time jail bishtar ast!")
			end

		end
	else
		sendMessage(source, "Shoma dastresi kafi baraya estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('solitary', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "police" or xPlayer.job.name == "doc" then
		if CheckForEntries(source, args[1], args[2], args[3]) then

			local target = tonumber(args[1])
			local identifier = GetPlayerIdentifier(target)
			local time =  tonumber(args[2])
			local reason = table.concat(args, " ", 3)

			if not sentences[identifier] then
				sendMessage(source, "Player mored nazar jail nashode ast!")
				return
			end

			if sentences[identifier].type ~= "prison" then
				sendMessage(source, "Player mored nazar dar zendan markazi, zendani nashode ast!")
				return
			end

			if sentences[identifier].type == "solitary" then
				sendMessage(source, "Player mored nazar dar hale hazer dar enferadi ast!")
				return
			end

			if time <= limits["solitary"] then

				local cell = isACellFree(solitaries)
				if cell then
					
					Sentece(source, target, "solitary", time, reason, cell.part)

				else
					sendMessage(source, "Hich selol khali dar PD vojod nadarad!")
				end

			else
				sendMessage(source, "Time vared shode az hade aksar time enferadi bishtar ast!")
			end
			
		end
	else
		sendMessage(source, "Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('unjail', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if (xPlayer.job.name == "police" or xPlayer.job.name == "doc") and xPlayer.job.grade >= 4 then

		if not args[1] then
			sendMessage(source, "Shoma dar ghesmat ID chizi vared nakardid")
			return
		end
	
		if not tonumber(args[1]) then
			sendMessage(source, "Shoma dar ghesmat ID faghat mitavanid adad vared konid")
			return
		end

		local name = GetPlayerName(args[1])

		if not name then
			sendMessage(source, "ID mored nazar peyda nashod")
			return false
		end

		local target = tonumber(args[1])
		local identifier = GetPlayerIdentifier(target)

		if not sentences[identifier] then
			sendMessage(source, "In player jail nashode ast!")
			return
		end

		if sentences[identifier].type ~= "admin" then
			uSendToLog("prison", source, target)
			Unjail(target, identifier)
			TriggerClientEvent('esx_jail:notifications', -1, "^3" .. name .. "^0 tavasot ^2" ..  GetPlayerName(source) .. "^0 unjail shod!") 
		else
			sendMessage(source, "Shoma nemitavanid in player ra unjail konid admin jail shode ast!")
		end

	else
		sendMessage(source, "Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('checktime', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "police" or xPlayer.job.name == "doc" or xPlayer.permission_level > 0 then

		if not args[1] then
			sendMessage(source, "Shoma dar ghesmat ID chizi vared nakardid")
			return false
		end
	
		if not tonumber(args[1]) then
			sendMessage(source, "Shoma dar ghesmat ID faghat mitavanid adad vared konid")
			return false
		end
	
		if not GetPlayerName(args[1]) then
			sendMessage(source, "ID mored nazar peyda nashod")
			return false
		end

		local target = tonumber(args[1])
		local identifier = GetPlayerIdentifier(target)

		if sentences[identifier] then
			local type = sentences[identifier].type
			if type == "admin" then
				if xPlayer.permission_level > 0 then
					sendMessage(source, "Zaman admin jaile ^2" .. GetPlayerName(target) .. "^3 " .. sentences[identifier].time .. "^0 daghighe ast!")
				else
					sendMessage(source, "Player mored nazar admin jail shode ast shoma nemitavanid zaman ra check konid!")
				end
			else
				if xPlayer.job.name == "police" or xPlayer.job.name == "doc" then
					sendMessage(source, "Zaman zendan ^2" .. getName(target) .. "^3 " .. sentences[identifier].time .. "^0 mah ast!")
				else
					sendMessage(source, "Player mored nazar tavasor police jail shode ast shoma nemitavanid zaman ra check konid!")
				end
			end
		else
			sendMessage(source, "Player mored nazar jail nashode ast")
		end
		
	else
		sendMessage(source, "Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

-- [[ Admin Commands ]]

RegisterCommand('ajail', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 5 then
		if CheckForEntries(source, args[1], args[2], args[3]) then

			if not xPlayer.get('admin') then
				sendMessage(source, "Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
				return
			end

			local target = tonumber(args[1])
			local identifier = GetPlayerIdentifier(target)
			local time =  tonumber(args[2])
			local reason = table.concat(args, " ", 3)

			if sentences[identifier] then
				sendMessage(source, "Player mored nazar ghablan jail shode ast!")
				return
			end


			Sentece(source, target, "admin", time, reason, nil)

		end
	else
		sendMessage(source, "Shoma dastresi kafi baraya estefade az in dastor ra nadarid!")
	end
end, false)



--offline
RegisterCommand('ajailoffline', function(source, args, users)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 5 then

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

                            if tonumber(args[2]) then
                                local jailTime = tonumber(args[2])


                            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
                                        {
                                            ['@identifier'] = args[1]

                                        }, function(data)
                                            if data[1] then

                                                if #data > 1 then

                                                    TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Bish az yek player ba in HEX vojoud darad!")

                                                  --  for i=1, #data, 1 do

                                                  --      TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0player haye mojoud:" .. data[i].playerName )

                                                 --   end

                                                else


                                                                MySQL.Async.execute('UPDATE users SET jail = @jailtime  , jailreason = @jailreason WHERE identifier=@identifier',
                                                                {
                                                                    ['@identifier'] = data[1].identifier,
                                                                    ["@jailtime"] = '{"time":'..jailTime..',"type":"admin","part":0}',
																	['@jailreason'] = table.concat(args, " ",3)

                                                                }, function(rowsChanged)
                                                                    if rowsChanged > 0 then


                                                                            local jailReason = table.concat(args, " ",3)


                                                                                if jailTime ~= nil then


                                                                                        MySQL.Async.execute('INSERT INTO adminjaillog (identifier, name, jailreason, jailtime, punisher) VALUES (@identifier, @name, @reason, @jailtime, @punisher)',
                                                                                                {
                                                                                                    ['@identifier'] = data[1].identifier,
                                                                                                    ['@name'] = args[1],
                                                                                                    ['@jailtime'] = jailTime,
                                                                                                    ['@reason'] = jailReason,
                                                                                                    ['@punisher']= GetPlayerName(source)
                                                                                                })

																								TriggerClientEvent('chatMessage', -1, "[AdminJail]", {255, 0, 0}, " ^1" .. data[1].playerName .. "^0 Admin jail shod be Dalile:^2 " .. jailReason .. "^0 Be modat ^3" .. jailTime .. " ^0Daghighe")
																								TriggerEvent('DiscordBot:ToDiscord', 'ajail', 'Jail Log', data[1].playerName .. ' tavasot ' .. GetPlayerName(source) .. ' jail shod be modat ' .. jailTime .. ' daghighe be dalil: ' .. jailReason,'user', true, source, false)


                                                                                    TriggerClientEvent("esx:showNotification", source, data[1].playerName .. " Zendani shod baraye ~r~~h~" .. args[2] .. " ~w~Daghighe!")

                                                                                else
                                                                                    TriggerClientEvent("esx:showNotification", source, "Zaman na motabar ast!")
                                                                                end

                                                                    end
                                                                end)

                                                end

                                            else
                                                TriggerClientEvent('chatMessage', source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, " ^0Player mored nazar vojoud nadarad!")
                                            end
                                        end)

                                    else
                                        TriggerClientEvent('chatMessage', src, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "Shoma dar ghesmat Zaman faghat mitavanid adad vared konid.")
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


RegisterCommand('aunjail', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 8 then

		if not xPlayer.get('admin') then
			sendMessage(source, "Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
			return
		end

		if not args[1] then
			sendMessage(source, "Shoma dar ghesmat ID chizi vared nakardid")
			return
		end
	
		if not tonumber(args[1]) then
			sendMessage(source, "Shoma dar ghesmat ID faghat mitavanid adad vared konid")
			return
		end

		local name = GetPlayerName(args[1])

		if not name then
			sendMessage(source, "ID mored nazar peyda nashod")
			return false
		end

		local target = tonumber(args[1])
		local identifier = GetPlayerIdentifier(target)

		if not sentences[identifier] then
			sendMessage(source, "In player jail nashode ast!")
			return
		end

		if sentences[identifier].type == "admin" then
			uSendToLog("admin", source, target)
			Unjail(target, identifier)
			sendMessage(source, "^2" .. name .. "^0 ba movafaghiat unjail shod!")
		else
			sendMessage(source, "Shoma nemitavanid in player ra unjail konid admin jail nashode ast!")
		end

	else
		sendMessage(source, "Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('aicunjail', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 11 then

		if not args[1] then
			sendMessage(source, "Shoma dar ghesmat ID chizi vared nakardid")
			return
		end
	
		if not tonumber(args[1]) then
			sendMessage(source, "Shoma dar ghesmat ID faghat mitavanid adad vared konid")
			return
		end

		local name = GetPlayerName(args[1])

		if not name then
			sendMessage(source, "ID mored nazar peyda nashod")
			return false
		end

		local target = tonumber(args[1])
		local identifier = GetPlayerIdentifier(target)

		if not sentences[identifier] then
			sendMessage(source, "In player jail nashode ast!")
			return
		end

		
			uSendToLog("admin", source, target)
			Unjail(target, identifier)
			sendMessage(source, "^2" .. name .. "^0 ba movafaghiat unjail shod!")

	else
		sendMessage(source, "Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

RegisterCommand('jailinfo', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.permission_level >= 1 then
        
		if not args[1] then
			sendMessage(source, "Shoma Hich Steam Hex Chizi Vared Nakardid")
			return
		end
		if string.match(args[1],'steam') then
		 pidentifier = args[1]
		else
		pidentifier = GetPlayerIdentifiers(args[1])[1]
		end
	--jailinfo = {}
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', 
							{
								['@identifier'] =  pidentifier

							}, function(data)
						
						     local data1 = json.decode(data[1].jail)
                             if data1.time == 0 then
							 sendMessage(source, "In Fard Jail Nashode Ast!")
							 else
                             local jtime = data1.time
							 local jtype = "Police"
							 if data1.type == "admin" then
							 jtype = "Admin"
							 end
							 jreason = data[1].jailreason
							  sendMessage(source, "Time Jail : " .. jtime.. " | Jail Reason : " .. jreason .. " | Jaile Type : " .. jtype)
                             end							 
				
				end)
     
	else
		sendMessage(source, "Shoma dastresi kafi baraye estefade az in dastor ra nadarid!")
	end
end, false)

-- [[ End of Admin Commands ]]
function getName(target)
	return exports.essentialmode:IcName(target)
end

function CheckForEntries(source, args1, args2, args3)
	if not args1 then
		sendMessage(source, "Shoma dar ghesmat ID chizi vared nakardid")
		return false
	end

	if not tonumber(args1) then
		sendMessage(source, "Shoma dar ghesmat ID faghat mitavanid adad vared konid")
		return false
	end

	if not GetPlayerName(tonumber(args1)) then
		sendMessage(source, "ID mored nazar peyda nashod")
		return false
	end

	if not args2 then
		sendMessage(source, "Shoma dar ghesmat zaman chizi vared nakardid")
		return false
	end

	if not tonumber(args2) then
		sendMessage(source, "Shoma dar ghesmat zaman faghat mitavanid adad vared konid")
		return false
	end

	if tonumber(args2) <= 0 then
		sendMessage(source, "Zaman zendan bayad mosavi ya bishtar az yek daghighe bashad!")
		return false
	end

	if not args3 then
		sendMessage(source, "Shoma dar ghesmat dalil chizi vared nakardid")
		return false
	end

	return true
end

function isACellFree(object)
	for i,v in ipairs(object) do
		if not v.occupied then
			return {part = i}
		end
	end

	return false
end

function Sentece(source, target, type, time, reason, part)
	local identifier = GetPlayerIdentifier(target)
	JobStuff(target)
	AdminStuff(target)

	if type == "jail" then
		jails[part].occupied = true
	elseif type == "solitary" then
		solitaries[part].occupied = true
	end

	local jtime
	local jexpire
	if type == "solitary" then
		jtime = sentences[identifier].time + time
		jexpire = (sentences[identifier].time + time) * 60
	else
		jtime = time
		jexpire = os.time() + time * 60
	end

	TriggerClientEvent('esx_jail:SentencePlayer', target, type, jtime, part)
	sentences[identifier] = {type = type, part = part, expire = jexpire, time = jtime}
	SqlSync(identifier, type, time, part or 0,reason)
	SendNotification(type, source, target, reason, time)
end


function Unjail(target, identifier)
	local sentence = {time = 0, type = 0, part = 0}
	exports.ghmattimysql:execute('UPDATE users SET jail = @data WHERE `identifier` = @identifier', 
	{
		['@identifier'] = identifier,
		['@data'] = json.encode(sentence)
	})

	local type = sentences[identifier].type 
	local part = sentences[identifier].part

	if type == "jail" then
		jails[part].occupied = false
	elseif type == "solitary" then
		solitaries[part].occupied =  false
	end

	sentences[identifier] = nil
	local xPlayer = ESX.GetPlayerFromId(target).set('jailed', false)

	TriggerClientEvent('esx_jail:unJailSelf', target)
end

function SqlSync(identifier, type, time, part,reason)
	local sentence = {time = time, type = type, part = part}
	--[[exports.ghmattimysql:execute('UPDATE users SET jail = @data WHERE `identifier` = @identifier', 
	{
		['@identifier'] = identifier,
		['@data'] = json.encode(sentence)
	})]]
	MySQL.Async.execute(
                "UPDATE users SET jail = @jailinfo, jailreason = @jailreason WHERE identifier = @identifier",
                {
                  ["@identifier"] = identifier,
                  ["@jailinfo"] = json.encode(sentence),
				  ["@jailreason"] = reason
    })
end

function SendNotification(type, source, target, reason, time)
	if type == "admin" then
		TriggerClientEvent('chatMessage', -1, "[AdminJail]", {255, 0, 0}, "^1" .. GetPlayerName(target) .. "^0 Admin jail shod be Dalile:^2 " .. reason .. "^0 Be modat ^3" .. time .. "^0 Daghighe")
	else
		TriggerClientEvent('esx_jail:notifications', -1, "^1" .. getName(target) .. "^0 tavasot ^2" .. getName(source) .. "^0 zendani shod be modat ^3" .. time .. "^0 mah be dalile: ^3" .. reason)
	end
	SendToLog(type, source, target, reason, time)
end

function SendToLog(type, source, target, reason, time)
	local asource = GetPlayerName(source)
	local atarget = GetPlayerName(target)
	if type == "admin" then
		TriggerEvent('DiscordBot:ToDiscord', 'adminjail', 'Jail Log', string.gsub(getName(target), "_", " ") .. " (" .. atarget .. ")" .. ' tavasot ' .. string.gsub(getName(source), "_", " ") .. " (" .. asource .. ")" .. ' jail shod be modat ' .. time .. ' daghighe be dalil: ' .. reason,'user', true, source, false)
		exports.ghmattimysql:execute('INSERT INTO adminjaillog (identifier, name, jailreason, jailtime, punisher, date) VALUES (@identifier, @name, @reason, @jailtime, @punisher, @date)', 
		{
			['@identifier'] = GetPlayerIdentifier(target), 
			['@name'] = atarget,
			['@jailtime'] = time,
			['@reason'] = reason,
			['@punisher'] = asource,
			['@date'] = os.time()
		})
	elseif type == "solitary" then
		TriggerEvent('DiscordBot:ToDiscord', 'policejail', 'Jail Log', string.gsub(getName(target), "_", " ") .. " (" .. atarget .. ")" .. ' tavasot ' .. string.gsub(getName(source), "_", " ") .. " (" .. asource .. ")" .. ' be enferadi ferestade shod va ' .. time .. ' daghighe be zaman zendan ezafe shod be dalil: ' .. reason,'user', true, source, false)
	else
		TriggerEvent('DiscordBot:ToDiscord', 'policejail', 'Jail Log', string.gsub(getName(target), "_", " ") .. " (" .. atarget .. ")" .. ' tavasot ' .. string.gsub(getName(source), "_", " ") .. " (" .. asource .. ")" .. ' jail shod be modat ' .. time .. ' daghighe be dalil: ' .. reason,'user', true, source, false)
	end
end

function uSendToLog(type, source, target)
	local asource = GetPlayerName(source)
	local atarget = GetPlayerName(target)
	local identifier = GetPlayerIdentifier(target)
	if type == "admin" then
		TriggerEvent('DiscordBot:ToDiscord', 'adminunjail', 'Jail Log', string.gsub(getName(target), "_", " ") .. " (" .. atarget .. ")" .. ' tavasot ' .. string.gsub(getName(source), "_", " ") .. " (" .. asource .. ")" .. ' ba ' .. sentences[identifier].time .. ' daghighe jail baghi mande unjail shod','user', true, source, false)
	else
		TriggerEvent('DiscordBot:ToDiscord', 'policeunjail', 'Jail Log', string.gsub(getName(target), "_", " ") .. " (" .. atarget .. ")" .. ' tavasot ' .. string.gsub(getName(source), "_", " ") .. " (" .. asource .. ")" .. ' ba ' .. sentences[identifier].time .. ' daghighe jail baghi mande unjail shod','user', true, source, false)
	end
end

function JobStuff(target)
	local xPlayer = ESX.GetPlayerFromId(target)
	  if xPlayer then
		local job = xPlayer.job.name
		local grade = xPlayer.job.grade
		xPlayer.setJob('off' .. job, grade)
	  end
end

function AdminStuff(target)
	local xPlayer = ESX.GetPlayerFromId(target)
	if xPlayer then
		xPlayer.set('jailed', true)
	  if xPlayer.get('admin') then
		exports.irs_admin:DutyHandler(target, false)
	  end
	end
end

function sendMessage(target, message)
	TriggerClientEvent('chatMessage', target, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, message)
end