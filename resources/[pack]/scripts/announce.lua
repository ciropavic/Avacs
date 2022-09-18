local m = {} 
m.delay = 5

m.prefix = ' ^6[ PersianPixel | Massage ] '
m.suffix = '^6.'

m.messages = {   
    'Dar Sorat Har Gone Moshkel Lotfa Az Command /Report Estefade Konid',
    'Admin Yek Shakhsiyat ^1OOC ^0Ast Pas Anhara Ba Esm ^3[ Shahrdar, RayisJomhor ,Rahbar ,Leader ] ^0Seda Nazanid Va Dar Hengam ^1On-Duty ^0Mozahem Anha Nashavid ^0',
    'Dar Sorat Moshade Hargene Moshehade Har ^1Gone Bug Va Enteghadt ^0Khod Mitavanid Dar Discord Be Ma Moraje Konid',
    'Dar Sorat Shekayat Az Player Ya Admin Lotfa Madrak Ya Record Dashte Bashid Dar Sotart Nadashtan Madark Ticket Shoma Accept Nmishavd , ^1 Ticket ^0 Baz Konid ',
    'Shoma Yek Shakhsiyat IC Hastid Lotfan Be Hich Onvan Az Kalamat OOC Mesl ^3[ Server , Admin , Bug ,... ] ^0Estefade Nakonid Va Az Roll Khdeton Kharej Nashavid',

}


--------------------------------------------------------------------------

-----[ CODE, DON'T TOUCH THIS ]-------------------------------------------
local playerIdentifiers
local enableMessages = true
local timeout = m.delay * 1000 * 60 -- from ms, to sec, to min
local playerOnIgnoreList = false
Citizen.CreateThread(function()
        while true do
            for i in pairs(m.messages) do
                if enableMessages then
                    chat(i)
                end
                Citizen.Wait(timeout)
            end
            
            Citizen.Wait(0)
        end
end)
function chat(i)
   
    TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(116, 209, 238, 0.2); border-radius: 25px;"><i class="fas fa-globe"></i> [ PersianPixel | Massage ] : {1} .</div>',
      args = { name, m.messages[i] }
    })
    
end
--[[RegisterCommand('automessage', function()
    enableMessages = not enableMessages
    if enableMessages then
        status = '^2enabled^5.'
    else
        status = '^1disabled^5.'
    end
    TriggerEvent('chatMessage', '', {255, 255, 255}, '^5[vAnnouncer] automessages are now ' .. status)
end, false)]]
--------------------------------------------------------------------------
