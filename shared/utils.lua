Config.IsDuplicityVersion = IsDuplicityVersion()
Config.Framework = Config.Framework or {Name = 'other'}
Config.Framework.PlayerData = nil -- don't touch
Config.Framework.Objects = nil
CreateThread(function() -- Why did I write my code like this? It takes time to understand it. I'm simultaneously running code for both client and server like this? wtf
	if Config.Framework.Name == 'JLRP-Framework' then
		Config.Framework.Objects = exports[Config.Framework.Name]:GetFrameworkObjects()
		if not Config.IsDuplicityVersion then -- only register this in client
			Config.Framework.PlayerData = Config.Framework.Objects.GetPlayerData()
			while not Config.Framework.PlayerData or not Config.Framework.PlayerData.job do
				Config.Framework.PlayerData = Config.Framework.Objects.GetPlayerData()
				Wait(10)
			end
			AddEventHandler('JLRP-Framework:setPlayerData', function(key, val, last)
				if GetInvokingResource() == Config.Framework.Name then
					if key == 'coords' then Config.Framework.PlayerData['position'] = val end
					Config.Framework.PlayerData[key] = val
					if OnPlayerData ~= nil then OnPlayerData(key, val, last) end -- The function we can create inside external resources
				end
			end)
		end
	elseif Config.Framework.Name == 'es_extended' then
		local _source, _error = pcall(exports[Config.Framework.Name]:getSharedObject(), nil)
		if _success then
			Config.Framework.Objects = exports[Config.Framework.Name]:getSharedObject()
		else
			while Config.Framework.Objects == nil do 
				TriggerEvent('esx:getSharedObject', function(obj) 
					Config.Framework.Objects = obj 
				end)
				Wait(100)
			end
		end
		if not Config.IsDuplicityVersion then -- only register this in client
			Config.Framework.PlayerData = Config.Framework.Objects.GetPlayerData()
			while not Config.Framework.PlayerData or not Config.Framework.PlayerData.job do
				Config.Framework.PlayerData = Config.Framework.Objects.GetPlayerData()
				Wait(10)
			end
			AddEventHandler('esx:setPlayerData', function(key, val, last)
				if GetInvokingResource() == Config.Framework.Name then
					Config.Framework.PlayerData[key] = val
					if OnPlayerData ~= nil then OnPlayerData(key, val, last) end -- The function we can create inside external resources
				end
			end)
		end
	elseif Config.Framework.Name == 'qb-core' then
		Config.Framework.Objects = exports[Config.Framework.Name]:GetCoreObject()
		if not Config.IsDuplicityVersion then -- only register this in client
			Config.Framework.PlayerData = Config.Framework.Objects.Functions.GetPlayerData()
			while not Config.Framework.PlayerData or not Config.Framework.PlayerData.job do
				Config.Framework.PlayerData = Config.Framework.Objects.Functions.GetPlayerData()
				Wait(10)
			end
			RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
				local last = Config.Framework.PlayerData
                Config.Framework.PlayerData = PlayerData
				if last.job ~= Config.Framework.PlayerData and OnPlayerData ~= nil then OnPlayerData('job', Config.Framework.PlayerData.job, last.job) end -- The function we can create inside external resources
            end)
		end
	else
		-- make <<Config.Framework.Objects>> equal to your framework objects/tables
		-- Config.Framework.Objects = ??
		-- Config.Framework.PlayerData = Config.Framework.Objects.??
	end
end)

function OnPlayerData(key, val, last)
	if key ~= 'job' then
		return
	end
	-- TODO ?
end