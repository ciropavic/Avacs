ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_tattooshop:requestPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

ESX.RegisterServerCallback('esx_tattooshop:purchaseTattoo', function(source, cb, tattooList, price, tattoo)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= price then
		xPlayer.removeMoney(price)
		table.insert(tattooList, tattoo)

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		})
        TriggerEvent('DiscordBot:ToDiscord', 'tattooshop',  xPlayer.name .. '('.. source .. ')' , '```css\n' .. GetPlayerName(source).. '('.. xPlayer.name .. ')\nTattoi('.. json.encode(tattooList) ..') Ba Gheimat ('.. price..'$) Kharid\n```')
		TriggerClientEvent('esx:showNotification', source, _U('bought_tattoo', ESX.Math.GroupDigits(price)))
		cb(true)
	else
		local missingMoney = price - xPlayer.get('money')
		TriggerClientEvent('esx:showNotification', source, _U('not_enough_money', ESX.Math.GroupDigits(missingMoney)))
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_tattooshop:del', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= 20000 then
		xPlayer.removeMoney(20000)
		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = '[]',
			['@identifier'] = xPlayer.identifier
		})
                TriggerEvent('DiscordBot:ToDiscord', 'tattooshop',  xPlayer.name .. '('.. source .. ')' , '```css\n' .. GetPlayerName(source).. '('.. xPlayer.name .. ')\nTattoo Hasho Delete Kard Ba Gheimat(1000$)\n```')
		TriggerClientEvent('esx:showNotification', source, _U('del_tattoo', ESX.Math.GroupDigits(1000)))
		cb(true)
	else
		local missingMoney = 20000 - xPlayer.get('money')
		TriggerClientEvent('esx:showNotification', source, _U('nodel_tattoo', ESX.Math.GroupDigits(missingMoney)))
		cb(false)
	end
end)