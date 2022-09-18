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
clothe                            = {}
ckothefemaile = {}
activencz = false
clothe = {
			['tshirt_1'] = 4,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 96,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 7,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['glasses_1'] = 3,   ['glasses_2'] = 5,
		}
clothefemale	= 
{
['tshirt_1'] = 77,  ['tshirt_2'] = 3,
			['torso_1'] = 69,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 26,
			['pants_1'] = 27,   ['pants_2'] = 0,
			['shoes_1'] = 42,   ['shoes_2'] = 2,
			['helmet_1'] = 56,  ['helmet_2'] = 2,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['glasses_1'] = 3,   ['glasses_2'] = 5,
}	
		
ESX = nil
local AdminPerks = false
local ShowID = false
local muted = false
local first = false
local time = 0
local disPlayerNames = 50
local ForceToVisible = false
local owned = false
local currentTags = {}
playerDistances = {}

Citizen.CreateThread(function()

		while ESX == nil do
			TriggerEvent("esx:getSharedObject",function(obj)
					ESX = obj
                end)
                
			Citizen.Wait(0)
            PlayerData = ESX.GetPlayerData()

            if first then
                ESX.SetPlayerData('admin',0)
                first = false4
            end
            
        end
        
	end)
	
	
alertstring = false
lastfor = 5
doalert = false
RegisterNetEvent('alert')
announcestring = false
AddEventHandler('alert', function(msg)
	alertstring = msg
	doalert = true
	PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
	AddTextEntry("FACES_WARNH2", "Alert")
	AddTextEntry("QM_NO_0", alertstring)
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if doalert then
			if IsControlJustPressed(13,201) then
				PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1);
				doalert = false
				alertstring = false
			end
			DrawFrontendAlert("FACES_WARNH2", "QM_NO_0", 2, nil, "", 0, 0, false, "FM_NXT_RAC", 1, true, false)
		end
	end
end)



RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded",function(xPlayer)
        PlayerData = xPlayer      
end)
RegisterNetEvent("irsadmin:skin")
AddEventHandler("irsadmin:skin",function()

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin == nil then
          TriggerEvent('skinchanger:loadSkin', {sex = 0})
        --  TriggerServerEvent("bms:tattoo:activateTattooShop2")
        else
          TriggerEvent('skinchanger:loadSkin', skin)
         -- TriggerServerEvent("bms:tattoo:activateTattooShop2")
        end

      end)
        
    end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob",function(job)

        PlayerData.job = job
        
end)

RegisterNetEvent('irs_admin:setEventCoords')
AddEventHandler('irs_admin:setEventCoords', function()
    ESX.TriggerServerCallback('esx_aduty:checkAdmin', function(isAdmin)

        if isAdmin then
            local coords = GetEntityCoords(GetPlayerPed(-1))
            if coords ~= nil then
                TriggerServerEvent('irs_admin:setEventCoords', coords)
            else
                print("Theere was a problem with getting coords")
            end
        end

    end)
end)

RegisterNetEvent("OnDutyHandler")
AddEventHandler("OnDutyHandler",function(skin)

        --[[Citizen.CreateThread(function()
            local model = GetHashKey(skin)
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 2)
        end)]]
        AdminPerks = true
        ShowID = true
        ESX.SetPlayerData('admin',1)
        adminperks()
        ShowPlayerNames()
	--[[	TriggerEvent('skinchanger:getSkin', function(skin)
	if tonumber(skin.sex) == 0 then

				TriggerEvent('skinchanger:loadClothes', skin,clothe)
			


	elseif tonumber(skin.sex) == 1 then

				TriggerEvent('skinchanger:loadClothes',clothefemale)


		end

	end)]]
       -- TriggerServerEvent('DiscordBot:ToDiscord', 'duty', GetPlayerName(PlayerId()), 'OnDuty shod','user', true, source, false)

end)


RegisterNetEvent("OnDutyHandlerStreamer")
AddEventHandler("OnDutyHandlerStreamer",function(skin)
        ESX.SetPlayerData('admin',1)
end)

--[[local tag = true
RegisterNetEvent("toggletag")
AddEventHandler("toggletag",function()
 
 if tag then
 TriggerServerEvent('esx_idoverhead:changeLabelHideStatus', id, true)
 tag = false
 else
 TriggerServerEvent('esx_idoverhead:changeLabelHideStatus', id, false)
 tag = true
 end


end)]]

RegisterNetEvent("OffDutyHandler")
AddEventHandler("OffDutyHandler",function()
      --  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		--		TriggerEvent('skinchanger:loadSkin', skin)
		--	end)
        

        AdminPerks = false
        ShowID = false
		playerDistances = {}
        ESX.SetPlayerData('admin',0)
        adminperks()
        ShowPlayerNames()
   
      --  TriggerServerEvent('DiscordBot:ToDiscord', 'duty', GetPlayerName(PlayerId()), 'OffDuty shod','user', true, source, false)

end)

RegisterNetEvent("OffDutyHandlerStreamer")
AddEventHandler("OffDutyHandlerStreamer",function()
        ESX.SetPlayerData('admin',0)
end)

RegisterNetEvent("OffDutyHandlerForJail")
AddEventHandler("OffDutyHandlerForJail",function()

    ESX.SetPlayerData('admin',0)
    TriggerEvent("OffDutyHandler")
	TriggerEvent('esx_basicneeds:healPlayer')
	TriggerEvent('aduty:removeSuggestions')
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {" [ SYSTEM | IRNRP ] ", "^0Shoma ^1OffDuty ^0Shodid!"}
        })
    TriggerServerEvent('aduty:changeDutyStatus', source)

end)

local rankdict = {
    [1] = "~b~[ SUPPORT ] ~w~",
    [2] = "~b~[ HELPER ] ~w~",
    [3] = "~g~[ SENIOR HELPER ] ~w~",
    [4] = "~g~[ HEAD HELPER ] ~w~",
	[5] = "~y~[ ADMIN]  ~w~",
    [6] = "~y~[ SENIOR ADMIN ] ~w~",
    [7] = "~p~[ HEAD ADMIN ] ~w~",
	[8] = "~p~[ EXECUTIVE ADMIN ] ~w~",
	[9] = "~c~[ ADMIN MANAGEMENT ] ~w~",
    [10] = "~c~[ MODERATOR ] ~w~",
	[11] = "~m~[ MANAGER ] ~w~",
    [12] = "~p~[ OWNER ] ~w~",
	[13] = "~r~[ DEVELOPER ] ~w~"
}
local rankdictdis = {
    [1] = "SUPPORT",
    [2] = "HELPER",
    [3] = "SENIOR HELPER",
    [4] = "HEAD HELPER",
	[5] = "ADMIN",
    [6] = "SENIOR ADMIN",
    [7] = "HEAD ADMIN",
	[8] = "EXECUTIVE ADMIN",
	[9] = "ADMIN MANAGEMENT",
    [10] = "MODERATOR",
	[11] = "MANAGER",
    [12] = "OWNER",
	[13] = "DEVELOPER"
}

