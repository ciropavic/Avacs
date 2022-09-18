Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 0, max = 0 }
Config.Locale                     = 'en'

Config.Blips = {
  { x = -372.23, y = -118.69, z = 38.7 },
  { x = -195.74, y = -1320.84, z = 30.0 },
  { x = 1179.48, y = 2652.99, z = 37.81 }
}

Config.Zones = {
  mechanicActions = {
    Pos   = { x = -349.14, y = -112.87, z = 39.43 },
    Size  = { x = 0.8, y = 0.8, z = 0.8 },
    Color = { r = 22, g = 201, b = 34 },
    Type  = 21,
  },

  VehicleDeleter = {
    Pos   = { x = -352.87, y = -116.4, z = 39.0 },
    Size  = { x = 1.7, y = 1.7, z = 1.7 },
    Color = { r = 22, g = 201, b = 34 },
    Type  = 24,
  },

  mechanicActions2 = {
    Pos   = { x = 1186.93, y = 2636.53, z = 38.4 },
    Size  = { x = 0.8, y = 0.8, z = 0.8 },
    Color = { r = 22, g = 201, b = 34 },
    Type  = 21,
  },

  VehicleDeleter2 = {
    Pos   = { x = 1167.57, y = 2655.79, z = 38.04 },
    Size  = { x = 1.7, y = 1.7, z = 1.7 },
    Color = { r = 22, g = 201, b = 34 },
    Type  = 24,
  },
  mechanicActions3 = {
    Pos   = { x = -196.75, y = -1319.8, z = 31.09 },
    Size  = { x = 0.8, y = 0.8, z = 0.8 },
    Color = { r = 22, g = 201, b = 34 },
    Type  = 21,
  },

  VehicleDeleter3 = {
    Pos   = { x = -230.75, y = -1283.25, z = 31.3 },
    Size  = { x = 1.7, y = 1.7, z = 1.7 },
    Color = { r = 22, g = 201, b = 34 },
    Type  = 24,
  },
}

Config.VehicleSpawnPoint = {
  [1] = {
    Pos   = { x = -357.72, y = -114.73, z = 38.7 },
    Heading = 71.96,
  },
  [2] = {
    Pos   = { x = 1164.26, y = 2634.63, z = 38.13 },
    Heading = 345.02,
  },
  [3] = {
    Pos   = { x = -223.58, y = -1295.34, z = 31.31 },
    Heading = 265.1,
  }
}

Config.Towables = {
 
}

for i=1, #Config.Towables, 1 do
  Config.Zones['Towable' .. i] = {
    Pos   = Config.Towables[i],
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Color = { r = 204, g = 204, b = 0 },
    Type  = 1
  }
end

Config.Vehicles = {
  'adder',
  'asea',
  'asterope',
  'banshee',
  'buffalo',
  'riata'
}
