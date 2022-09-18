--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil
local robbed = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount  > xPlayer.money then
		-- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Pardakhte Vajh', 'Meqdare Vorodi Eshtebah ast', 'CHAR_BANK_MAZE', 9)
	else
		xPlayer.removeMoney(amount)
		xPlayer.addBank(tonumber(amount) - 50)
		local xPlayer = ESX.GetPlayerFromId(_source)
		TriggerEvent('DiscordBot:ToDiscord', 'bankdeposit',  xPlayer.name .. '('.. _source .. ')' , '```css\n' .. GetPlayerName(_source).. '('.. xPlayer.name .. ')\nBe Bank Variz Kard('.. amount ..'$) Pool Monde Dar Jib ('.. xPlayer.money ..'$)\n```')
		--TriggerEvent('DiscordBot:ToDiscord', 'bankdeposit',  xPlayer.name .. '('.. _source .. ')' , '```css\n..' .. GetPlayerName(_source).. '('.. xPlayer.name .. ')\nBe Bank Variz Kard('.. amount ..'$) Pool Monde Dar Jib ('.. xPlayer.money ..'$)\n```', 'steam', source, false, false)
                -- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Pardakhte Vajh', 'Shoma ~g~$' .. amount .. '~s~ Dakhele Bank Khod Gozashtid', 'CHAR_BANK_MAZE', 9)
	end
end)

RegisterServerEvent('new_banking:disableforhour')
AddEventHandler('new_banking:disableforhour', function(pos)
	table.insert(robbed, {
		pos = pos,
		timer = GetGameTimer()
	})
	TriggerClientEvent('new_banking:disableforhour',-1, pos, 60 * 60 * 1000)
end)

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
	for _,v in pairs(robbed) do
		local timer = GetGameTimer() - v.timer
		if timer < 3600000 then
			TriggerClientEvent('new_banking:disableforhour', source, v.pos, timer)
		else
			table.remove(robbed, _)
		end
	end
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.bank
	if amount == nil or amount <= 0 or amount > base then
                 -- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Bardashte Vajh', 'Meqdar Eshtebah ast', 'CHAR_BANK_MAZE', 9)
	else
		xPlayer.removeBank(amount + 50)
		xPlayer.addMoney(amount)
		
				-- advanced notification with bank icon
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Bardashte Vajh', 'Shoma ~r~$' .. amount .. '~s~ Az Hesabe Khod Bardashtid', 'CHAR_BANK_MAZE', 9)
		local xPlayer = ESX.GetPlayerFromId(_source)
		TriggerEvent('DiscordBot:ToDiscord', 'bankwithdraw',  xPlayer.name .. '('.. _source .. ')' , '```css\n' .. GetPlayerName(_source).. '('.. xPlayer.name .. ')\nAz Bank Bardasht('.. amount ..'$) Pool Monde Dar Bank ('.. xPlayer.bank ..'$)\n```')
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.bank
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0
	amountt = amountt
	amountt = tonumber(amountt)
	if not amountt then
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Enteqale Vajh', 'Lotfan Faqat Adad Vared Konid', 'CHAR_BANK_MAZE', 9)
	end
	balance = xPlayer.bank
	zbalance = zPlayer.bank
	if tonumber(_source) == tonumber(to) then
		TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Enteqale Vajh', 'Shenase Shakhs Morede Nazar Yaft Nashod', 'CHAR_BANK_MAZE', 9)
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
			TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Enteqale Vajh', 'Mojodi Shoma Kafi nist', 'CHAR_BANK_MAZE', 9)
		else
			xPlayer.removeBank(amountt - 100)
			zPlayer.addBank(amountt)
			
		--	TriggerEvent('DiscordBot:ToDiscord', 'banktransfer','('.. xPlayer.name .. ')', '```css\n'.. '('.. xPlayer.name .. ') To ('.. zPlayer.name .. ')' ..'\n```', 'steam', source, false, false)
			TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank', 'Enteqale Vajh', 'Shoma ~r~$' .. amountt .. '~s~ Be ~r~' .. string.gsub(zPlayer.name, "_", " ") .. ' ~s~Enteqad Dadid.', 'CHAR_BANK_MAZE', 9)
			TriggerClientEvent('esx:showAdvancedNotification', to, 'Bank', 'Enteqale Vajh', '~r~$' .. amountt .. '~s~ Az Taraf ~r~' .. string.gsub(xPlayer.name, "_", " ") .. ' ~s~Be Hesab Shoma Variz Shod.', 'CHAR_BANK_MAZE', 9)
			local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
			TriggerEvent('DiscordBot:ToDiscord', 'banktransfer',  xPlayer.name .. '('.. _source .. ')' , '```css\n' .. GetPlayerName(_source).. '('.. xPlayer.name .. ') To ' .. GetPlayerName(to).. '('.. zPlayer.name .. ')\nEnteghal Vajh('.. amountt ..'$)\nBe  Pool Monde Dar Bank Ersal Konande('.. xPlayer.bank ..'$)\nPool Monde Dar Bank Daryaft Konande('.. zPlayer.bank ..'$)\n```')
		end
	end
end)
