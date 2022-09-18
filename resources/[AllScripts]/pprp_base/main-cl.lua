ESX = nil
local searchQueue = nil
local searchRequest = nil
local alias = {}
local Keys = {["ESC"] = 322,["F1"] = 288,["F2"] = 289,["F3"] = 170,["F5"] = 166,["F6"] = 167,["F7"] = 168,["F8"] = 169,["F9"] = 56,["F10"] = 57,["~"] = 243,["1"] = 157,["2"] = 158,["3"] = 160,["4"] = 164,["5"] = 165,["6"] = 159,["7"] = 161,["8"] = 162,["9"] = 163,["-"] = 84,["="] = 83,["BACKSPACE"] = 177,["TAB"] = 37,["Q"] = 44,["W"] = 32,["E"] = 38,["R"] = 45,["T"] = 245,["Y"] = 246,["U"] = 303,["P"] = 199,["["] = 39,["]"] = 40,["ENTER"] = 18,["CAPS"] = 137,["A"] = 34,["S"] = 8,["D"] = 9,["F"] = 23,["G"] = 47,["H"] = 74,["K"] = 311,["L"] = 182,["LEFTSHIFT"] = 21,["Z"] = 20,["X"] = 73,["C"] = 26,["V"] = 0,["B"] = 29,["N"] = 249,["M"] = 244,[","] = 82,["."] = 81,["LEFTCTRL"] = 36,["LEFTALT"] = 19,["SPACE"] = 22,["RIGHTCTRL"] = 70,["HOME"] = 213,["PAGEUP"] = 10,["PAGEDOWN"] = 11,["DELETE"] = 178,["LEFT"] = 174,["RIGHT"] = 175,["TOP"] = 27,["DOWN"] = 173,["NENTER"] = 201,["N4"] = 108,["N5"] = 60,["N6"] = 107,["N+"] = 96,["N-"] = 97,["N7"] = 117,["N8"] = 61,["N9"] = 118}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("adler:heal")
AddEventHandler("adler:heal",function()
	SetEntityHealth(GetPlayerPed(-1), 200)
end)

RegisterNetEvent("adler:a-heal")
AddEventHandler("adler:a-heal",function(heal)
	SetEntityHealth(GetPlayerPed(-1), heal + 100)
end)

RegisterNetEvent("adler:g-heal")
AddEventHandler("adler:g-heal",function(source)
	SetEntityHealth(GetPlayerPed(source), 200)
end)

RegisterNetEvent('adler:mheal')
AddEventHandler('adler:mheal',function()
	GetEntityHealth(GetPlayerPed(-1), nHeal / 2)
end)

RegisterCommand('rheal', function(source)
    local pPed = GetPlayerPed(-1)
    local pHeal = GetEntityHealth(pPed) - 100
    TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Heal Shodma ^2" .. pHeal .. " ^0Ast.")
end)

-- Search System

RegisterNetEvent('search:requestSearch')
AddEventHandler('search:requestSearch', function(source)

    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)

    local sPlayer = GetPlayerFromServerId(source)
    local sPed = GetPlayerPed(sPlayer)
    local sCoords = GetEntityCoords(sPed)

    local distance = #(sCoords - pCoords)

    if distance > Config.MaxDistance then return end

    TriggerEvent('chat:addMessage', {
        color = {255,0,0},
        args = {'[Search System]', '^2' .. GetPlayerName(sPlayer) .. ' ^0Mikhahad Shomara search konad , Baraye Accept Kardan Command ^2/asearch ^0 Ra Vared Konid va Baraye Deny Kardan Command ^1/dsearch ^0ra vared konid .'}
    })
    searchQueue = source
    Citizen.CreateThread(function()
        Citizen.Wait(Config.AcceptTime)
        searchQueue = nil
    end)
end)
-- /asearch -> Accept Kardan Search
RegisterCommand('asearch', function(source, args)

    if searchQueue == nil then
        TriggerEvent('chat:addMessage', {
            color = {255,0,0},
            args = {'[Search System]', 'Hich Kasi Darkhast Search Shoma Ra Nadade Ast .'}
        })
        return
    end

    TriggerServerEvent('search:acceptSearch', searchQueue)
end)

-- /dsearch -> Deny Kardan Search
RegisterCommand('dsearch', function(source, args)

    if searchQueue == nil then
        TriggerEvent('chat:addMessage', {
            color = {255,0,0},
            args = {'[Search System]', 'Hich Kasi Darkhast Search Shoma Ra Nadade Ast .'}
        })
        return
    end

    TriggerServerEvent('search:denySearch', searchQueue)
end)

-- Searcher "Check Is Player In Board"
RegisterNetEvent('search:checkSearchAvailable')
AddEventHandler('search:checkSearchAvailable', function(target)

    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)

    local tPlayer = GetPlayerFromServerId(target)
    local tPed = GetPlayerPed(tPlayer)
    local tCoords = GetEntityCoords(tPed)

    local distance = #(pCoords - tCoords)

    if distance > Config.MaxDistance then
        TriggerEvent('chat:addMessage', {
            color = {255,0,0},
            args = {'[Search System]', 'ID Mored Nazar Az Shoma Kheyli door ast .'}
        })
        return
    end
    searchRequest = target
    Citizen.CreateThread(function()
        Citizen.Wait(Config.AcceptTime)
        searchRequest = nil
    end)
end)

RegisterNetEvent('search:acceptSearch')
AddEventHandler('search:acceptSearch', function(target)

    if target ~= searchRequest then return end

    local player = GetPlayerFromServerId(target)
    ESX.TriggerServerCallback('esx:getOtherPlayerDataCard', function(data)

        local elements = {}
        table.insert(elements, {label = '--- Money ---', value = nil})

        table.insert(elements, {label =  ESX.Math.GroupDigits(data.money), value = nil})

        table.insert(elements, {label = '--- Guns ---', value = nil})

        for i=1, #data.weapons, 1 do
            table.insert(elements, {
                label    = 'weapon: '.. ESX.GetWeaponLabel(data.weapons[i].name),
                value    = data.weapons[i].name,
                itemType = 'item_weapon',
                amount   = data.weapons[i].ammo
            })
        end

        table.insert(elements, {label = '--- Inventory Items ---', value = nil})

        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(elements, {
                    label    = ''.. data.inventory[i].count..'x ' ..data.inventory[i].label,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })
            end
        end


        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
                {
                    title    = 'search',
                    align    = 'top-left',
                    elements = elements,
                },
                function(data, menu)

                    local itemType = data.current.itemType
                    local itemName = data.current.value
                    local amount   = data.current.amount

                    if data.current.value ~= nil then
                        TriggerServerEvent('esx:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
                        OpenBodySearchMenu(player)
                    end

                end, function(data, menu)
                    menu.close()
                end)

    end, GetPlayerServerId(player))
end)

--/down
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent( 'adler:downAnim' )
AddEventHandler( 'adler:downAnim', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end )

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
	end
end)

--/alias
