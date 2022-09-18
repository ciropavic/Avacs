ESX = nil
local alias = {}



Citizen.CreateThread(function()

    while ESX == nil do

        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

        Citizen.Wait(0)

    end

end)



local vehicles = {

    [2071877360] = {  -- INSURGENT2 PD

        [3] = "seat_dside_r3",

        [4] = "seat_pside_r3",

    }, 

    [610904671] = {  -- INSURGENT2 NOOSE

        [3] = "seat_dside_r3",

        [4] = "seat_pside_r3",

    }, 

    [-1775728740] = {  -- GRANGER

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

    }, 

    [-1647941228] = { -- FBI2

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

    },

    [-1237253773] = { -- DUBSTA3

        [3] = "seat_dside_r2",

        [4] = "seat_pside_r2"

    },

    [-2107990196] = { -- GUARDIAN

        [3] = "seat_dside_r2",

        [4] = "seat_pside_r2"

    },

    [-305727417] = { -- BRICKADE

        [3] = "seat_dside_r2",

        [4] = "seat_pside_r2"

    },

    [117401876] = { -- BTYPE

        [3] = "seat_dside_r2",

        [4] = "seat_pside_r2"

    },

    [-602287871] = { -- BTYPE3

        [3] = "seat_dside_r2",

        [4] = "seat_pside_r2"

    },

    [-1205689942] = { -- RIOT

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r1"

    },

    [-1693015116] = { -- RIOT2

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1"

    },

    [1922257928] = { -- SHERIFF2

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

    },

    [-2007026063] = { -- PBUS

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

        [7] = "seat_dside_r3",

        [8] = "seat_pside_r3",

        [9] = "seat_dside_r4"

    },

    [65352125] = { -- PBUS3

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

        [7] = "seat_dside_r3",

        [8] = "seat_pside_r3",

    },

    [-713569950] = { -- Bus

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

        [7] = "seat_dside_r3",

        [8] = "seat_pside_r3",

        [9] = "seat_dside_r4",

        [10] = "seat_pside_r4",

        [11] = "seat_dside_r5",

        [12] = "seat_pside_r5",

        [13] = "seat_dside_r6",

        [14] = "seat_pside_r6",

    },

    [-120287622] = { --  journey

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1"

    },

    [-1214293858] = { -- LUXOR2

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r",

        [5] = "seat_pside_r2",

        [6] = "seat_pside_r3",

    },

    [-50547061] = { -- CARGOBOB

        [3] = "seat_dside_r1",

        [4] = "seat_pside_r1",

        [5] = "seat_dside_r2",

        [6] = "seat_pside_r2",

        [7] = "seat_dside_r3",

        [8] = "seat_pside_r3",

    },

    [-493410377] = { -- RAPTOR150

        [3] = "seat_dside_r2",

        [4] = "seat_pside_r2",

    },

    [-1961627517] = { -- STRETCH

        [3] = "seat_dside_r2",

        [4] = "seat_dside_r3",

    }

}



local disPlayerNames = 10

local own = true

local ownID = PlayerId()

local performanceMode = false

playersInfo = {}

local controlPress = false

-- hidePlayers = {}

labels  = {}



RegisterNetEvent('esx_idoverhead:modifydistance')

AddEventHandler('esx_idoverhead:modifydistance', function(distance)



    ESX.TriggerServerCallback('esx_aduty:checkAdmin', function(isAdmin)

        if isAdmin then

            disPlayerNames = distance

        end

    end)



end)



RegisterNetEvent('esx_idoverhead:toggleOwn')

AddEventHandler('esx_idoverhead:toggleOwn', function()

    if own then

        own = false

    else

        own = true

    end

end)



-- RegisterNetEvent('esx_idoverhead:updateTags')

-- AddEventHandler('esx_idoverhead:updateTags', function(hidep)

--     hidePlayers = hidep

-- end)



RegisterNetEvent('esx_idoverhead:updateLabels')

