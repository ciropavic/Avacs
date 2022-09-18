
ESX                           = nil
PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end
    
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end 

    PlayerData = ESX.GetPlayerData()
end) 

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
 
    PlayerData.job = job
	
end)
Citizen.CreateThread(function()
	while true do
	local name
	local ass
	Citizen.Wait(1000)
	--print(ESX.GetPlayerData()['admin'])
	--print(ESX.GetPlayerData()['tag'])
	if ESX.GetPlayerData()['admin'] == 1 then
	name = ESX.GetPlayerData()['tag']
	ass = "admin"
	else
	if PlayerData.job ~= nil then
	if PlayerData.job.name  == "police" then
	name = "Police"
	ass = "lspd"
	elseif PlayerData.job.name  == "taxi" then
	name = "TAXI"
	ass = "taxi"
	elseif PlayerData.job.name  == "ambulance" then
	name = "EMS"
	ass = "ems"
	elseif PlayerData.job.name == "mechanic" then
	name = "MECHANIC"
	ass = "mechanic"
	end
	end
	end
		SetDiscordAppId(767525971154305054)
		SetDiscordRichPresenceAsset('5122')
        SetDiscordRichPresenceAssetText('discord.gg/g37CGaZ')
        SetDiscordRichPresenceAssetSmall(ass)
        SetDiscordRichPresenceAssetSmallText(name)
	
	Citizen.Wait(59000)
	end
end)
Citizen.CreateThread(function()
	while true do
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		local maxPlayerSlots = 128
		players = {}
		for i = 0, 255 do
			if NetworkIsPlayerActive( i ) then
				table.insert( players, i )
			end
		end
		SetRichPresence(string.format("%s | %s/%s | ID: %s", pName,#players, maxPlayerSlots, pId))
		Citizen.Wait(60000)
	end
end)