RegisterNetEvent('aduty:tagChanger')
AddEventHandler('aduty:tagChanger',function(add)
    

    ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(perm)

        local id = PlayerId()
        local label
		 ESX.SetPlayerData('tag',rankdictdis[perm])
            label = { display = rankdict[perm], height = 1.2, toggle = false, badge = false}
        

        if add then
            TriggerServerEvent('esx_idoverhead:modifyLabel', id, label)
        else
            TriggerServerEvent('esx_idoverhead:removeLabel', id, add)
        end
        

    end)

  
end)

RegisterNetEvent('tpborj')
AddEventHandler('tpborj',function()
   exports.irs_gr:Whitelist(true)
   SetEntityCoords(GetPlayerPed(-1),-75.22,-818.57,326.19)
   exports.irs_gr:Whitelist(false)
end)
RegisterNetEvent("resetpedHandler")
AddEventHandler("resetpedHandler",function(skin)

        Citizen.CreateThread(function()
        local model = GetHashKey(skin)
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 2)
    end)

end)


RegisterNetEvent('irs:ncz')
AddEventHandler('irs:ncz', function(active)
	activencz = active
	if activencz then
		Citizen.CreateThread(function()
			while activencz do
				Wait(0)
				DisableControlAction(0, Keys['R'], true)
				DisableControlAction(0, 24, true) -- Attack
				DisableControlAction(0, 257, true) -- Attack 2
				DisableControlAction(0, 25, true) -- Right click
				DisableControlAction(0, 47, true)  -- Disable weapon
				DisableControlAction(0, 264, true) -- Disable melee
				DisableControlAction(0, 257, true) -- Disable melee
				DisableControlAction(0, 140, true) -- Disable melee
				DisableControlAction(0, 141, true) -- Disable melee
				DisableControlAction(0, 142, true) -- Disable melee
				DisableControlAction(0, 143, true) -- Disable melee
				DisableControlAction(0, 263, true) -- Melee Attack 1
			end
		end)
	end
end)

RegisterNetEvent("changepedHandler")
AddEventHandler("changepedHandler",function(skin)

        Citizen.CreateThread(function()
        local model = GetHashKey(skin)
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 2)
    end)

end)

RegisterNetEvent("armorHandler")
AddEventHandler("armorHandler",function(armor)

        local ped = GetPlayerPed(-1)
        SetPedArmour(ped, armor) 

end)

RegisterNetEvent("aduty:vehiclelicenseHandler")
AddEventHandler("aduty:vehiclelicenseHandler",function(licenseplate)

    local player = GetPlayerPed(-1)
    if (IsPedSittingInAnyVehicle(player)) then
        
        local vehicle = GetVehiclePedIsIn(player, true)
        SetVehicleNumberPlateText(vehicle, licenseplate)
        ESX.ShowNotification("~g~Shomare pelak be: ~o~" .. licenseplate .. "~g~ taghir kard")

    else
        ESX.ShowNotification("~r~~h~Shoma baraye estefade az in command bayad dakhel mashin bashid")
    end

end)

RegisterNetEvent("aduty:setMuteStatus")
AddEventHandler("aduty:setMuteStatus", function(status)
  
  muted = status
  MutePlayer()

end)

RegisterNetEvent("aduty:forceStatus")
AddEventHandler("aduty:forceStatus", function(status)
  
  ForceToVisible = status
  print(ForceToVisible)
  visibility()

end)

RegisterNetEvent("aduty:refuel")
AddEventHandler("aduty:refuel", function()
  
   local ped = GetPlayerPed(-1)

   if IsPedInAnyVehicle(ped) then

        local vehicle = GetVehiclePedIsIn(ped)
        SetVehicleFuelLevel(vehicle, 100.0)

   else

      TriggerEvent("chatMessage", " [ SYSTEM | IRNRP ] ", {255, 0, 0}, "^0Shoma baraye estefade az in command bayad dakhel mashin bashid!")

   end

end)

RegisterNetEvent("aduty:vanish")
AddEventHandler("aduty:vanish", function()
  
   vanish = not vanish
   local ped = GetPlayerPed(-1)

    if vanish then -- activé
    TriggerServerEvent('aduty:toggleTag', GetPlayerServerId(PlayerId()), true)
    SetEntityVisible(ped, false, false)
    ESX.ShowNotification("Character shoma ba movafaghiat ~r~Gheyb ~w~shod")
    else
    TriggerServerEvent('aduty:toggleTag', GetPlayerServerId(PlayerId()), true)
    SetEntityVisible(ped, true, false)
    ESX.ShowNotification("Character shoma ba movafaghiat ~g~Zaher ~w~shod")
    end

end)

RegisterNetEvent("aduty:visibleForce")
AddEventHandler("aduty:visibleForce", function()
  
    local ped = GetPlayerPed(-1)
    SetEntityVisible(ped, true, false)

end)

RegisterNetEvent("aduty:changeShowStatus")
AddEventHandler("aduty:changeShowStatus", function()
  
    if ShowID then

        ShowID = false
        ShowPlayerNames()
        TriggerEvent("chatMessage", " [ SYSTEM | IRNRP ] ", {255, 0, 0}, "^0Shoma halat didan player ha ra ^1Khamosh ^0kardid!")
    
    else
    
        ShowID = true
        ShowPlayerNames()
        TriggerEvent("chatMessage", " [ SYSTEM | IRNRP ] ", {255, 0, 0}, "^0Shoma halat didan player ha ra ^2Roshan ^0kardid!")

    end

end)

RegisterNetEvent('aduty:tag')
AddEventHandler('aduty:tag',function(own)
    owned = own
end)

RegisterNetEvent('aduty:tagChanger')
AddEventHandler('aduty:tagChanger',function(status)
    owned = status
end)


RegisterNetEvent('aduty:returnStatus')
AddEventHandler('aduty:returnStatus', function()
    TriggerServerEvent('aduty:statusHandler', owned)
end)