AddEventHandler('esx_idoverhead:updateLabels', function(labelsp)

    labels = labelsp

end)



RegisterNetEvent('esx_idoverhead:changeLabelHideStatus')

AddEventHandler('esx_idoverhead:changeLabelHideStatus', function(id, status)



    if id == nil then return end

    if type(status) ~= "boolean" then return end



    if labels[id] then

        if labels[id].info then

          labels[id].info["hide"] = status

        end

    end



end)



-- RegisterNetEvent('esx_idoverhead:modifyHides')

-- AddEventHandler('esx_idoverhead:modifyHides', function(type, id)



--     if id == nil then return end

--     local id = id

--     if type == "add" then

--         if not hidePlayers[id] then

--             hidePlayers[id] = id

--         end

--     elseif type == "remove" then

--         if hidePlayers[id] then

--             hidePlayers[id] = nil

--         end

--     end



-- end)



RegisterNetEvent('esx_idoverhead:modifyLabel')

AddEventHandler('esx_idoverhead:modifyLabel', function(id, label)



   local id = id

   local label = label



    if DoesTagExist(id, label.badge) then

      RemoveTag(id, label.badge)

    end



    if not DoesTagExist(id, label.badge) then

        if not labels[id] then

            labels[id] = {}

        end

        table.insert(labels[id], label)

    else

        print("Error regarding adding tag because already exist!")

    end

   



end)



local myself = PlayerId()

Citizen.CreateThread(function()

    Citizen.Wait(50)

    while true do

        if not performanceMode or controlPress then

            for k, v in pairs(playersInfo) do

                if k ~= myself then

                    if v.info.distance < disPlayerNames and v.info.cansee and v.info.hide then

                        local x2, y2, z2

                        if (v.info.vehicle ~= nil and v.info.vehicle ~= 0) and (v.info.class ~= nil and v.info.class ~= 8 and v.info.class ~= 13 and v.info.class ~= 0) then

                            local newpos = getVehicleBonePosition(v.info.ped, v.info.vehicle)

                            if newpos then

                                x2, y2, z2 = table.unpack(newpos)

                            else

                                x2, y2, z2 = table.unpack(GetEntityCoords(v.info.ped, true))

                            end

                        else

                            x2, y2, z2 = table.unpack(GetEntityCoords(v.info.ped, true))

                        end

                        

                        DrawText3D(x2, y2, z2+1, v.info.label, 255,255,255)

                        -- if v.info.talking then

                        --     DrawText3D(x2, y2, z2+1, v.info.id, 247,124,24)

                        -- else

                        --     DrawText3D(x2, y2, z2+1, v.info.id, 255,255,255)

                        -- end

    

                        if v.labels ~= nil then

                            for n, j in pairs(v.labels) do

                                if j.toggle == false then

                                    if not j.badge then

                                        DrawText3D(x2, y2, z2 + j.height, "~r~" .. j.display .. "~w~ " .. v.info.name , 247,124,24)

                                    else

                                        DrawText3D(x2, y2, z2 + j.height, j.display, 247,124,24)

                                    end

                                end

                            end

                        end

                       

                    end

    

                elseif own and ownID == k then

                    if v.labels ~= nil then

                        if v.info.hide then

    

                            local ped = PlayerPedId()

                            local x, y, z = table.unpack(GetEntityCoords(ped, true))

    

                            for n, j in pairs(v.labels) do

                                if j.toggle == false then

                                    if not j.badge then

                                        DrawText3D(x, y, z + j.height, "~r~" .. j.display .. "~w~ " .. v.info.name , 247,124,24)

                                    end

                                end

                            end

    

                        end

                    end

                end

    

            end

    

            Citizen.Wait(5)

        else

            Citizen.Wait(750)

        end

    end

end)



