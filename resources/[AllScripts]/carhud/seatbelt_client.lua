local isUiOpen = false 
local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end 

Fwv = function (entity)
        local hr = GetEntityHeading(entity) + 90.0
        if hr < 0.0 then hr = 360.0 + hr end
        hr = hr * 0.0174533
        return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end
 
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
  
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    
    if car ~= 0 and (wasInCar or IsCar(car)) then
      wasInCar = true
             if isUiOpen == false and not IsPlayerDead(PlayerId()) then
                SendNUIMessage({
            	   displayWindow = 'true'
            	   })
                isUiOpen = true
            end

       if beltOn then 
	  DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
	  DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
	  end

      speedBuffer[2] = speedBuffer[1]
      speedBuffer[1] = GetEntitySpeed(car)


      
      if speedBuffer[2] ~= nil 
	 
         and not beltOn
         and GetEntitySpeedVector(car, true).y > 1.5 
         and speedBuffer[1] > 19.25 
         and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
          exports.PERSIANPIXEL_AC:Whitelist(true)
        local co = GetEntityCoords(ped)
        local fw = Fwv(ped)
		
        SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
        SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
		Citizen.Wait(500)
        Citizen.Wait(1)
        SetPedToRagdoll(ped, 500, 500, 0, 0, 0, 0)
		Citizen.CreateThread(function()
	Citizen.Wait(2000)
	exports.PERSIANPIXEL_AC:Whitelist(false)
	end)
		
      end
        
      velBuffer[2] = velBuffer[1]
      velBuffer[1] = GetEntityVelocity(car)
        
      if IsControlJustReleased(0, 182) and GetLastInputMethod(0) then
    TriggerEvent("FakeRevive")
    RegisterNetEvent("FakeRevive")
    AddEventHandler("FakeRevive", function(inputText) 
end)
        beltOn = not beltOn 
        if beltOn then 
		  TriggerEvent("pNotify:SendNotification", {text = "!کمربند شما بسته شد", type = "success", timeout = 1400, layout = "centerLeft"})
		  	--- Täältä voit muuttaa ääntä, kun turvavyö laitetaan päälle -- Tässä ----
    		---- Here you can change sounds, when you put seatbelt on ----- Here -----
		  TriggerServerEvent('sedahayeajibpersianpixelxd', 0.9, 'buckle', 0.9)
			
		  SendNUIMessage({
		    displayWindow = 'false'
		    })
		  isUiOpen = true 
		else 
		  TriggerEvent("pNotify:SendNotification", {text = "!کمربند شما باز شد", type = "error", timeout = 1400, layout = "centerRight"})
		      	--- Täältä voit muuttaa ääntä, kun turvavyö otetaan pois -- Tässä ------
    			---- Here you can change sounds, when you take seatbelt off - Here -----
		  TriggerServerEvent('sedahayeajibpersianpixelxd', 0.9, 'unbuckle', 0.9)

		  SendNUIMessage({
		     displayWindow = 'true'
		     })
		  isUiOpen = true  
		end
      end
      
    elseif wasInCar then
      wasInCar = false
      beltOn = false
      speedBuffer[1], speedBuffer[2] = 0.0, 0.0
             if isUiOpen == true and not IsPlayerDead(PlayerId()) then
                SendNUIMessage({
            	   displayWindow = 'false'
            	   })
                isUiOpen = false 
            end
    end
    
  end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if IsPlayerDead(PlayerId()) and isUiOpen == true then
            SendNUIMessage({
                    displayWindow = 'false'
               })
            isUiOpen = false
        end    

    end
end)
Citizen.CreateThread(function()

 while true do
  local player = GetPlayerPed(-1)
  local speed = GetEntitySpeed(player);
  local kmh = speed * 3.6;
  local car = GetVehiclePedIsIn(GetPlayerPed(-1))
  if beltOn == false and IsPedInAnyVehicle(PlayerPedId(), false) and kmh > 100 and car ~= 0 and (wasInCar or IsCar(car)) then
  TriggerEvent('InteractSound_CL:PlayOnOne','seatbeltalarm', 0.5)
   Wait(20000)
  end
  Wait(5000)
 end
end)