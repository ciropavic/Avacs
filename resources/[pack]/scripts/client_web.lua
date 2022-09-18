ESX = nil
local PlayerData = {}
local attached_weapons = {}
kif = 0
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(2000)
	  TriggerEvent('skinchanger:getSkin', function(skin)
		kif = skin['bags_1']
	  end)
	end
end)
local SETTINGS = {
    back_bone = 24816,
    x = 0.175,
    y = -0.15,
    z = 0.05,
    x_rotation = 0.0,
    y_rotation = 165.0,
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
         -- sub machine guns:
        ["w_sb_microsmg"] = 324215364,
        ["w_sb_assaultsmg"] = -270015777,
        ["w_sb_smg"] = 736523883,
        ["w_sb_gusenberg"] = 1627465347,
        ["w_sb_combatpdw"] = 2023061218
    }
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function EmergencyJobs()
	if PlayerData.job ~= nil and (PlayerData.job.name == "police" or PlayerData.job.name == "sheriff" or PlayerData.job.name == "FBI" or PlayerData.job.name == "lawyer") and PlayerData.job.grade > 0 then
		return true
	end
	return false
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
		for name, attached_object in pairs(attached_weapons) do
			DeleteObject(attached_object.handle)
			attachOneOnly = true
			attached_weapons[name] = nil
      	end
end)

RegisterNetEvent('NewLife')
AddEventHandler('NewLife', function()
		for name, attached_object in pairs(attached_weapons) do
			DeleteObject(attached_object.handle)
			attachOneOnly = true
			attached_weapons[name] = nil
      	end
end)

Citizen.CreateThread(function()
    local attachOneOnly = true
	  while true do
		--if kif ~= 40 or kif ~= 41 or kif ~= 44 or kif ~= 45 then
			local me = GetPlayerPed(-1)
			for wep_name, wep_hash in pairs(SETTINGS.compatable_weapon_hashes) do
				if HasPedGotWeapon(me, wep_hash, false) and not (kif == 21 or kif == 22 or kif == 23 or kif == 40 or kif == 41 or kif == 44 or kif == 45then
				--print(kif)
					if not attached_weapons[wep_name] and attachOneOnly then
						attachOneOnly = false
						AttachWeapon(wep_name, wep_hash, SETTINGS.back_bone, SETTINGS.x, SETTINGS.y, SETTINGS.z, SETTINGS.x_rotation, SETTINGS.y_rotation, SETTINGS.z_rotation, isMeleeWeapon(wep_name))
					end
				end
			end
			for name, attached_object in pairs(attached_weapons) --[[or (kif ~= 40 or kif ~= 41 or kif ~= 44 or kif ~= 45)]] do
				if GetSelectedPedWeapon(me) ==  attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) or (kif == 21 or kif == 22 or kif == 23 or kif == 40 or kif == 41 or kif == 44 or kif == 45) then -- equipped or not in weapon wheel
				print(kif)
					DeleteObject(attached_object.handle)
					attachOneOnly = true
					attached_weapons[name] = nil
				end
			end
		--end
 	 	Wait(1000)
  	end
end)

function AttachWeapon(attachModel,modelHash,boneNumber,x,y,z,xR,yR,zR, isMelee) 
	local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumber)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Wait(100)
	end

	attached_weapons[attachModel] = {
		hash = modelHash,
		handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)
	}

  	if isMelee then x = 0.11 y = -0.14 z = 0.0 xR = -75.0 yR = 185.0 zR = 92.0 end -- reposition for melee items
  	if attachModel == "prop_ld_jerrycan_01" then x = x + 0.3 end
	AttachEntityToEntity(attached_weapons[attachModel].handle, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
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

