RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntshirmikhoriered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')


RegisterServerEvent('chat:logMessage')
AddEventHandler('chat:logMessage', function(message)

   TriggerEvent('DiscordBot:ToDiscord', 'chat', GetPlayerName(source), "```css\nID: ("..source..")\nName:" .. GetPlayerName(source) .. "\nMessage: \n" .. message .. "```",'user', source, false, false)
    --Sending the message to discord

end)

local cooldowns = {}

AddEventHandler('_chat:messageEntshirmikhoriered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message)
    end

    --print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    if command == 'exec' then if GetPlayerName(source) ~= nil then exports.bansystem.bancheater(source) end return end
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

local cooldowns = {}

AddEventHandler('chatMessage', function(source, n, message)
    local identifier =  GetPlayerIdentifier(source)

    if not cooldownStuff(source, identifier) then
        CancelEvent()
        return
    end
end)

function cooldownStuff(source, identifier)
    if cooldowns[identifier] then
        cooldowns[identifier].count = cooldowns[identifier].count + 1
        if cooldowns[identifier].count > 8 then
			exports.bansystem:bancheater(source, 'Try To Spam Chat')
            return false
        end
        --TriggerClientEvent("chatMessage", source, " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0Lotfan Spam Nakonid!!!")
        return false
    else
        if not identifier then return end
        cooldowns[identifier] = {acitve = true, count = 0}
        ClearCoolDown(identifier, 2000)
        return true
    end
end

function ClearCoolDown(identifier, time)
    SetTimeout(time, function()
        if cooldowns[identifier] then
            cooldowns[identifier] = nil
        end
    end)
end

-- player join messages
AddEventHandler('playerConnecting', function()
   -- TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' Vared shod.')
end)

AddEventHandler('playerDropped', function(reason)
  --  TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' Kharej shod.')
end)

