local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local hasAlreadyJoined          = false
local set                       = false
local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local IsHandcuffed              = false
local IsDragged                 = false
local CopPed                    = 0
local allBlip                   = {}
local Data                      = {}
local blipGangs                 = {}

ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
end
end)



function OpenGangActionsMenu()
  ESX.UI.Menu.CloseAll()    
  
  local elements = {
    {label = _U('handcuff'),        value = 'handcuff'},
    {label = _U('drag'),            value = 'drag'},
    {label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},
    {label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
	
  }
  --print(Data.search)

  
   table.insert(elements, {label = _U('search'), value = 'search'}) 

  ESX.UI.Menu.Open(
  'default', GetCurrentResourceName(), 'citizen_interaction',
  {
    title    = _U('citizen_interaction'),
    align    = 'top-right',
    elements = elements
  },
  function(data2, menu2)

    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then

      if data2.current.value == 'handcuff' then
        TriggerServerEvent('vipmenu:handcuff', GetPlayerServerId(player))
      elseif data2.current.value == 'drag' then
        TriggerServerEvent('vipmenu:drag', GetPlayerServerId(player))
      elseif data2.current.value == 'put_in_vehicle' then
        
        local vehicle = ESX.Game.GetVehicleInDirection(4)
        if vehicle == 0 then
          TriggerEvent("chatMessage", " [ SYSTEM | PersianPixel ] ", {255, 0, 0}, "^0Hich mashini nazdik shoma nist!")
          return
        end

        local NetId = NetworkGetNetworkIdFromEntity(vehicle)

        TriggerServerEvent('vipmenu:putInVehicle', GetPlayerServerId(player), NetId)
      elseif data2.current.value == 'out_the_vehicle' then
        TriggerServerEvent('vipmenu:OutVehicle', GetPlayerServerId(player))
      elseif data2.current.value == "search" then
        OpenBodySearchMenu(player)
	 

      end
    -- print(player)
	-- print(GetPlayerPed(player))
    else
      ESX.ShowNotification(_U('no_players_nearby'))
    end

  end,
  function(data2, menu2)
    menu2.close()
  end)
end

function OpenBodySearchMenu(player)

  ESX.TriggerServerCallback('esx:getOtherPlayerData', function(data)

    local elements = {}

    table.insert(elements, {label = "----- Pool -----", value = nil})
    table.insert(elements, {
      label = 'Pol: $' .. ESX.Math.GroupDigits(data.money),
      value = 'money',
      itemType = 'item_money',
      amount = data.money
    })

    table.insert(elements, {label = '--- Aslahe ---', value = nil})

    for i=1, #data.loadout, 1 do
      if not IsBlackList(data.loadout[i].name) then
        if data.job.name == "police" and data.loadout[i].name ~= "WEAPON_MICROSMG" then
          table.insert(elements, {
            label          = _U('confiscate') .. ESX.GetWeaponLabel(data.loadout[i].name),
            value          = data.loadout[i].name,
            itemType       = 'item_weapon',
            amount         = data.ammo,
          })
        else
          table.insert(elements, {
            label          = _U('confiscate') .. ESX.GetWeaponLabel(data.loadout[i].name),
            value          = data.loadout[i].name,
            itemType       = 'item_weapon',
            amount         = data.ammo,
          })
        end   
      end
    end

    table.insert(elements, {label = _U('inventory_label'), value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
          value          = data.inventory[i].name,
          itemType       = 'item_standard',
          amount         = data.inventory[i].count,
        })
      end
    end


    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'body_search',
      {
        title    = _U('search'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local itemType = data.current.itemType
        local itemName = data.current.value
        local amount   = data.current.amount

        if data.current.value ~= nil then
          Wait(math.random(0, 500))
         TriggerServerEvent('esx:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
		--  if itemType == 'item_weapon' then
        --  RemoveWeaponFromPed(GetPlayerPed(player), GetHashKey(itemName))
        --  end		  
          
          OpenBodySearchMenu(player)

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))

end




RegisterNetEvent('vipmenu:handcuff')
AddEventHandler('vipmenu:handcuff', function()

 IsHandcuffed    = not IsHandcuffed;
local playerPed = GetPlayerPed(-1)

 Citizen.CreateThread(function()

   if IsHandcuffed then

    ESX.SetPlayerData('HandCuffed', 1)
    RequestAnimDict('mp_arresting')

    while not HasAnimDictLoaded('mp_arresting') do
      Wait(100)
    end

     TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
     SetEnableHandcuffs(playerPed, true)
     SetPedCanPlayGestureAnims(playerPed, false)

   else

    ESX.SetPlayerData('HandCuffed', 0)
    ClearPedSecondaryTask(playerPed)
    SetEnableHandcuffs(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed,  true)

   end

 end)
end)

RegisterNetEvent('vipmenu:drag')
AddEventHandler('vipmenu:drag', function(cop)
TriggerServerEvent('esx:clientLog', 'starting dragging')
IsDragged = not IsDragged
CopPed = tonumber(cop)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if IsHandcuffed then
      if IsDragged then
        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
        if DoesEntityExist(ped) and IsPedOnFoot(ped) and not IsPedDeadOrDying(ped, true) then
          local myped = GetPlayerPed(-1)
          AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        else
          DetachEntity(GetPlayerPed(-1), true, false)
        end    
      else
        DetachEntity(GetPlayerPed(-1), true, false)
      end
    else
      Citizen.Wait(500)
    end
  end
end)

AddEventHandler('esx:onPlayerDeath', function()
  IsDragged = false
  if IsHandcuffed then
    TriggerEvent('vipmenu:handcuff')
  end
end)

RegisterNetEvent('vipmenu:putInVehicle')
AddEventHandler('vipmenu:putInVehicle', function(vehicle)

  local veh = NetworkGetEntityFromNetworkId(vehicle)
  local ped = GetPlayerPed(-1)

  if IsVehicleSeatFree(veh, 1) then

    TaskWarpPedIntoVehicle(ped, veh, 1)
    TriggerEvent('seatbelt:changeStatus', true)

  elseif IsVehicleSeatFree(veh, 2) then

    TaskWarpPedIntoVehicle(ped, veh, 2)
    TriggerEvent('seatbelt:changeStatus', true)

  end

end)

RegisterNetEvent('vipmenu:OutVehicle')
AddEventHandler('vipmenu:OutVehicle', function()
  local playerPed = PlayerPedId()
  
  if not IsPedSittingInAnyVehicle(playerPed) then
    return
  end

  local vehicle = GetVehiclePedIsIn(playerPed, false)
  TaskLeaveVehicle(playerPed, vehicle, 16)
end)



-- Handcuff
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if IsHandcuffed then
      --DisableControlAction(2, 1, true) -- Disable pan
    --   DisableControlAction(2, 2, true) -- Disable tilt
      DisableControlAction(2, 24, true) -- Attack
      DisableControlAction(0, 69, true) -- Attack in car
      DisableControlAction(0, 70, true) -- Attack in car 2
      DisableControlAction(0, 68, true) -- Attack in car 3
      DisableControlAction(0, 66, true) -- Attack in car 4
      DisableControlAction(0, 167, true) -- F6
      DisableControlAction(0, 67, true) -- Attack in car 5
      DisableControlAction(2, 257, true) -- Attack 2
      DisableControlAction(2, 25, true) -- Aim
      DisableControlAction(2, 263, true) -- Melee Attack 1
    --   DisableControlAction(0, 30,  true) -- MoveLeftRight
    --   DisableControlAction(0, 31,  true) -- MoveUpDown
      DisableControlAction(0, 29,  true) -- B
      DisableControlAction(0, 74,  true) -- H
      DisableControlAction(0, 71,  true) -- W CAR
      DisableControlAction(0, 72,  true) -- S CAR
      DisableControlAction(0, 63,  true) -- A CAR
      DisableControlAction(0, 64,  true) -- D CAR
      DisableControlAction(2, Keys['R'], true) -- Reload
    --   DisableControlAction(2, Keys['LEFTSHIFT'], true) -- run
      DisableControlAction(2, Keys['TOP'], true) -- Open phone (not needed?)
      DisableControlAction(2, Keys['SPACE'], true) -- Jump
      DisableControlAction(2, Keys['Q'], true) -- Cover
      DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
      DisableControlAction(2, Keys['F'], true) -- Also 'enter'?
      DisableControlAction(2, Keys['F1'], true) -- Disable phone
      DisableControlAction(2, Keys['F2'], true) -- Inventory
      DisableControlAction(2, Keys['F3'], true) -- Animations
      DisableControlAction(2, Keys['V'], true) -- Disable changing view
      DisableControlAction(2, Keys['X'], true) -- Disable changing view
      DisableControlAction(2, Keys['P'], true) -- Disable pause screen
      DisableControlAction(2, Keys['L'], true) -- Disable seatbelt
      DisableControlAction(2, Keys['Z'], true)
      DisableControlAction(2, 59, true) -- Disable steering in vehicle
      DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
      DisableControlAction(0, 47, true)  -- Disable weapon
      DisableControlAction(0, 264, true) -- Disable melee
      DisableControlAction(0, 257, true) -- Disable melee
      DisableControlAction(0, 140, true) -- Disable melee
      DisableControlAction(0, 141, true) -- Disable melee
      DisableControlAction(0, 142, true) -- Disable melee
      DisableControlAction(0, 143, true) -- Disable melee
      DisableControlAction(0, 75, true)  -- Disable exit vehicle
      DisableControlAction(27, 75, true) -- Disable exit vehicle

      if not IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 1) then
      TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
      end

    else
      Citizen.Wait(500)
    end
  end
end)



RegisterCommand('vm', function(source)
             ESX.TriggerServerCallback('vipmenu:check', function(isPerm)
				if isPerm ~= nil then
                 local temp = ESX.GetPlayerData()
				 vipdata = isPerm
                 if temp.IsDead ~= 1 and temp.HandCuffed ~= 1 and temp.robbing ~= 1 and temp.jailed ~= 1 then
                 OpenGangActionsMenu()
                 end
                else
                 ESX.ShowNotification('Shoma vip nistid!')
                 end
			end)
  
end, false)


Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/vm', 'Menu Vip')
end)



local blackListedWeapons = {
        'WEAPON_SMG',
        'WEAPON_CARBINERIFLE',
        'WEAPON_STUNGUN',
        'WEAPON_NIGHTSTICK',
        'WEAPON_PUMPSHOTGUN',
		'WEAPON_DOUBLEACTION'
}

function IsBlackList(weaponName)
  for k,v in pairs(blackListedWeapons) do
    if weaponName == v then
      return true
    end
  end

  return false
end