RegisterNetEvent('aduty:set_tags')
AddEventHandler('aduty:set_tags', function (admins)
    currentTags = admins
end)

RegisterNetEvent("aduty:deleteVehicle")
AddEventHandler("aduty:deleteVehicle", function()
  
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection(4)
    local entity = vehicle
    carModel = GetEntityModel(entity)
    carName = GetDisplayNameFromVehicleModel(carModel)
    NetworkRequestControlOfEntity(entity)
    
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end

    SetEntityAsMissionEntity(entity, true, true)
    
    local timeout = 2000
    while timeout > 0 and not IsEntityAMissionEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end

    if IsVehicleSeatFree(entity, -1) then
        if DoesEntityExist(entity) then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {" [ SYSTEM | IRNRP ] ", "^2 " .. carName .. "^0 ba movafaghiat hazf shod!"}
            })
        end
        
        Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
        
        if (DoesEntityExist(entity)) then 
            DeleteEntity(entity)
        end
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {" [ SYSTEM | IRNRP ] ", "^2 " .. carName .. "^0 dar hale hazer yek ranande dare"}
        })
    end

end)

RegisterNetEvent("aduty:getplateVehicle")
AddEventHandler("aduty:getplateVehicle", function()
  
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection(10)
	
    local entity = vehicle
    
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {" [ SYSTEM | IRNRP ] ", "^2 Pelak : ".. GetVehicleNumberPlateText(vehicle)}
        })


end)

RegisterCommand('flip', function(source)
    ESX.TriggerServerCallback('esx_aduty:checkAdmin', function(isAdmin)

        if isAdmin then

            if ESX.GetPlayerData()['admin'] == 1 then

                local ped = GetPlayerPed(-1)
                if IsPedSittingInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    SetVehicleOnGroundProperly(vehicle)
                else
                    local vehicle = ESX.Game.GetVehicleInDirection(4)
                    if vehicle ~= 0 then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleOnGroundProperly(vehicle)
                    else
                        TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Hich mashini nazdik shoma nist!"}})
                    end
                end
                
            else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!"}})

            end

        else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma admin nistid!"}})

        end

        end)
end, false)

function adminperks()

    Citizen.CreateThread( function()
        while true do
            Citizen.Wait(5000)
            
            if AdminPerks then
                ResetPlayerStamina(PlayerId())
                SetEntityInvincible(GetPlayerPed(-1), true)
                SetPlayerInvincible(PlayerId(), true)
                SetPedCanRagdoll(GetPlayerPed(-1), false)
                ClearPedBloodDamage(GetPlayerPed(-1))
                ResetPedVisibleDamage(GetPlayerPed(-1))
                ClearPedLastWeaponDamage(GetPlayerPed(-1))
                SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
                SetEntityCanBeDamaged(GetPlayerPed(-1), false)
            else
                SetEntityInvincible(GetPlayerPed(-1), false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(GetPlayerPed(-1), true)
                ClearPedLastWeaponDamage(GetPlayerPed(-1))
                SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
                SetEntityCanBeDamaged(GetPlayerPed(-1), true)
            end

        end
        
    end)

end

function visibility()

    Citizen.CreateThread( function()
        while true do
            Citizen.Wait(1000)
            
            if ForceToVisible then
                SetEntityVisible(GetPlayerPed(-1), true, false)
            end

        end
        
    end)

end

Citizen.CreateThread(function()

	while true do
        Wait(10)
            
            if (IsControlPressed(1, 21) and IsControlPressed(1, 38)) then
                
                if time == 0 then

                    time = 3

                    ESX.TriggerServerCallback('esx_aduty:checkAdmin', function(isAdmin)

                        if isAdmin then

                            if ESX.GetPlayerData()['admin'] == 1 then
                            exports.irs_gr:Whitelist(true)
                                local playerPed = GetPlayerPed(-1)
                                local WaypointHandle = GetFirstBlipInfoId(8)
                                if DoesBlipExist(WaypointHandle) then
                                    local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end
                Citizen.CreateThread(function()
	            Citizen.Wait(1000)
	             exports.irs_gr:Whitelist(false)
	            end)
                            ESX.ShowNotification("Shoma Teleport Shodid.")
                                else
                                    ESX.ShowNotification("Markeri baraye teleport shodan vojoud nadarad!")
                                end

                            else

                                TriggerEvent('chat:addMessage', {
                                    color = { 255, 0, 0},
                                    multiline = true,
                                    args = {" [ SYSTEM | IRNRP ] ", "^0Shoma nemitavanid dar halat ^1OffDuty ^0be marker roye map teleport konid!"}
                                })

                            end

                            end

                        end)

             end


        end
        
        while time > 0 do

            Citizen.Wait(1000)

            time = time -1
            
        end
       
		
    end

end)


RegisterCommand('dobject', function(source, args)
    ESX.TriggerServerCallback('esx_aduty:checkAdmin', function(isAdmin)

        if isAdmin then

            if args[1] then
                local coords = GetEntityCoords(GetPlayerPed(-1))
                local object = GetClosestObjectOfType(coords, 10000.0, GetHashKey(args[1]), false, false, false)
                
                if DoesEntityExist(object) then
                    ESX.Game.DeleteObject(object)
                    TriggerEvent('chat:addMessage', {
                        color = { 255, 0, 0},
                        multiline = true,
                        args = {" [ SYSTEM | IRNRP ] ", "Shoma yek ^2" .. args[1] .. "^0 delete kardid!"}
                    })
                else
                    TriggerEvent('chat:addMessage', {
                        color = { 255, 0, 0},
                        multiline = true,
                        args = {" [ SYSTEM | IRNRP ] ", "Hich objecti peyda nashod"}
                    })
                end

            else
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {" [ SYSTEM | IRNRP ] ", "Shoma dar ghesmat esm object chizi varred nakardid"}
                })
            end
           

        end

     end)
end, false)
    
