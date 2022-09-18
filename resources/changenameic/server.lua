local ESX = nil
local Vehicles = {}
local Salaries = {}

-- ESX
TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
    end)

-- RegisterCommand("debugs", function(source)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if xPlayer.permission_level == 10 then
--         print(ESX.dump(Salaries))
--     else
--         TriggerClientEvent("esx:showNotification", source, "~r~Kos kesh to ino az koja peyda kardi?")
--     end
-- end,false)

ESX.RegisterServerCallback('changenameic:changename', function(source, cb, name)
    local xPlayer = ESX.GetPlayerFromId(source)
    if name then
        if xPlayer.money >= 50000 then

            if string.find(name, "_") then
                local words = {}
                for w in (name):gmatch("([^_]*)") do 
                    table.insert(words, firstToUpper(removespecial(w)))
                end
                
                if words[1] and words[2] then
                    if string.len(words[1]) >= 3 and string.len(words[3]) >= 3 then

                        MySQL.Async.fetchScalar('SELECT lastchange FROM users WHERE identifier = @identifier', {
                            ['@identifier'] = xPlayer.identifier
                        }, function(lastchange)
                            if os.time() - lastchange >= 2592000 then
                                local lname = words[1] .. "_" .. words[3]

                                MySQL.Async.fetchAll('SELECT identifier FROM users WHERE `playerName` = @playerName', {
                                    ['@playerName']	= lname
                                }, function(result)
                                    if not result[1] then
                                        MySQL.Async.execute('UPDATE users SET lastchange = @lastchange WHERE identifier = @identifier', { ['@identifier'] = xPlayer.identifier, ["@lastchange"] = os.time() })
                                
                                        xPlayer.removeMoney(50000)
                                        
                                        ToDiscord(xPlayer.source, "**".. xPlayer.name .. "** esm khod ra be **" .. lname .. "** taghir dad!")
                                        xPlayer.setName(lname)
                                        cb(7, lname)
                                    else
                                        cb(6)
                                    end
                                end)
                              
                            else
                                cb(5)
                            end                            
                        end)

                    else
                        cb(4)
                    end
                
                else
                    cb(3)
                end
    
            else
                cb(2)
            end

        else
            cb(1)
        end
   
    end
end)  

function ToDiscord(source, Message)
    local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
    
    TriggerEvent('DiscordBot:ToDiscord', 'changename', "Sabte Ahval", Message .. ' `' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec .. '`' ,'user', true, source, false)
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function removespecial(str)
    return str:gsub('[%p%c%s]', '')
end
