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
local ESX = nil
HasAlreadyEnteredMarker = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    Holograms()
    KeyControl()
end)

function checkDistance()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Pos, 1 do
            if GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, false) < 2 then
                return true
            end
        end
    end
    return false
end

function contains(table, val)
    for i = 1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

function Holograms()
    while true do
        Citizen.Wait(5)
        for k,v in pairs(Config.Zones) do
            for i=1, #v.Pos, 1 do
                if GetDistanceBetweenCoords( v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, GetEntityCoords(GetPlayerPed(-1)), false) < 10.0 then
                    --Draw3DText( v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.Label, 4, 0.1, 0.1)
                        Draw3DText( v.Pos[i].x, v.Pos[i].y, v.Pos[i].z - 0.250, v.Pos[i].label, 4, 0.1, 0.1)
                end	             
            end
        end
	end
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Keys['E']) and checkDistance() then
            FrontDesk()
        end
    end 
end)

function FrontDesk()
    ESX.UI.Menu.CloseAll()
    HasAlreadyEnteredMarker = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'frontdesk_menu', {
        title    = "FrontDesk Police",
        align    = 'top-left',
        elements = {
            {label = "Avaz kardan esm", value = "changename"},
        }

    }, function(data, menu)

        if data.current.value == "changename" then
            menu.close()

            ESX.UI.Menu.Open('question', GetCurrentResourceName(), 'frontdesk_question',
            {
                title 	 = 'Aya az avaz kardan esm khod etminan darid?',
                align    = 'center',
                question = "Esm khod ra bayad hamrah ba _ vared konid be farz mersal ali_mohammadi, hazine avaz kardan esm $50000 ast va bad az avaz kardan 1 mah cooldown khahad dasht!",
                elements = {
                    {label = 'Bale', value = 'yes'},
                    {label = 'Kheir', value = 'no'},
                }
            }, function(data2, menu2)
            
                menu2.close()
                if data2.current.value == "yes" then

                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'frontdesk_input', {
                        title    = "Entekhab esm",
                
                    }, function(data3, menu3)
                        if not data3.value then
                            ESX.ShowNotification("~h~Hade aghal esm bayad ~g~7~w~ character bashad!")
                            return
                        end

                        if data3.value:match("%d+") then
                            ESX.ShowNotification("~h~Shoma mojaz be vared kardan ~r~Special ~o~character ~w~ya ~r~adad ~w~nistid!")
                            return
                        end
                
                        if string.len(trim1(data3.value)) >= 7 then
                            menu3.close()
                            ESX.TriggerServerCallback('changenameic:changename', function(code, name)
                
                                if code == 1 then
                                    ESX.ShowNotification("~h~Shoma baraye avaz kardan esm khod niaz be ~g~$50000 ~w~pool darid!")
                                elseif code == 2 then
                                    ESX.ShowNotification("~h~Shoma baraye joda kardan esm az famil bayad az ~g~_ ~w~estefade konid!")
                                elseif code == 3 then
                                    ESX.ShowNotification("~h~Shoma nemitavanid esm ya famil ra ~g~khali ~w~begozarid!")
                                elseif code == 4 then 
                                    ESX.ShowNotification("~h~Esm va famil hade aghal bayad ~g~3 ~w~character bashad!")
                                elseif code == 5 then
                                    ESX.ShowNotification("~h~Ghabeliat avaz kardan esm shoma roye ~g~cooldown ~w~ast lotfan badan moraje konid!")
                                elseif code == 6 then
                                    ESX.ShowNotification("~h~In esm ghablan tavasot shakhs digari ~g~sabt ~w~shode ast!")
                                elseif code == 7 then
                                    TriggerEvent("chatMessage", "[Sabte Ahval]", {255, 0, 0}, "Esm shoma ba movafaghiat be ^3" .. name .. "^0 taghir kard va mablagh ^2$50000 ^0az hesab shoma kam shod!")
                                end
                
                            end, trim1(data3.value))
                        else
                            ESX.ShowNotification("~h~Hade aghal esm bayad ~g~7~w~ character bashad!")
                        end
                    end, function (data3, menu3)
                        menu3.close()
                        HasAlreadyEnteredMarker = false
                    end)

                end

            end, function (data2, menu2)
                menu2.close()
            end)

        end

    end, function (data, menu)
        menu.close()
        HasAlreadyEnteredMarker = false
    end)
end
function NearAny()
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Pos, 1 do
            if GetDistanceBetweenCoords(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, GetEntityCoords(GetPlayerPed(-1)), false) < 3.0 then
                return true
            end
        end
    end

    return false
end

function trim1(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
 end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
end