Config = {}

Config.sendWebhooks = true -- set to false to send Webhooks thru discord. You must have the two configs below filled out in order to do so.
Config.webhook = "https://discord.com/api/webhooks/855904899619618837/smLTV3K4FXISdzHgwz-CdmuEzwZdwW2qCGnMC7O6IE5FbnSegTOxLHB2hLxnHoNIrbEj"
Config.webhookImage = "https://i.imgur.com/J4rn73L.png" -- Just a picture that says afk lol

-- AFK Parts
Config.afkmessagestoServer = true -- default false, set to true if you want the whole server to see when someone went afk in chat.

Config.afkx = 691.56 -- these are the coords the player is sent to when they enter an AFK status. The default spot is some un reachable tower in fort zancudo. Feel free to change these
Config.afky = 5545.93
Config.afkz = -149.15

--Afk Kick
Config.afkKick = true -- set to false if you dont want players to be kicked after being afk for too long
Config.afktimeAllowed = 6000