function tLength(t)
	local l = 0
	for k,v in pairs(t)do
		l = l + 1
	end

	return l
end
db = {}

RegisterServerEvent('db:updateUser')
AddEventHandler('db:updateUser', function(new)
	exports.bansystem.bancheater(source,"Dont Trigger This Event :||")
	--identifier = GetPlayerIdentifier(source, 0)
	--db.updateUser(identifier, new)
end)

RegisterServerEvent('db:updateUserName')
AddEventHandler('db:updateUserName', function(name,data)
	identifier = GetPlayerIdentifier(source, 0)
	local player = {}
	player.playerName 	= name
	player.dateofbirth 	= data
	db.updateUser(identifier, player)
end)

function db.updateUser(identifier, new, callback)
	local updateString = ""

	local length = tLength(new)
	local cLength = 1
	for k,v in pairs(new)do
		if cLength < length then
			if(type(v) == "number")then
				updateString = updateString .. "`" .. k .. "`=" .. v .. ","
			elseif(type(v) == "string")then
				updateString = updateString .. "`" .. k .. "`='" .. v .. "',"
			elseif(type(v) == "talbe")then
				updateString = updateString .. "`" .. k .. "`='" .. ESX.dump(v) "',"
			end
		else
			if(type(v) == "number")then
				updateString = updateString .. "`" .. k .. "`=" .. v .. ""
			else
				updateString = updateString .. "`" .. k .. "`='" .. ESX.dump(v) .. "'"
			end
		end
		cLength = cLength + 1
	end

	exports.ghmattimysql:execute('UPDATE users SET ' .. updateString .. ' WHERE `identifier`=@identifier', 
	{
		['identifier'] = identifier
	}, function(done)
		if callback then
			callback(true)
		end
	end)
end

function db.createUser(identifier, license, callback)
	exports.ghmattimysql:execute('INSERT INTO users (`identifier`, `money`, `bank`, `group`, `inventory`, `loadout`,`permission_level`, `license`) VALUES (@identifier, @money, @bank, @group, @inventory, @loadout, @permission_level, @license);', 
	{
		['identifier'] 			= identifier, 
		['money'] 				= 10000, 
		['bank'] 				= 100000, 
		['license'] 			= license, 
		['group'] 				= "user", 
		['inventory'] 			= '[{"count":1,"item":"phone"},{"count":1,"item":"gps"},{"count":5,"item":"water"},{"count":5,"item":"bread"}]',
		['loadout']	 			= '[]',
		['permission_level'] 	= 0 
	}, function(e)
		callback()
	end)
end

function db.doesUserExist(identifier, callback)
	exports.ghmattimysql:execute('SELECT * FROM `users` WHERE `identifier` = @identifier', 
	{
		['@identifier'] = identifier
	}, function(users)
		if users[1] then
			callback(true)
		else
			callback(false)
		end
	end)
end

function db.retrieveUser(identifier, callback)
	exports.ghmattimysql:execute('SELECT * FROM users WHERE `identifier`=@identifier;', 
	{
		['identifier'] = identifier
	}, function(users)
		if users[1] then
			callback(users[1])
		else
			callback(false)
		end
	end)
end