Config = {}

Config.DrawDistance 			  = 100.0
Config.MarkerType    			  = 1
Config.MarkerSize   			  = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 255, b = 255 }
Config.MarkerDeletersColor        = { r = 255, g = 0, b = 0 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- enable if you're using esx_identity
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society
Config.EnablePoliceFine           = true -- enable fine, requires esx_policejob

Config.MaxInService               = -1
Config.Locale = 'en'

Config.FBIStations = {

	FBI = {

		Blip = {
			Pos     = { x = 112.105, y = -749.363, z = 45.751 },
			Sprite  = 88,
			Display = 4,
			Scale   = 0.8,
			Colour  = 43,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_NIGHTSTICK',       price = 5000 },
			{ name = 'WEAPON_COMBATPISTOL',     price = 5000 },
			{ name = 'weapon_pistol',     		price = 5000 },
			{ name = 'weapon_bzgas',     		price = 5000 },
			{ name = 'WEAPON_STUNGUN',          price = 5000 },
			{ name = 'WEAPON_APPISTOL',         price = 50000 },
			{ name = 'weapon_combatpdw',        price = 50000 },
			{ name = 'WEAPON_SMG',          	price = 50000 },
			{ name = 'WEAPON_CARBINERIFLE',     price = 90000 },
			{ name = 'weapon_specialcarbine',     price = 90000 },
			{ name = 'weapon_microsmg',     price = 50000 },

		},

		Cloakrooms = {
			{ x = 152.046, y = -736.179, z = 241.151 },
		},

		Armories = {
			{ x = 143.654, y = -764.390, z = 241.152 },
	},

		Vehicles = {
			{
				Spawner    = { x = 95.547, y = -723.756, z = 32.133 },
	SpawnPoints = {
					{ x = 100.145, y = -729.447, z = 32.779, heading = 340.8, radius = 6.0 },
					{ x = 104.046, y = -730.836, z = 32.779, heading = 340.8, radius = 6.0 },
					{ x = 107.748, y = -732.138, z = 32.780, heading = 339.2, radius = 6.0 }
		}
			},
		},

		VehicleDeleters = {
			{ x = 96.359, y = -728.160, z = 32.133 },
			{ x = 93.267, y = -720.182, z = 32.133 }
	},

		BossActions = {
			{ x = 148.941, y = -758.541, z = 241.151 }
	},

		Elevator = {
			{
				Top = { x = 136.093, y = -761.823, z = 241.152 },
				Down = { x = 136.093, y = -761.809, z = 44.752 },
				Parking = { x = 110.28, y = -735.82, z = 32.13 }
}
		},

},
}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {
		{
			model = 'fbi',
			label = 'Voiture FBI'
		},
				{
			model = 'police 4',
			label = 'XLS2 FBI'
		},		
		{
			model = 'insurgent2',
			label = 'Spy 1'
		},				
		{
			model = 't20',
			label = 'Spy 2'
		},				
		{
			model = 'bf400',
			label = 'motor 1'
		},
		{
			model = 'neon',
			label = 'neon'
		},
		{
			model = 'cog552',
			label = 'cog'
		},
		{
			model = 'neon',
			label = 'neon'
		},
		{
			model = 'banshee',
			label = 'banshee'
		},
		{
			model = 'ruston',
			label = 'ruston'
		},
				{
			model = 'polschafter3',
			label = 'vip'
		},
		{
			model = 'sovereign',
			label = 'motor 2'
		}

},

	agent = {

	},

	special = {

	},

	supervisor = {

	},

	assistant = {
	
    },

	boss = {
		{
			model = 'baller6',
			label = 'zed golole'
		},
	}
}

Config.Uniforms = {
	agent_wear = {
		male = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		}
	},

	special_wear = {
		male = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		}
	},

	supervisor_wear = {
		male = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		}
	},

	assistant_wear = {
		male = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 121,
			['mask_2'] = 0
		}
	},

	boss_wear = {
		male = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 0,
			['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 96,
			['tshirt_2'] = 0,
			['torso_1'] = 36,
			['torso_2'] = 0,
			['decals_1'] = 0,
			['decals_2'] = 0,
			['arms'] = 1,
			['arms_2'] = 0,
			['pants_1'] = 13,
			['pants_2'] = 0,
			['shoes_1'] = 10,
			['shoes_2'] = 0,
			['helmet_1'] = 10,
			['helmet_2'] = 4,
			['chain_1'] = 0,
			['chain_2'] = 0,
			['ears_1'] = -1,
			['ears_2'] = 0,
			['mask_1'] = 0,
			['mask_2'] = 0
		}
	},

	bullet_wear = {
		male = {
			['bproof_1'] = 21,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 21,  ['bproof_2'] = 3
		}
	}

}