RegisterCommand('mcar', function(source, args)
    ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(aperm)

        if aperm >= 4 then


            ESX.TriggerServerCallback('esx_aduty:checkAduty', function(isAduty)

                if isAduty then

                    if not args[1] then 

                        TriggerEvent('chat:addMessage', {
                            color = { 255, 0, 0},
                            multiline = true,
                            args = {" [ SYSTEM | IRNRP ] ", "Shoma dar ghesmat model mashin chizi vared nakardid!"}
                        })

                        return
                    end

                    if not args[2] then 

                        TriggerEvent('chat:addMessage', {
                            color = { 255, 0, 0},
                            multiline = true,
                            args = {" [ SYSTEM | IRNRP ] ", "Shoma dar ghesmat turbo chizi vared nakardid!"}
                        })

                        return
                    end

                    local turbo = args[2]
                    local model = args[1]
                    local colors = {a = 0, b = 0, c = 0}

                    if args[3] then 

                        colors.a = tonumber(args[3])

                    end

                    if args[4] then 

                        colors.b = tonumber(args[4])

                    end

                    if args[5] then 

                        colors.c = tonumber(args[5])

                    end

                    if turbo == "true" then

                        local playerPed = PlayerPedId()
                        local coords    = GetEntityCoords(playerPed)
                
                        ESX.Game.SpawnVehicle(model, coords, GetEntityHeading(GetPlayerPed(-1)), function(vehicle)
                            TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                            SetVehicleMaxMods(vehicle, true, colors)
                        
                                TriggerEvent('chat:addMessage', {
                                    color = { 255, 0, 0},
                                    multiline = true,
                                    args = {" [ SYSTEM | IRNRP ] ", "^2 " .. model .. "^0 ba ^3turbo ^0spawn shod!"}
                                })
                
                        end)
                
                    elseif turbo == "false" then
                
                        local playerPed = PlayerPedId()
                        local coords    = GetEntityCoords(playerPed)
                
                        ESX.Game.SpawnVehicle(model, coords, GetEntityHeading(GetPlayerPed(-1)), function(vehicle)
                            TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                            SetVehicleMaxMods(vehicle, false, colors)
                                local carModel = GetEntityModel(vehicle)
                                local carName = GetDisplayNameFromVehicleModel(vehicle)
                        
                                TriggerEvent('chat:addMessage', {
                                    color = { 255, 0, 0},
                                    multiline = true,
                                    args = {" [ SYSTEM | IRNRP ] ", "^2 " .. model .. "^0 spawn shod!"}
                                })
                
                        end)

                    else

                        TriggerEvent('chat:addMessage', {
                            color = { 255, 0, 0},
                            multiline = true,
                            args = {" [ SYSTEM | IRNRP ] ", "^2 Shoma dar ghesmat turbo statement eshtebahi vared kardid!"}
                        })
                
                    end
                    
                else
    
                TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!"}})
    
                end
        
            end)

        else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid!"}})

        end

        end)
end, false)

RegisterCommand('alock', function(source)
    ESX.TriggerServerCallback('esx_aduty:checkAdmin', function(isAdmin)

        if isAdmin then

            ESX.TriggerServerCallback('esx_aduty:checkAduty', function(isAduty)

                if isAduty then

                    if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
                        local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                        vehicleLabel = GetLabelText(vehicleLabel)
                        local lock = GetVehicleDoorLockStatus(vehicle)
        
                        if lock == 1 or lock == 0 then
                            SetVehicleDoorShut(vehicle, 0, false)
                            SetVehicleDoorShut(vehicle, 1, false)
                            SetVehicleDoorShut(vehicle, 2, false)
                            SetVehicleDoorShut(vehicle, 3, false)
                            SetVehicleDoorsLocked(vehicle, 2)
                            PlayVehicleDoorCloseSound(vehicle, 1)
                            local NetId = NetworkGetNetworkIdFromEntity(vehicle)
                            TriggerServerEvent("esx_vehiclecontrol:sync", NetId, true)
                            ESX.ShowNotification('You have ~r~locked~s~ your ~y~'..vehicleLabel..'~s~.')
                        elseif lock == 2 then
                            SetVehicleDoorsLocked(vehicle, 1)
                            PlayVehicleDoorOpenSound(vehicle, 0)
                            local NetId = NetworkGetNetworkIdFromEntity(vehicle)
                            TriggerServerEvent("esx_vehiclecontrol:sync", NetId, false)
                            ESX.ShowNotification('You have ~g~unlocked~s~ your ~y~'..vehicleLabel..'~s~.')
                        end
                        
                    else
        
                        local vehicle = ESX.Game.GetVehicleInDirection(4)
                        local lock = GetVehicleDoorLockStatus(vehicle)
        
                        if vehicle ~= 0 then
        
                            local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                            vehicleLabel = GetLabelText(vehicleLabel)
        
                            if lock == 1 or lock == 0 then
                                SetVehicleDoorShut(vehicle, 0, false)
                                SetVehicleDoorShut(vehicle, 1, false)
                                SetVehicleDoorShut(vehicle, 2, false)
                                SetVehicleDoorShut(vehicle, 3, false)
                                SetVehicleDoorsLocked(vehicle, 2)
                                PlayVehicleDoorCloseSound(vehicle, 1)
                                local NetId = NetworkGetNetworkIdFromEntity(vehicle)
                            TriggerServerEvent("esx_vehiclecontrol:sync", NetId, true)
                                ESX.ShowNotification('You have ~r~locked~s~ your ~y~'..vehicleLabel..'~s~.')
                            elseif lock == 2 then
                                SetVehicleDoorsLocked(vehicle, 1)
                                PlayVehicleDoorOpenSound(vehicle, 0)
                                local NetId = NetworkGetNetworkIdFromEntity(vehicle)
                                TriggerServerEvent("esx_vehiclecontrol:sync", NetId, false)
                                ESX.ShowNotification('You have ~g~unlocked~s~ your ~y~'..vehicleLabel..'~s~.')
                            end
        
                        else
        
                            ESX.ShowNotification("~r~~h~Hich mashini nazdik shoma nist!")
        
                        end
                        
                    end
                    
                else
    
                TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!"}})
    
                end
        
            end)

        else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma admin nistid!"}})

        end

    end)
end, false)

--gang
RegisterCommand('creategang', function(source, args)
    ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(aperm)

        if aperm >= 9 then


            ESX.TriggerServerCallback('esx_aduty:checkAduty', function(isAduty)

                if args[1] and tonumber(args[2]) then
                    TriggerServerEvent('gangs:registerGang', args[1], args[2])
                else
                    TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Parameter haye vared shode sahih nist!"}})
                end
        
            end)

        else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid!"}})

        end

    end)
end, false)

RegisterCommand('savegangs', function(source, args)
    ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(aperm)

        if aperm >= 9 then


            ESX.TriggerServerCallback('esx_aduty:checkAduty', function(isAduty)

                TriggerServerEvent('gangs:saveGangs')
        
            end)

        else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid!"}})

        end

    end)
end, false)

