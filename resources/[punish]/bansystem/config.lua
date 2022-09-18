Config                   = {}

--GENERAL
Config.Lang              = 'en'    --Set lang (fr-en)
Config.permission        = 3	   --Permission need to use FiveM-BanSql commands (mod-admin-superadmin)
Config.MultiServerSync   = false   --This will check if a ban is add in the sql all 30 second, use it only if you have more then 1 server (true-false)


--WEBHOOK
Config.EnableDiscordLink = false --Turn this true if you want link the log to a discord (true-false)
Config.webhookban        = "https://discordapp.com/api/webhooks/600239481978880000/I_Vt9eT0ht4JNGRTGAdRVsMpsFzzIcXBcTNrthxbfKAfSQlMuvn6ctmv9uxkmdBEoQwR"
Config.webhookunban      = "https://discordapp.com/api/webhooks/600239481978880000/I_Vt9eT0ht4JNGRTGAdRVsMpsFzzIcXBcTNrthxbfKAfSQlMuvn6ctmv9uxkmdBEoQwR"


--LANGUAGE
Config.TextFr = {
	start         = "La BanList et l'historique a ete charger avec succes",
	starterror    = "ERROR : La BanList ou l'historique n'a pas ete charger nouvelle tentative.",
	banlistloaded = "La BanList a ete charger avec succes.",
	historyloaded = "La BanListHistory a ete charger avec succes.",
	loaderror     = "ERROR : La BanList n a pas été charger.",
	forcontinu    = " jours. Pour continuer entrer /sqlreason (Raison du ban)",
	noreason      = "Raison Inconnue",
	during        = " pendant : ",
	noresult      = "Il n'y a pas autant de résultats !",
	isban         = " a été ban",
	isunban       = " a été déban",
	invalidsteam  =  "Vous devriez ouvrir steam",
	invalidid     = "ID du joueur incorrect",
	invalidname   = "Le nom n'est pas valide",
	invalidtime   = "Duree du ban incorrecte",
	yourban       = "Vous avez ete ban pour : ",
	yourpermban   = "Vous avez ete ban permanant pour : ",
	youban        = "Vous avez banni : ",
	forr          = " jours. Pour : ",
	permban       = " de facon permanente pour : ",
	timeleft      = ". Il reste : ",
	toomanyresult = "Trop de résultats, veillez être plus précis.",
	day           = " Jours ",
	hour          = " Heures ",
	minute        = " Minutes ",
	by            = "par",
	ban           = "Bannir un joueurs qui est en ligne",
	banoff        = "Bannir un joueurs qui est hors ligne",
	dayhelp       = "Nombre de jours",
	reason        = "Raison du ban",
	history       = "Affiche tout les bans d'un joueur",
	reload        = "Recharge la BanList et la BanListHistory",
	unban         = "Retirez un ban de la liste",
	steamname     = "(Nom Steam)",
}


Config.TextEn = {
	start         = "Ban List Load Shod.",
	starterror    = "ERROR: BanList and BanListHistory failed to load, please retry.",
	banlistloaded = "Ban List Load Shod.",
	historyloaded = "BanListHistory Load Shod.",
	loaderror     = "ERROR: The BanList failed to load.",
	forcontinu    = " days. To continue, execute /sqlreason [reason]",
	noreason      = "Dalili Vojoud Nadarad.",
	during        = " during: ",
	noresult      = "No results found.",
	isban         = " Ban Shod",
	isunban       = " Unban Shod",
	invalidsteam  = "Lotfan Baraye Voroud Be Server Steam Khod Ra Baz Konid.",
	invalidid     = "ID Na Motabar Ast!",
	invalidname   = "Name Eshtebah Ast",
	invalidtime   = "Zaman Ban Eshtebah Ast",
	yourban       = "Shoma Ban Shodid Be Dalil : ",
	yourpermban   = "Shoma Ban (Pearmanet) Shodid Be Dalil : ",
	youban        = "BAN Jadid : ",
	forr          = " days. For: ",
	permban       = " permanently for: ",
	timeleft      = ". Zaman Payan Ban : ",
	toomanyresult = "Too many results, be more specific to shorten the results.",
	day           = " Rooz ",
	hour          = " Saat ",
	minute        = " Daghighe ",
	by            = "by",
	ban           = "Ban a player",
	banoff        = "Manually ban a (offline) player",
	dayhelp       = "Duration (days) of ban",
	reason        = "Reason for ban",
	history       = "Shows all previous bans for a certain player",
	reload        = "Refreshes the ban list and history.",
	unban         = "Unban a player.",
	steamname     = "Steam name",
}
