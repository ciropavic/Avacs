local useMph = false -- if false, it will display speed in kph
local speedLimited = false

Citizen.CreateThread(function()
  local resetSpeedOnEnter = true
  while true do
    Citizen.Wait(0)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed,false)
    if GetPedInVehicleSeat(vehicle, -1) == playerPed and IsPedInAnyVehicle(playerPed, false) then

      -- This should only happen on vehicle first entry to disable any old values
      if resetSpeedOnEnter then
        maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
        SetEntityMaxSpeed(vehicle, maxSpeed)
        resetSpeedOnEnter = false
        speedLimited = false
      end
      -- Disable speed limiter
      if IsControlJustReleased(0,29) and speedLimited then
		speedLimited = false
        maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
        SetEntityMaxSpeed(vehicle, maxSpeed)
        showHelpNotification("Mahdoudiat Sorat Khamoush Shod", 1)
      -- Enable speed limiter
      elseif IsControlJustReleased(0,29) and not speedLimited then
		speedLimited = true
        cruise = GetEntitySpeed(vehicle)
        SetEntityMaxSpeed(vehicle, cruise)
        if useMph then
			cruise = math.floor(cruise * 2.23694 + 0.5)
			showHelpNotification("Sorat Shoma Roye "..cruise.." mph Mahdoud Shod.", 0)
        else
			cruise = math.floor(cruise * 3.6 + 0.5)
			showHelpNotification("Sorat Shoma Roye "..cruise.." KM. Mahdoud Shod.", 0)
        end
      end
    else
      resetSpeedOnEnter = true
    end
  end
end)

function showHelpNotification(msg, type)
	if type == 0 then 
		TriggerEvent("pNotify:SendNotification", {text = msg, type = "success", timeout = math.random(1000, 10000), layout = "centerLeft", queue = "left"})
	else
		TriggerEvent("pNotify:SendNotification", {text = msg, type = "error", timeout = math.random(1000, 10000), layout = "centerLeft", queue = "left"})
	end
end