RegisterCommand('changegangdata', function(source, args)
    ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(aperm)

        if aperm >= 9 then


            ESX.TriggerServerCallback('esx_aduty:checkAduty', function(isAduty)

                ESX.TriggerServerCallback('esx_aduty:doesGangExist', function(GangExist)

                    local playerPos = GetEntityCoords(GetPlayerPed(-1))
                    if GangExist then
                        
                        if args[2] == 'blip' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = playerPos.z + 0.5 }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'armory' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = (playerPos.z - 1.0) }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'locker' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = (playerPos.z - 1.0) }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'boss' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = (playerPos.z - 1.0) }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'veh' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = (playerPos.z - 1.0) }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'vehdel' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = (playerPos.z - 1.0) }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'search' then
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], nil)
					 elseif args[2] == 'gps' then
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], nil)
                        elseif args[2] == 'vehspawn' then
                            local Pos     = { x = playerPos.x, y = playerPos.y, z = playerPos.z , a = GetEntityHeading(GetPlayerPed(-1)) }
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], Pos)
                        elseif args[2] == 'expire' then
                            if tonumber(args[3]) then
                                TriggerServerEvent('gangs:changeGangData', args[1], args[2], args[3])
                            else
                                ESX.ShowNotification("~h~Shoma dar ghesmat roz faghat mitavanid adad vared konid")
                            end
                        elseif args[2] == 'bulletproof' then
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], nil)
							elseif args[2] == 'log' then
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], nil)
					    elseif args[2] == 'slot' then
                            TriggerServerEvent('gangs:changeGangData', args[1], args[2], args[3])
                        else
                            ESX.ShowNotification("~h~Option vared shode eshtebah ast")
                        end

                    else
                       ESX.ShowNotification("~h~Gang vared shode eshtebah ast")
                    end
            
                end, args[1], 6)
        
            end)

        else

            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true ,args = {" [ SYSTEM | IRNRP ] ", "^0Shoma dastresi kafi baraye estefade az in dastor ra nadarid!"}})

        end

    end)