Citizen.CreateThread(function()

    while true do

        playersInfo = {}

        local ped = PlayerPedId()

        local coords = GetEntityCoords(ped)



        for _, player in ipairs(GetActivePlayers()) do



            local tped = GetPlayerPed(player)

            local coords2 = GetEntityCoords(tped)

            local distance = math.floor(Vdist(coords.x, coords.y, coords.z, coords2.x, coords2.y, coords2.z))



            if distance < disPlayerNames then

                local vehicle = GetVehiclePedIsIn(tped, false)

                local class = GetVehicleClass(vehicle)

                playersInfo[player] = {

                    info = {

                        distance = distance,

                        cansee = HasEntityClearLosToEntity(ped, tped, 17),

                        name = GetPlayerName(player),

                        hide = IsEntityVisible(tped),

                        id = GetPlayerServerId(player),

                        ped = tped,

                        vehicle = vehicle,

                        class  = class,

                        typing = DecorGetBool(tped, "typing"),

                        dead = DecorGetBool(tped, "isinjured"),

                        talking = NetworkIsPlayerTalking(player)

                    },

                    labels = getplayerTags(player)

                }

                playersInfo[player].info.label = getLabel(playersInfo[player].info)

            end

            

        end

        Citizen.Wait(1000)

    end

end)

-- Citizen.CreateThread(function()

--     while true do

--         if performanceMode then

--             Citizen.Wait(10)

--             controlPress = IsControlPressed(0, 47)

--         else

--             Citizen.Wait(1000)

--         end

--     end

-- end)



AddEventHandler("onKeyDown", function(key)

	if key == "g" and performanceMode then

		controlPress = true

	end

end)



AddEventHandler("onKeyUP", function(key)

	if key == "g" and performanceMode then

		controlPress = false

	end

end)





RegisterCommand("perfmode", function(source, args)

   performanceMode = not performanceMode

   TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "Vaziat performance mode be ^2" .. tostring(performanceMode) .. "^0 taghir kard.")

end)



RegisterNetEvent("esx:playerLoaded")

AddEventHandler("esx:playerLoaded", function()



    local id = PlayerId()

    TriggerServerEvent('esx_idoverhead:checkTimePlay', id)

    

end)



function getplayerTags(player)



    if labels[player] then

        return labels[player]

    end



    return nil



end



function DoesTagExist(player, badge)

    if labels[player] == nil then return false end

    for k,v in pairs(labels[player]) do

        if v.badge == badge then

            return true

        end

    end



    return false

end



function RemoveTag(player, badge)

    for k,v in pairs(labels[player]) do

        if v.badge == badge then

            labels[player][k] = nil

        end

    end

end


--[[Citizen.CreateThread(function()
    while true do
        Wait(10000)
        print(json.encode(GetActivePlayers()))
    end
end)]]


function getVehicleBonePosition(playerPed, pedVehicle)



	local ped = playerPed        

    local veh = pedVehicle

    local model = GetEntityModel(veh)

    local position



        if GetPedInVehicleSeat(veh, -1) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, 'seat_dside_f')) -- LEFT FRONT

        elseif GetPedInVehicleSeat(veh, 0) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, 'seat_pside_f')) -- RIGHT FRONT

        elseif GetPedInVehicleSeat(veh, 1) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, 'seat_dside_r')) -- LEFT BACK

        elseif GetPedInVehicleSeat(veh, 2) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, 'seat_pside_r')) -- RIGHT BACK

        elseif GetPedInVehicleSeat(veh, 3) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][3]))

        elseif GetPedInVehicleSeat(veh, 4) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][4]))

        elseif GetPedInVehicleSeat(veh, 5) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][5]))

        elseif GetPedInVehicleSeat(veh, 6) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][6]))

        elseif GetPedInVehicleSeat(veh, 7) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][7]))

        elseif GetPedInVehicleSeat(veh, 8) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][8]))

        elseif GetPedInVehicleSeat(veh, 9) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][9]))

        elseif GetPedInVehicleSeat(veh, 10) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][10]))

        elseif GetPedInVehicleSeat(veh, 11) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][11]))

        elseif GetPedInVehicleSeat(veh, 12) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][12]))

        elseif GetPedInVehicleSeat(veh, 13) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][13]))

        elseif GetPedInVehicleSeat(veh, 14) == ped then

            position = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, vehicles[model][14]))

        end



        return position



