--All_Log

function Log(wDec)
	PerformHttpRequest(Config.Webhook, function(Error, Content, Head) end, 'POST', json.encode(
        {username = Config.webhook_name, content = wDec}), 
        {['Content-Type'] = 'application/json'}
    )
end

--SearchLog

function searchLog(wDec)
	PerformHttpRequest(Config.search_Webhook, function(Error, Content, Head) end, 'POST', json.encode(
        {username = Config.search_webhook_name, content = wDec}), 
        {['Content-Type'] = 'application/json'}
    )
end
