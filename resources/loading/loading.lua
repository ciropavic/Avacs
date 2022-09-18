local guiEnabled = false
local myIdentity = {}
local needRegister = false
ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function EnableGui(enable)
    SetNuiFocus(enable, enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end

function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

function showLoadingPromt(label, time)
    Citizen.CreateThread(function()
        BeginTextCommandBusyString(tostring(label))
        EndTextCommandBusyString(3)
        Citizen.Wait(time)
        RemoveLoadingPrompt()
    end)
end

function loadToGround()
	-- TriggerServerEvent('spawn:playerLoaded')
	-- TriggerEvent('spawn:playerLoaded')
	TriggerServerEvent('getSkin')
	pos = GetEntityCoords(GetPlayerPed(-1))
    DoScreenFadeIn(500)
    Citizen.Wait(500)
    cam222 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 215.88,-976.81,301.43, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam222, pos.x,pos.y,pos.z+10)
    SetCamActiveWithInterp(cam222, cam123, 9000, true, true)
    Citizen.Wait(9000)
	pos = GetEntityCoords(GetPlayerPed(-1))
    cam333 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x,pos.y,pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam333, pos.x,pos.y,pos.z+2)
    SetCamActiveWithInterp(cam333, cam222, 9000, true, true)
    Citizen.Wait(9000)
    PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
    RenderScriptCams(false, true, 500, true, true)
    PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    Citizen.Wait(500)
    SetCamActive(cam123, false)
    DestroyCam(cam123, true)
    IsChoosing = false
    DisplayHud(true)
    DisplayRadar(true)
	SwitchInPlayer(PlayerPedId())
	exports.PERSIANPIXEL_AC:SetPlayerVisible(true)
	local timer = GetGameTimer()
	while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
		Wait(1000)
	end
	TriggerEvent('esx:restoreLoadout')
	--TriggerEvent('streetlabel:changeLoadStatus', true)
	TriggerEvent('esx_voice:changeLoadStatus', true)
	TriggerEvent('esx_status:setLastStatsirs')
	--TriggerServerEvent('esx_rack:loaded')
	Wait(2000)
	DestroyCam(cam123, true)
	DestroyCam(cam222, true)
	DestroyCam(cam333,true)
	local firstSpawn = true
	

		if firstSpawn then
			firstSpawn = false
			ESX.TriggerServerCallback('getSkin', function(skin)
				if skin then
			
					
					TriggerEvent('esx_voice:loaded')
				else
					
					TriggerEvent("showRegisterMenu")
				end
			end)
		end
		SetTimecycleModifier('default')
    TriggerEvent('es_admin:freezePlayer', false)
	TriggerEvent('esx_jail:CheckForJail')
	TriggerEvent('showStatus')
	TriggerEvent('InteractSound_CL:changestatus')
	ESX.SetPlayerData('IsPlayerLoaded', 1)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin == nil then
          TriggerEvent('skinchanger:loadSkin', {sex = 0})
       
        else
          TriggerEvent('skinchanger:loadSkin', skin)
        
        end

      end)
end

function check()
	
	-- ToggleSound(true)
	SetManualShutdownLoadingScreenNui(true)
	if not IsPlayerSwitchInProgress() then
		exports.PERSIANPIXEL_AC:SetPlayerVisible(false)
		--SwitchOutPlayer(PlayerPedId(), 32, 1)	
    end	
    --while GetPlayerSwitchState() ~= 5 do
   --     Citizen.Wait(0)
   -- end
	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui()
	cam123 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 331.28,-1992.01,194.29, 350.00,0.00,150.00, 100.00, false, 0)
    SetCamActive(cam123, true)
    RenderScriptCams(true, false, 1, true, true)
	showLoadingPromt("PM_WAIT", 800000)
	
    ESX.TriggerServerCallback('esx_policejob:getIcName', function(PlayerName)
	print(PlayerName)
		if PlayerName == true then
		Wait(4000)
		showLoadingPromt("PM_WAIT", 0)
		EnableGui(true)
		Wait(4000)
	--	
		else
		
        TriggerEvent('es_admin:freezePlayer', false)
		showLoadingPromt("PM_WAIT", 0)
		--EnableGui(true)
		loadToGround()
		TriggerEvent('es_admin:freezePlayer', false)			
			
		end
							
		end)


end

RegisterNetEvent('registerForm')
AddEventHandler('registerForm', function(bool)
needRegister = bool
end)

RegisterNetEvent("showRegisterForm")
AddEventHandler("showRegisterForm", function()
  EnableGui(true)
end)

RegisterNUICallback('register', function(data)
	local player = {}
	player.playerName 	= data.name ..'_'.. data.family
	player.dateofbirth 	= data.dateofbirth
	ESX.TriggerServerCallback('nameAvalibity' , function(avalible)
	if data.name:find(" ") or data.family:find(" ") then
			SendNUIMessage({
				action = 'notification',
				message= 'Dadash Space Nazan!'
			})
    else
		if avalible then
			TriggerServerEvent('db:updateUserName', player.playerName , player.dateofbirth)
			TriggerServerEvent('es:newName', player.playerName)
			EnableGui(false)
			Wait (500)
			loadToGround()
		else
			
			SendNUIMessage({
				action = 'notification',
				message= 'In moshakhasat qablan sabt shode, lotfan dobare emtehan konid!'
			})
			
		end
		end
	end ,player.playerName)
end)

Citizen.CreateThread(function()
    Wait(3000)
	check()
	
end)


	
Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 18, guiEnabled) -- Enter
            DisableControlAction(0, 322, guiEnabled) -- ESC
			DisableControlAction(0, 32, guiEnabled) -- W
			DisableControlAction(0, 34, guiEnabled) -- A
			DisableControlAction(0, 31, guiEnabled) -- S
			DisableControlAction(0, 30, guiEnabled) -- D
        end
		Citizen.Wait(1000)
	end
end)
