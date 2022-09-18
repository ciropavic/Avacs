local Table 		= {}
local PlayerData    = {}
local Loaded		= false
ESX                 = nil

Citizen.CreateThread(function()
	while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData 	= xPlayer

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	Loaded = true
end)

RegisterNetEvent('esx_status:setLastStatsirs')
AddEventHandler('esx_status:setLastStatsirs', function()
	if PlayerData.job.grade < 1 then
		return
	end

	if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'taxi' or PlayerData.job.name == 'police' then

		TriggerServerEvent('job_tracker:AddToTable')
	
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'taxi' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'police' then

		TriggerServerEvent('job_tracker:RemoveFromTable', PlayerData.job.name)

	end

	PlayerData.job = job

	for _, player in ipairs(GetActivePlayers()) do

		local ped = GetPlayerPed(player)
		
		RemoveBlip(GetBlipFromEntity(ped))

	end
	
	Table = {}

	if PlayerData.job.grade > 0 and (PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'taxi' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'police') then

		TriggerServerEvent('job_tracker:AddToTable')

	end
end)

RegisterNetEvent('job_tracker:InsertBlip')
AddEventHandler('job_tracker:InsertBlip', function(job, Users)
	if PlayerData.job.name == job then
		local source = GetPlayerServerId(PlayerId())
		Users[source] = nil
		for k,v in pairs(Users) do

			local PlayerId 		= GetPlayerFromServerId(k)
			local playerPed 	= GetPlayerPed(PlayerId)
			local new_blip 		= AddBlipForEntity(playerPed)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(string.gsub(v, "_", " "))
			EndTextCommandSetBlipName(new_blip)
			SetBlipColour(new_blip, 37)
			SetBlipCategory(new_blip, 2)
			SetBlipScale(new_blip, 1.0)

			Table[k] = new_blip
		end
	end
end)

RegisterNetEvent('job_tracker:AddPlayerBlip')
AddEventHandler('job_tracker:AddPlayerBlip', function(society, name, player)
	if not Loaded then return end
	if PlayerData.job.name == society and PlayerData.job.grade > 0 then
		if Table[player] then return end
		if GetPlayerServerId(PlayerId()) == player then return end

		local PlayerId 		= GetPlayerFromServerId(player)
		local playerPed 	= GetPlayerPed(PlayerId)
		local new_blip 		= AddBlipForEntity(playerPed)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(string.gsub(name, "_", " "))
		EndTextCommandSetBlipName(new_blip)
		SetBlipColour(new_blip, 37)
		SetBlipCategory(new_blip, 2)
		SetBlipScale(new_blip, 1.0)
		Table[player] = new_blip

	end
end)

RegisterNetEvent('job_tracker:RemovePlayerBlip')
AddEventHandler('job_tracker:RemovePlayerBlip', function(job, player)
	if not Loaded then return end
	if PlayerData.job.name == job then

		if Table[player] then
			RemoveBlip(Table[player])
			Table[player] = nil
		end

	end
end)