end

typing_txt,ab,bb,cb = "~g~ (Typing.)", true, false, false

Citizen.CreateThread(function()
    while true do
        if ab then
            ab = false
            bb = true
            typing_txt = ' ~g~(Typing.)'
        elseif bb then
            bb = false
            cb = true
            typing_txt = ' ~g~(Typing..)'
        elseif cb then
            cb = false
            ab = true
            typing_txt = ' ~g~(Typing...)'
        end
        Wait(1000)
    end
end)

function getLabel(info)

    local id



    if info.dead then

        id = "~r~" .. info.id 

    elseif info.talking then

        id = "~o~" .. info.id

    else

        id = info.id

    end



    if info.typing then

        id = id .. " ~g~(typing...)"

    end

    if alias[tostring(info.id)] then
        id = id .. ' ~g~| ~r~[~p~'..alias[tostring(info.id)]..'~r~]'
    end

    return id

end



function DrawText3D(x,y,z, text, r,g,b) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)

    local px,py,pz=table.unpack(GetGameplayCamCoords())

    local dist = Vdist(px,py,pz, x,y,z, 1)



    local scale = (1/dist)*2

    local fov = (1/GetGameplayCamFov())*100

    local scale = scale*fov



    if onScreen then

        SetTextScale(0.0*scale, 0.55*scale)

        SetTextFont(0)

        SetTextProportional(1)

        SetTextColour(r, g, b, 255)

        SetTextDropshadow(0, 0, 0, 0, 255)

        SetTextEdge(2, 0, 0, 0, 150)

        SetTextDropShadow()

        SetTextOutline()

        SetTextEntry("STRING")

        SetTextCentre(1)

        AddTextComponentString(text)

        DrawText(_x,_y)

    end

end



-- AddEventHandler('playerSpawned', function()

--     if not hasAlreadyJoined then

--         local id = PlayerId()

--         TriggerClientEvent('esx_idoverhead:modifyLabel', id)

--     end

--     hasAlreadyJoined = true

-- end)

local CommandTimeOut = false

RegisterCommand('alias', function(_, args)
    if CommandTimeOut then
        return ESX.ShowNotification('~r~Lotfan Spam Nakonid')
    end
    CommandTimeOut = true
    if not args[1] or not args[2] then
        return ESX.ShowNotification('~h~~r~Invalid Arguments')
    end
    local TargetClientId = GetPlayerFromServerId(tonumber(args[1]))
    if GetPlayerName(TargetClientId) == '**Invalid**' then
        return ESX.ShowNotification('~h~~r~Player Morede Nazar Online Nist')
    end
    if tonumber(args[1]) == GetPlayerServerId(PlayerId()) then
        return ESX.ShowNotification('~h~~r~Shoma Nemitavanid Khod Ra Alias Konid')
    end
    local id = args[1]
    args[1] = nil
    args[1] = args[2]
    table.remove(args, 2)
    local arguments = table.concat(args, " ")
    if arguments:find('~^') then
        return ESX.ShowNotification('~r~~h~Shoma Nemitavanid Az Special Character Ha Estefade Konid')
    end
    if string.len(arguments) >= 2 then
        return ESX.ShowNotification('~p~Argument Dovome Shoma Nabayad Bishtar~o~ 13 ~p~ Character Bashad')
    end
    alias[id] = arguments
    ESX.ShowNotification('~p~Alias Shoma Baraye Id ['..id..'] Ba Movafaghiat Dar Ram Zakhire Shod')
    Citizen.SetTimeout(2500, function() CommandTimeOut = false end)
end, false)