end, false)
-- gang
RegisterNetEvent("aduty:addSuggestions")
AddEventHandler("aduty:addSuggestions",function()

        TriggerEvent('chat:addSuggestion', '/aduty', 'Jahat on/off duty shodan admini', {
        })

        TriggerEvent('chat:addSuggestion', '/changeped', 'Jahat avaz kardan ped', {
            { name="EsmPed", help="Esm ped mored nazar" }
        })
		
		TriggerEvent('chat:addSuggestion', '/deletecar', 'Haz Kardan Yek Mashin Az Database', {
            { name="Pelak", help="Pelak Mashin" }
        })

        TriggerEvent('chat:addSuggestion', '/resetped', 'Jahat reset kardan ped be halat admini', {
        })

        TriggerEvent('chat:addSuggestion', '/w', 'Jahat ferestadan whisper admini', {
            { name="Peygham", help="Peygham mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/livery', 'Jahat avaz kardan livery mashin', {
            { name="ID", help="ID livery mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/alock', 'Jahat baz ya baste kardan dare mashini ke darid be an negah mikonid', {
        })

        TriggerEvent('chat:addSuggestion', '/getin', 'Jahat raftan be dakhel mashin', {
        })

        TriggerEvent('chat:addSuggestion', '/setarmor', 'Jahat avaz kardan armor player', {
            { name="ID", help="ID player mored nazar" },
            { name="Armor", help="Meghdar armor beyn 0-100" }
        })

        TriggerEvent('chat:addSuggestion', '/fineoffline', 'Jarime kardan player be sorat offline', {
            { name="Esm", help="Esm daghigh player ba horof bozorg va kochik" },
            { name="Meghdar", help="Meghdar jarime" },
            { name="Dalil", help="Dalil jarime" }
        })

        TriggerEvent('chat:addSuggestion', '/changegangdata', 'Taqir dadan option haye gang', {
            { name="GangName", help="Esme Gang" },
	        { name="Option", help="Entekhabe option:(blip, armory, locker, boss, veh, vehdel, vehspawn, expire, search, bulletproof,slot,log,gps)" },
        })

        TriggerEvent('chat:addSuggestion', '/fine', 'Jarime kardan player be sorat online', {
            { name="ID", help="ID player mored nazar" },
            { name="Meghdar", help="Meghdar jarime" },
            { name="Dalil", help="Dalil jarime" }
        })

        TriggerEvent('chat:addSuggestion', '/ajailoffline', 'Admin jail kardan player be sorat offline', {
            { name="Esm", help="Steam HEX" },
            { name="Zaman", help="Zaman admin jail be daghighe" },
            { name="Dalil", help="Dalil admin jail" }
        })

        TriggerEvent('chat:addSuggestion', '/ajail', 'Admin jail kardan player be sorat online', {
            { name="ID", help="ID player mored nazar" },
            { name="Zaman", help="Zaman admin jail be daghighe" },
            { name="Dalil", help="Dalil admin jail" }
        })

        TriggerEvent('chat:addSuggestion', '/aunjail', 'Admin unjail kardan player be sorat online', {
            { name="ID", help="ID player mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/money', 'Taghir dadan pol player', {
            { name="ID", help="ID player mored nazar" },
            { name="NoePool", help="Noe pool ebarat ast az cash/bank/black" },
            { name="Meghdar", help="Meghdar pool mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/plate', 'Avaz kardan shomare pelak mashin', {
            { name="Pelak", help="Pelak mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/a', 'Ferestadan adminchat', {
            { name="Peygham", help="Peygham mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/kick', 'Kick kardan player', {
            { name="ID", help="ID player mored nazar" },
            { name="Dalil", help="Dalil kick shodan" }
        })

        TriggerEvent('chat:addSuggestion', '/mute', 'Jahat mute kardan player', {
            { name="ID", help="ID player mored nazar" },
            { name="Dalil", help="Dalil mute shodan player" }
        })

        TriggerEvent('chat:addSuggestion', '/unmute', 'Jahat unmute kardan player', {
            { name="ID", help="ID player mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/toggleid', 'Jahat toggle kardan halat didan ID playerha', {
        })

        TriggerEvent('chat:addSuggestion', '/resetaccount', 'Jahat reset kardan account player', {
            { name="HEX", help="Hex Player Mored Nazar" },
            { name="Dalil", help="Dalil reset kardan account" }
        })

        TriggerEvent('chat:addSuggestion', '/disband', 'Jahat disband kardan family', {
            { name="ESM", help="Esm family mored nazar" },
            { name="Dalil", help="Dalil disband kardan gang" }
        })

        TriggerEvent('chat:addSuggestion', '/ban', 'Ban kardan player ba ID', {
            { name="ID", help="ID player mored nazar" },
            { name="ZAMAN", help="Zaman ra be roz vared konid (0 = permanent ban)" },
            { name="DALIL", help="Dalil ban shodan player ra vared konid" },
        })

        TriggerEvent('chat:addSuggestion', '/unban', 'Unban kardan player ba esm IC', {
            { name="name", help="Esm IC player mored nazar" },
        })

        TriggerEvent('chat:addSuggestion', '/charmenu', 'Reload player skin', {
            { name="Player", help="Player ID" },
        })

        TriggerEvent('chat:addSuggestion', '/vanish', 'baraye avaz kardan vaziat dide shodan', {
        })  

        TriggerEvent('chat:addSuggestion', '/atoggle', 'toggle kardan tag admini baraye hame', {
        })

        TriggerEvent('chat:addSuggestion', '/owntoggle', 'toggle kardan tag admini baraye khod', {
        })

        TriggerEvent('chat:addSuggestion', '/creategang', 'Sakhtan Gang, Hasas be Horofe bozorg va Kochak', {
            { name="GangName", help="Esme Gang" },
            { name="Expire", help="Tedad Roz etebare Gang ra Vared konid" },
        })

        TriggerEvent('chat:addSuggestion', '/savegangs', 'Zakhire Kardane Gang\'e Sakhte Shode', {})

        TriggerEvent('chat:addSuggestion', '/spect', 'Jahat spect kardan player mored nazar', {
            { name="ID", help="ID player mored nazar" }
        })

        TriggerEvent('chat:addSuggestion', '/togglenotify', 'Jahat toggle kardan notification haye anticheat', {
        })
end)

RegisterNetEvent("aduty:removeSuggestions")
AddEventHandler("aduty:removeSuggestions",function()

        TriggerEvent('chat:removeSuggestion', '/aduty')

        TriggerEvent('chat:removeSuggestion', '/livery')

        TriggerEvent('chat:removeSuggestion', '/changeped')

        TriggerEvent('chat:removeSuggestion', '/resetped')

        TriggerEvent('chat:removeSuggestion', '/w')

        TriggerEvent('chat:removeSuggestion', '/setarmor')

        TriggerEvent('chat:removeSuggestion', '/fineoffline')

        TriggerEvent('chat:removeSuggestion', '/fine')

        TriggerEvent('chat:removeSuggestion', '/ajailoffline')

        TriggerEvent('chat:removeSuggestion', '/ajail')

        TriggerEvent('chat:removeSuggestion', '/aunjail')

        TriggerEvent('chat:removeSuggestion', '/money')

        TriggerEvent('chat:removeSuggestion', '/plate')

        TriggerEvent('chat:removeSuggestion', '/a')

        TriggerEvent('chat:removeSuggestion', '/kick')

        TriggerEvent('chat:removeSuggestion', '/mute')

        TriggerEvent('chat:removeSuggestion', '/unmute')

        TriggerEvent('chat:removeSuggestion', '/toggleid')

        TriggerEvent('chat:removeSuggestion', '/resetaccount')

        TriggerEvent('chat:removeSuggestion', '/disband')

        TriggerEvent('chat:removeSuggestion', '/vanish')

        TriggerEvent('chat:removeSuggestion', '/dv2')

        TriggerEvent('chat:removeSuggestion', '/charmenu')

        TriggerEvent('chat:removeSuggestion', '/savegangs')

        TriggerEvent('chat:removeSuggestion', '/creategang')

        TriggerEvent('chat:removeSuggestion', '/alock')

        TriggerEvent('chat:removeSuggestion', '/getin')

        TriggerEvent('chat:removeSuggestion', '/owntoggle')

        TriggerEvent('chat:removeSuggestion', '/changegangdata')

        TriggerEvent('chat:removeSuggestion', '/savegangs')

        TriggerEvent('chat:removeSuggestion', '/creategang')

        TriggerEvent('chat:removeSuggestion', '/spect')
        
        TriggerEvent('chat:removeSuggestion', '/togglenotify')

        TriggerEvent('chat:removeSuggestion', '/ban')

        TriggerEvent('chat:removeSuggestion', '/banoffline')

        TriggerEvent('chat:removeSuggestion', '/unban')

end)

function SetVehicleMaxMods(vehicle, turbo, colors)

        local props = {
            modEngine       =   3,
            modBrakes       =   2,
            windowTint      =   1,
            modArmor        =   4,
            modTransmission =   2,
            modSuspension   =   -1,
            modTurbo        =   turbo,
            modXenon     = true,
            color1 = colors.a,
            color2 = colors.b,
            pearlescentColor = colors.c
        }
            
    ESX.Game.SetVehicleProperties(vehicle, props)

end

function MutePlayer()

    Citizen.CreateThread(function()

		while muted do

			DisableControlAction(0, Keys['N'], true)

            Citizen.Wait(0)
            
		end

	end)

end

function ShowPlayerNames()
Citizen.CreateThread(function()
        while true do
            if ShowID then

                for id = 0, 255 do
                    if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                        playerDistances[id] = distance
                    end
                end

            end
            Citizen.Wait(5000)
        end
      end)
    
    Citizen.CreateThread(function()
        Wait(200)
        while true do
            if ShowID then


                    for id = 0, 255 do 
                        if NetworkIsPlayerActive(id) then
                            if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                                if (playerDistances[id] < 50) then
                                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                                        DrawText3D(x2, y2, z2+1.5, GetPlayerServerId(id) .. " | " .. GetPlayerName(id), 255,255,255)
                                end  
                            end
                        end
                    end

            end
            Citizen.Wait(0)
        end
    end)


    

    end


function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.80*scale)
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

Citizen.CreateThread(function()
    TriggerEvent('chat:removeSuggestion', '/report')
    TriggerEvent('chat:removeSuggestion', '/cancelreport')
    TriggerEvent('chat:addSuggestion', '/report', 'Porsidan Doal Ya Gozaresh Player', {
        { name="Noe Report", help="0 = Soal, 1 = Gozaresh Ghanoun Shekani" },
        { name="Matn", help="Matn Gozaresh Ya Soal" },
    })
    TriggerEvent('chat:addSuggestion', '/cancelreport', 'Laghv Kardan Report Ghabl', {
    })
	TriggerEvent('chat:addSuggestion', '/rd', 'Char Dar Report', {
    })
end)



local elements = {}
local lastlocation = nil
table.insert(elements, { label = 'Last location' })

--[[
    TELEPORT MENU COORDINATES
    Below you have lines of code that you need to change based on your use
    LABEL - label of location that you can find in menu
    OTHER lines are the actual coordinates
]]--

table.insert(elements, { label = 'PD', x = 425.1, y = -979.5, z = 30.7  })
--table.insert(elements, { label = 'Airport Los Santos', x = -1037.51, y = -2963.24, z = 13.95 })
--table.insert(elements, { label = 'Airport Sandy Shores', x = 1718.47, y = 3254.40, z = 41.14})
table.insert(elements, { label = 'Balatarin Noghte', x = 501.76, y = 5604.28, z = 797.91})
--table.insert(elements, { label = 'Vinewood Sign', x = 663.41, y = 1217.21, z = 322.94})
table.insert(elements, { label = 'Benny\'s', x = -210.94, y = -1322.61, z = 30.89 })
table.insert(elements, { label = 'Mechanici', x = -336.19, y = -133.28, z = 39.1 })
table.insert(elements, { label = 'Borj Haj Hamid',  x = -75.20, y = -818.95, z = 326.18 })

--[[
    TELEPORT MENU LOCALE
    You can change notification messages based on your language
]]--

local Locale = {
    ['teleported']  = 'You have teleported to ~b~',
    ['teleported_last']  = 'You have teleported to ~r~Last Location',
    ['teleported_last_empty']  = 'You didn\'t visit any location with this menu.',
}

RegisterNetEvent('tpmenu:open')
AddEventHandler('tpmenu:open', function()
    ESX.UI.Menu.CloseAll()					--Close everything ESX.Menu related	
    
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'tpmenu',
        {
            title    = 'Teleport menu',
            align    = 'bottom-right',
            elements = elements
        },
        function(data, menu)						--on data selection
            if data.current.label == "Last location" then
                if lastlocation ~= nil then  
                    ESX.Game.Teleport(PlayerPedId(), lastlocation) 
                    ESX.ShowNotification(Locale['teleported_last'])
                else 
                    ESX.ShowNotification(Locale['teleported_last_empty'])
                end
            else
                lastlocation = GetEntityCoords(GetPlayerPed(-1))
                local coords = { x = data.current.x,  y = data.current.y, z = data.current.z}
                ESX.Game.Teleport(PlayerPedId(), coords)
                ESX.ShowNotification(Locale['teleported'] .. data.current.label)
            end
            menu.close()							--close menu after selection
          end,
          function(data, menu)
            menu.close()
          end
        )
    
end)

--AdminArea---
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

---------------------------------
--- Admin Area, Made by FAXES ---
---------------------------------

--- Config ---
misTxtDis = "~r~~h~Dar yek mantaghe az map RP pause ast lotfan vared mantaghe nashavid." -- Use colors from: https://gist.github.com/leonardosnt/061e691a1c6c0597d633

--- Code ---
local blips = {}
local coordsformarker = {}
function missionTextDisplay(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end
alredypause = true
RegisterNetEvent('Fax:AdminAreaSet')
AddEventHandler("Fax:AdminAreaSet", function(blip, s)
    if s ~= nil then
        src = s
        coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    else
        coords = blip.coords
    end 
    coordsformarker[blip.index] =  coords
    if not blips[blip.index] then
        blips[blip.index] = {}
    end

    if not givenCoords then
        TriggerServerEvent('AdminArea:setCoords', tonumber(blip.index), coords)
    end

    blips[blip.index]["blip"] = AddBlipForCoord(coords.x, coords.y, coords.z)
    blips[blip.index]["radius"] = AddBlipForRadius(coords.x, coords.y, coords.z, blip.radius)
    SetBlipSprite(blips[blip.index].blip, blip.id)
    SetBlipAsShortRange(blips[blip.index].blip, true)
    SetBlipColour(blips[blip.index].blip, blip.color)
    SetBlipScale(blips[blip.index].blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blip.name)
    EndTextCommandSetBlipName(blips[blip.index].blip)
    blips[blip.index]["coords"] = coords
    blips[blip.index]["radius2"] = blip.radius
    SetBlipAlpha(blips[blip.index]["radius"], 80)
    SetBlipColour(blips[blip.index]["radius"], blip.color)

    missionTextDisplay(misTxtDis, 8000)
	blips[blip.index]["active"] = true
	while blips[blip.index]["active"] do
	Wait(0)
	if blips[blip.index] ~= nil then
	local coords = GetEntityCoords(GetPlayerPed(-1))
    local coords2 = blips[blip.index]["coords"]
    local distance = math.floor(GetDistanceBetweenCoords(coords.x, coords.y, coords.z, coords2.x, coords2.y, coords2.z,1))
	if distance > blips[blip.index]["radius2"] - 1 then
	DrawMarker(28, blips[blip.index]["coords"], 0.0, 0.0, 0.0, 0, 0.0, 0.0, blip.radius, blip.radius, blip.radius, 0,0,0, 255, false, true, 2, false, false, false, false)
	else
	DrawMarker(28, blips[blip.index]["coords"], 0.0, 0.0, 0.0, 0, 0.0, 0.0, blip.radius, blip.radius, blip.radius, 255,255,255, 100, false, true, 2, false, false, false, false)
	end
	end
	end
end)



RegisterNetEvent('Fax:AdminAreaClear')
AddEventHandler("Fax:AdminAreaClear", function(blipID)
    if blips[blipID] then
	blips[blipID]["active"] = false
        RemoveBlip(blips[blipID].blip)
        RemoveBlip(blips[blipID].radius)
        blips[blipID] = nil
        missionTextDisplay("RP Dar mantaghe ~o~Admin Area(" .. blipID .. ")~r~ unpause ~w~shod!", 5000)
    else
        print("There was a issue with removing blip: " .. tostring(blipID))
    end
end)
-------------weapback---------------------
-- this script puts certain large weapons on a player's back when it is not currently selected but still in there weapon wheel

-- by: minipunch

-- originally made for USA Realism RP (https://usarrp.net)



-- Add weapons to the 'compatable_weapon_hashes' table below to make them show up on a player's back (can use GetHashKey(...) if you don't know the hash) --
ESX                           = nil
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

local attaches = {
  backbone = false,
  belt = false
}

local player = PlayerId()
local SETTINGS = {

    back_bone = 24816,

    x = 0.190,

    y = -0.15,

    z = 0.01,

    x_rotation = 0.0,

    y_rotation = -323.5,

    z_rotation = 0.0,

    compatable_weapon_hashes = {

        ["w_sg_sawnoff"] = 2017895192,

        -- launchers:

        ["w_lr_firework"] = 2138347493,

        -- sniper rifles:

        ["w_sr_sniperrifle"] = 100416529,

        -- assault rifles:

        ["w_ar_carbinerifle"] = -2084633992,

        ["w_ar_assaultrifle"] = -1074790547,

        ["w_ar_specialcarbine"] = -1063057011,

        ["w_ar_bullpuprifle"] = 2132975508,

        ["w_ar_advancedrifle"] = -1357824103,

        -- shotguns:

        ["w_sg_assaultshotgun"] = -494615257,

        ["w_sg_bullpupshotgun"] = -1654528753,

        ["w_sg_pumpshotgun"] = 487013001,

        ["w_ar_musket"] = -1466123874,

        ["w_sr_heavysniper"] = 205991906,

         -- sub machine guns:

         ["w_sb_microsmg"] = 324215364,
         
         ["w_sb_pdw"] = 171789620,

         ["w_sb_assaultsmg"] = -270015777,

         ["w_sb_smg"] = 736523883,

         ["w_sb_gusenberg"] = 1627465347,

         ["w_sb_combatpdw"] = 2023061218

    }

}



local attached_weapons = {}



Citizen.CreateThread(function()
  while true do

      local me = PlayerPedId()
      local inAnyVehicle = IsPedInAnyVehicle(me)
      ---------------------------------------

      -- attach if player has large weapon --

      ---------------------------------------

      for wep_name, wep_hash in pairs(SETTINGS.compatable_weapon_hashes) do

          if HasPedGotWeapon(me, wep_hash, false) then

            if not inAnyVehicle then
              if not attached_weapons[wep_name] and not isHolding(GetSelectedPedWeapon(me)) then                
                if wep_name == "w_sb_microsmg" and not attaches.belt then
                  attaches.belt = true
                  AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x-0.26, SETTINGS.y+0.15, SETTINGS.z-0.22, 90.0, 60.0, 140.0, isMeleeWeapon(wep_name))
                elseif not attaches.backbone then
                  attaches.backbone = true
                  AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x, SETTINGS.y, SETTINGS.z, SETTINGS.x_rotation, SETTINGS.y_rotation, SETTINGS.z_rotation, isMeleeWeapon(wep_name))
                end
              end
            else
              if not attached_weapons[wep_name] and isHolding(GetSelectedPedWeapon(me)) and not IsPlayerFreeAiming(player) then                
                if wep_name == "w_sb_microsmg" and not attaches.belt then
                  attaches.belt = true
                  AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x-0.26, SETTINGS.y+0.15, SETTINGS.z-0.22, 90.0, 60.0, 140.0, isMeleeWeapon(wep_name))
                elseif not attaches.backbone then
                  attaches.backbone = true
                  AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x, SETTINGS.y, SETTINGS.z, SETTINGS.x_rotation, SETTINGS.y_rotation, SETTINGS.z_rotation, isMeleeWeapon(wep_name))
                end
              end
            end

          end

      end

      --------------------------------------------

      -- remove from back if equipped / dropped --

      --------------------------------------------

      for name, attached_object in pairs(attached_weapons) do

          -- equipped? delete it from back:
         
          local weaponEquiped = HasPedGotWeapon(me, attached_object.hash, false)

          if GetSelectedPedWeapon(me) == attached_object.hash or not weaponEquiped then -- equipped or not in weapon wheel

            if not inAnyVehicle then
              local netid = NetworkGetNetworkIdFromEntity(attached_object.handle)
              TriggerServerEvent('weapBack:removeWeapon', attached_object.hash)
              ESX.Game.DeleteObject(attached_object.handle)
              
              if attached_object.hash == 324215364 then
                attaches.belt = false
              else
                attaches.backbone = false
              end
  
              attached_weapons[name] = nil
            else
              if IsPlayerFreeAiming(player) or not weaponEquiped then
                local netid = NetworkGetNetworkIdFromEntity(attached_object.handle)
                TriggerServerEvent('weapBack:removeWeapon', attached_object.hash)
                ESX.Game.DeleteObject(attached_object.handle)
                
                if attached_object.hash == 324215364 then
                  attaches.belt = false
                else
                  attaches.backbone = false
                end
    
                attached_weapons[name] = nil
              end
            end
           
          end

      end

   Citizen.Wait(500)

  end

end)

RegisterNetEvent('weapBack:removeWeapon')
AddEventHandler('weapBack:removeWeapon', function(netID)
    if not NetworkDoesNetworkIdExist(netID) then
      return
    end
    local object = NetworkGetEntityFromNetworkId(netID)
    local hash = GetEntityModel(object)
    -- print("Delete hash: " .. hash)
    -- if hash == 324215364 then
    --   attaches.belt = false
    -- else
    --   attaches.backbone = false
    -- end

    if DoesEntityExist(object) then
      ESX.Game.DeleteObject(object)
    end
end)

function AttachWeapon(attachModel,modelHash,boneNumber,x,y,z,xR,yR,zR, isMelee)

	local bone = GetPedBoneIndex(PlayerPedId(), boneNumber)

	RequestModel(attachModel)

	while not HasModelLoaded(attachModel) do

		Wait(100)

	end

  attached_weapons[attachModel] = {

    hash = modelHash,
    handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)

  }

  local networkID = NetworkGetNetworkIdFromEntity(attached_weapons[attachModel].handle)
  TriggerServerEvent('weapBack:addWeapon', attached_weapons[attachModel].hash, networkID)

  if isMelee then x = 0.11 y = -0.14 z = 0.0 xR = -75.0 yR = 185.0 zR = 92.0 end -- reposition for melee items

  if attachModel == "prop_ld_jerrycan_01" then x = x + 0.3 end

  AttachEntityToEntity(attached_weapons[attachModel].handle, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
  SetModelAsNoLongerNeeded(attachModel)

end

function isMeleeWeapon(wep_name)

    if wep_name == "prop_golf_iron_01" then

        return true

    elseif wep_name == "w_me_bat" then

        return true

    elseif wep_name == "prop_ld_jerrycan_01" then

      return true

    else

        return false

    end

end

function isHolding(hash)
  for wep_name, wep_hash in pairs(SETTINGS.compatable_weapon_hashes) do
    if hash == wep_hash then
      return true
    end
  end

  return false
end
