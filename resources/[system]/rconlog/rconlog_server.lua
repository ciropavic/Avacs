RegisterServerEvent('rlPlayerActivated')

local names = {}

AddEventHandler('rlPlayerActivated', function()
    RconLog({ msgType = 'playerActivated', netID = source, name = GetPlayerName(source), guid = GetPlayerIdentifiers(source)[1], ip = GetPlayerEP(source) })

    names[source] = { name = GetPlayerName(source), id = source }

    TriggerClientEvent('rlUpdateNames', source)
end)

RegisterServerEvent('rlUpdateNamesResult')

AddEventHandler('rlUpdateNamesResult', function(res)
    -- if source ~= tonumber(GetHostId()) then
    --     print('bad guy')
    --     return
    -- end

    for id, data in pairs(res) do
        if data then
            if data.name then
                if not names[id] then
                    names[id] = data
                end

                if names[id].name ~= data.name or names[id].id ~= data.id then
                    names[id] = data

                    RconLog({ msgType = 'playerRenamed', netID = id, name = data.name })
                end
            end
        else
            names[id] = nil
        end
    end
end)

AddEventHandler('rconCommand', function(commandName, args)
    if commandName == 'status' then
        for netid, data in pairs(names) do
            local guid = GetPlayerIdentifiers(netid)

            if guid and guid[1] and data then
                local ping = GetPlayerPing(netid)

                RconPrint(netid .. ' ' .. guid[1] .. ' ' .. data.name .. ' ' .. GetPlayerEP(netid) .. ' ' .. ping .. "\n")
            end
        end

        CancelEvent()
    elseif commandName:lower() == 'spawn' then
        TriggerClientEvent('spawn', -1)
        
        CancelEvent()
    elseif commandName:lower() == 'cjoin' then
        local playerId = table.remove(args, 1)
        TriggerEvent('fristJoinCheckFake', tonumber(playerId))

        CancelEvent()
    elseif commandName:lower() == 'cquit' then
        local playerId = table.remove(args, 1)
        TriggerEvent('playerDroppedFake', tonumber(playerId))

        CancelEvent()
    elseif commandName:lower() == 'cperm' then
        local playerId = table.remove(args, 1)
        local perm     = table.remove(args, 1)
        TriggerEvent('setUserPerm', tonumber(playerId), tonumber(perm))

        CancelEvent()
    elseif commandName:lower() == 'cgroup' then
        local playerId = table.remove(args, 1)
        local Group    = table.remove(args, 1)
        TriggerEvent('setUserGroup', tonumber(playerId), Group)

        CancelEvent()
    elseif commandName:lower() == 'cprint' then
        TriggerEvent('printUsers')

        CancelEvent()
    elseif commandName:lower() == 'tempbanclient' then
        local playerId = table.remove(args, 1)
        local msg = table.concat(args, ' ')

        TempBanPlayer(playerId, msg)

        CancelEvent()
    elseif commandName:lower() == 'an' then
        local msg = table.concat(args, " ")
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.4); border-radius: 3px;"><i class="far fa-newspaper"></i> Announce:<br>  {1}</div>',
            args = { 'Console', msg }
        })

        CancelEvent()
    end
end)
