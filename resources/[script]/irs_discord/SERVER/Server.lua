-- System Infos
PerformHttpRequest('https://discordapp.com/api/webhooks/745374154911383594/jP22SU6s9E2wqu72GO2P58gWHPV8aGVisSiHMIfvQfXGnk9OrDVLHzd9cYQ1N3IjsBgr', function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**Log Start Shod**'}), { ['Content-Type'] = 'application/json' })

AddEventHandler('playerConnecting', function()
	TriggerEvent('DiscordBot:ToDiscord', 'connect', SystemName, '```css\n' .. GetPlayerName(source) .. '('.. source ..')Connect Shod\n```')
end)

AddEventHandler('playerDropped', function(Reason)
	TriggerEvent('DiscordBot:ToDiscord', 'disconnect', SystemName, '```fix\n' .. GetPlayerName(source) .. '('.. source ..') Left Dad (' .. Reason .. ')\n```', 'system', source, false, false)
end)

-- Killing Log
RegisterServerEvent('DiscordBot:PlayerDied')
AddEventHandler('DiscordBot:PlayerDied', function(Message, Weapon)
	local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	if Weapon then
		Message = Message .. ' [' .. Weapon .. ']'
	end
	
	TriggerEvent('DiscordBot:ToDiscord', 'kill', SystemName, '```fix\n' ..Message .. '\n' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec .. '\n```')
end)

-- Chat
--[[AddEventHandler('chatMessage', function(Source, Name, Message)
	TriggerEvent('DiscordBot:ToDiscord', 'chat', Name .. ' [ID: ' .. Source .. ']', Message, 'steam', Source, false, false)
end)]]

--Event to actually send Messages to Discord
RegisterServerEvent('DiscordBot:ToDiscord')
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message)
	if Message == nil or Message == '' then
		return nil
	end

	if Hooks[WebHook:lower()] then
		WebHook = Hooks[WebHook:lower()]
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!' .. WebHook)
		return nil
	end

	        Image = 'https://cdn.discordapp.com/attachments/745368838257901640/770738333390340176/512.png'
			--Using the default avatar if no steam avatar is available
			PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = false}), {['Content-Type'] = 'application/json'})

end)

-- Functions
function IsCommand(String, Type)
	if Type == 'Blacklisted' then
		for Key, BlacklistedCommand in ipairs(BlacklistedCommands) do
			if String[1]:lower() == BlacklistedCommand:lower() then
				return true
			end
		end
	elseif Type == 'Special' then
		for Key, SpecialCommand in ipairs(SpecialCommands) do
			if String[1]:lower() == SpecialCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'HavingOwnWebhook' then
		for Key, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
			if String[1]:lower() == OwnWebhookCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'TTS' then
		for Key, TTSCommand in ipairs(TTSCommands) do
			if String[1]:lower() == TTSCommand:lower() then
				return true
			end
		end
	elseif Type == 'Registered' then
		local RegisteredCommands = GetRegisteredCommands()
		for Key, RegisteredCommand in ipairs(GetRegisteredCommands()) do
			if String[1]:lower():gsub('/', '') == RegisteredCommand.name:lower() then
				return true
			end
		end
	end
	return false
end

function ReplaceSpecialCommand(String)
	for i, SpecialCommand in ipairs(SpecialCommands) do
		if String[1]:lower() == SpecialCommand[1]:lower() then
			String[1] = SpecialCommand[2]
		end
	end
	return String
end

function GetOwnWebhook(String)
	for i, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
		if String[1]:lower() == OwnWebhookCommand[1]:lower() then
			if OwnWebhookCommand[2] == 'WEBHOOK_LINK_HERE' then
				print('Please enter a webhook link for the command: ' .. String[1])
				return DiscordWebhookChat
			else
				return OwnWebhookCommand[2]
			end
		end
	end
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function GetIDFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end

-- Version Checking down here, better don't touch this
local CurrentVersion = '1.5.2'
local GithubResourceName = 'DiscordBot'

--loger 2
local logs = "Change this to your webhook"
local communityname = "IR.Spring"
local communtiylogo = "https://cdn.discordapp.com/attachments/764530595929260052/765280908806455328/Preview_Logo_logo.png" --Must end with .png or .jpg

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Connected to Server (".. source..")",
            ["description"] = "Player: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/758007552859701271/wcTCibhWdqyeK1S-VEhDekJekktA5efybrqawj8tt1izweKBUrPqi1YMipEp5iGf6a4R', function(err, text, headers) end, 'POST', json.encode({username = "Big Yoda Server Logger", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Disconnected from Server (".. source ..")",
            ["description"] = "Player: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest('https://discordapp.com/api/webhooks/758007696426401912/oR5u6BCUClVU-D9RyLVlD47T4sZIj1YHcX99lVO2eBRlu4YvvxJFkCPaHDM_H7HrmMpq', function(err, text, headers) end, 'POST', json.encode({username = "Big Yoda Server Logger", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)


