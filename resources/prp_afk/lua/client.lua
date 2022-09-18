local display = false
afk = nil
ESX = nil
dc = true
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject",function(obj)
			ESX = obj
		end)
			
		Citizen.Wait(0)
	end
end)
--Set the player afk
RegisterNetEvent("qAFK:setAFK")
AddEventHandler("qAFK:setAFK", function(source)
    afk = true
    oldCoords = GetEntityCoords(PlayerPedId())
end)
function()

--Set the player NOT afk
RegisterNetEvent("qAFK:setNot")
AddEventHandler("qAFK:setNot", function(source)
    if afk then
        local ped = PlayerPedId()
        local namep = GetPlayerName(PlayerId())
        local steamsearch = "https://steamcommunity.com/search/users/#text=" .. namep
        local afkPlayer = "[" .. namep .. "]" .. "(" .. steamsearch .. ")" .. " " .. "is now **not** AFK."
        	SetEntityCoords(ped, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, true)
        	FreezeEntityPosition(ped, false)
        	chat("^1AFK", "You're now NOT afk", {255, 90, 0})
        	afk = false
        if Config.sendWebhooks then
        	TriggerServerEvent("qAFK:webhook", afkPlayer, "**\nAFK Status: :x: **" .. "Not AFK", 16720170)
        end
		

    else
        chat("^1ERROR ", "You were not AFK!", {255, 255, 255})
    end
end)



--Main Callback
RegisterCommand("setafk", function(source,args)
	local playerPed = PlayerPedId() 
    local namep = GetPlayerName(PlayerId())
	local playerId = GetPlayerServerId(PlayerId())
	local afkPlayer = "Player ba Name "..namep.." va ID  "..playerId.."  AFK Shod   "
	local reason = table.concat(args, " ")
	if Config.sendWebhooks then
    	TriggerServerEvent("qAFK:webhook", afkPlayer, "**\nAFK Status: :white_check_mark: **" .. reason, 3145615)
    end
	TriggerServerEvent("qAFK:sendAFKmessagetoServer", namep)
	TriggerEvent("qAFK:setAFK")
	chat("^7[^4AFK^7]", "You're now AFK (Status: " .. reason .. ")", {90, 255, 90})
    SetEntityCoords(playerPed, Config.afkx, Config.afky, Config.afkz, false, false, false, true)
    FreezeEntityPosition(playerPed, true)
	DisableControlAction(0,21,true)  
	DisableControlAction(0,24,true)  
	DisableControlAction(0,25,true)  
	DisableControlAction(0,47,true)  
	DisableControlAction(0,58,true)  
	DisableControlAction(0,263,true) 
	DisableControlAction(0,264,true) 
	DisableControlAction(0,257,true) 
	DisableControlAction(0,140,true) 
	DisableControlAction(0,141,true) 
	DisableControlAction(0,142,true) 
	DisableControlAction(0,143,true) 
	DisableControlAction(0,75,true)  
	DisableControlAction(27,75,true) 
	DisableControlAction(0,32,true)  
	DisableControlAction(0,34,true)  
	DisableControlAction(0,33,true)  
	DisableControlAction(0,35,true)  
end,false)
function chat(firstStr, secondStr, color)
    TriggerEvent('chatMessage', firstStr, color, secondStr)
end

local prevPos
local info = {
	warnings = 0,
	warned = false,
	timer = 0,
	maths = {
		result = 0
	},
	fail = 0
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		if ESX.GetPlayerData()['admin'] ~= 1 then
			if not afk then

				local ped = PlayerPedId()
				local position = GetEntityCoords(ped)
				if prevPos then
					local distance = Vdist(position, prevPos)
					if distance <= 2 and ESX.GetPlayerData()['IsDead'] ~= 1 then
						info.warnings = info.warnings + 1
						if info.warnings >= 900 then
							if not info.warned then
								info.timer = 60
								info.maths.a = math.random(1, 10)
								info.maths.b = math.random(1, 10)
								info.maths.result = info.maths.a + info.maths.b
								TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Shoma ^2" .. info.timer .. " ^0saniye digar be elaat ^1AFK ^0bodan kick mishavid, lotfan az makan feli khod ta hengami ke peygham afk ra daryaft konid jabeja shavid ya be soal robero javab dahid ^3/afkmath ^2" .. info.maths.a .. "^0+^4" .. info.maths.b .. "^0")
								info.warned = true
							else
								info.timer = info.timer - 1
								if info.timer <= 0 then
									TriggerServerEvent('qAFK:kickPlayer')
								end
							
								if info.timer == 40 or info.timer == 30 or info.timer == 20 or info.timer == 10 then
									TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Shoma ^2" .. info.timer .. " ^0saniye digar be elaat ^1AFK ^0bodan kick mishavid, lotfan az makan feli khod ta hengami ke peygham afk ra daryaft konid jabeja shavid ya be soal robero javab dahid ^3/afkmath ^2" .. info.maths.a .. "^0+^4" .. info.maths.b .. "^0")
								end
							end
						end
					else
						if info.warned then
							resetAFK()
						else
							info = {warnings = 0, warned = false, timer = 0, maths = {result = 0}, fail = 0}
						end
					end
				end
			
				prevPos = position
			end
		end
		
	end
end)

local failLimit = 3
RegisterCommand("afkmath", function(source, args)
	if info.warned then
		if not args[1] then
			TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Shoma dar ghesmat javab chizi vared nakardid!")
		end

		if not tonumber(args[1]) then
			TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Shoma dar ghesmat javab faghat mitavanid adad vared konid!")
		end

		local input = tonumber(args[1])

		if input == info.maths.result then
			resetAFK()
		else
			info.fail = info.fail + 1
			if info.fail > 3 then
				TriggerServerEvent('kickForBeingAnAFKDouchebag')
				return
			end
			TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Javab vared shode eshtebah bod, shoma ^2" .. failLimit - info.fail .. "^0 bar digar ^3forsat^0 javab darid!")
		end
	else
		TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Shoma hich afk math acitivi nadarid!")
	end
end, false)

function resetAFK()
	TriggerEvent("chatMessage", "[SYSTEM]", {255, 0, 0}, "^0Shoma digar be onvan karbar ^1AFK ^0hesab ^2nemishavid^0!")
	info = {warnings = 0, warned = false, timer = 0, maths = {result = 0}, fail = 0}
end