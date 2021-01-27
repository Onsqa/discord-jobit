ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
Citizen.CreateThread(function()
	while true do
		local xPlayer  = ESX.GetPlayerFromId(source)

		local xPlayers = ESX.GetPlayers()
		lanssi = 0
		poliisi = 0
		taksi = 0
		meksu = 0
		pelaaja = 0

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'ambulance' then
				lanssi = lanssi + 1
			end		
			if xPlayer.job.name == 'police' then
				poliisi = poliisi + 1
			end
			if xPlayer.job.name == 'taxi' then
				taksi = taksi + 1
			end
			if xPlayer.job.name == 'mechanic' then
				meksu = meksu + 1
			end
			if xPlayer == xPlayer then
				pelaaja = pelaaja + 1
		end
	end
		laheta(poliisi,lanssi,taksi,meksu,pelaaja)
		Wait(600000) -- Sopivasti
	end
end)


function laheta(message)
local DiscordWebHook ="Webbihuukki"
local embeds = {
	{
		["title"]="Työntekijät",
		["type"]="rich",
		["color"] = 2061822,
		["description"] = "Pelaajia: " .. pelaaja .. "\nEnsihoitajia: " .. lanssi .. "\nPoliiseja: " .. poliisi .. "\nTakseja: " .. taksi .. "\nMekaanikkoja: " .. meksu,
	}
}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Työnvalvoja", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
