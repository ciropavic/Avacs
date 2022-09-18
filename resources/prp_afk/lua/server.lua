ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterNetEvent("qAFK:webhook")
AddEventHandler("qAFK:webhook", function(Value, ValueTwo, Decimal)
    local date = os.date()
    local connect = {
        {
            ["color"] = Decimal,
            ["fields"] = {
                {
                    ["name"] = ValueTwo,
                    ["value"] = Value,
                }
            },
            ["footer"] = {
                ["text"] = "Action Happened: " .. date,
                ["icon_url"] = Config.webhookImage,
            },
        }
    }
    PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = Config.webhookImage}), {['Content-Type'] = 'application/json'})
end)

RegisterCommand("setafk",
function(source, args, rawCommand)
        TriggerClientEvent("qAFK:setAFK", source)
end, false)

RegisterNetEvent("qAFK:sendAFKmessagetoServer") -- If Config.afkmessagestoServer is true, it will send a message to the server.
AddEventHandler("qAFK:sendAFKmessagetoServer", function(name)
    if Config.afkmessagestoServer then 
        TriggerClientEvent("chatMessage", -1, "^7[^4"..GetPlayerName(source).."^7]^0 ba ID ^3"..source.." ^1AFK ^0SHOD")
    end
end)

RegisterCommand("afkoff",function(source, args, rawCommand)
    TriggerClientEvent("qAFK:setNot", source)
end, false)

RegisterServerEvent("qAFK:kickPlayer") -- kick the player as long as AFKkick config is on
AddEventHandler("qAFK:kickPlayer", function(time)
	DropPlayer(source, "You were AFK for "..time.. ". therefore, you were kicked to clear a spot on the server.")
end)