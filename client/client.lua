local initialized, zones = false, {}

AddEventHandler('JLRP-Elevators:Client:GoToFloor', function(data)
    local elevator, floor = data.elevator, data.floor
    local coords = Config.Elevators[elevator][floor].coords
    local heading = Config.Elevators[elevator][floor].heading
    local ped = PlayerPedId()
	DoScreenFadeOut(1000)
	while not IsScreenFadedOut() do
		Wait(10)
	end
	SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
	SetEntityHeading(ped, heading or 0.0)
	FreezeEntityPosition(ped, true)
	while not HasCollisionLoadedAroundEntity(ped) do
		RequestCollisionAtCoord(coords.x, coords.y, coords.z)
		Wait(10)
	end
	FreezeEntityPosition(ped, false)
	Wait(3000)
	DoScreenFadeIn(1000)
	local floorMessage = Config.Elevators[elevator][floor].floorLevel and 'floor '..Config.Elevators[elevator][floor].floorLevel or Config.Elevators[elevator][floor].title
	Config.Notification('You are at '..floorMessage, 'success')
end)

AddEventHandler('JLRP-Elevators:Client:NoAccess', function(data)
	if data and data?.extra then
		Config.Notification('You need to be on-duty to access this floor!', 'error')
	else
		Config.Notification('You do not have access to this floor', 'error')
	end
end)

AddEventHandler('JLRP-Elevators:Client:OpenMenu', function(data)
    local elevator = data.elevator
    local floor = data.floor
    local elevatorData = Config.Elevators[elevator]
    local Options = {}
	local title = nil
    for k, v in pairs(elevatorData) do
		if v.floorLevel then
			title = v.title..' - Floor ('..v.floorLevel..')'
		else
			title = v.title
		end
		
        if k == floor then
            table.insert(Options, {
                title = title..' ✅',
                description = v.description,
                event = '',
                args = { elevator = elevator, floor = k }
            })
        elseif v.jobs then
            local found, onDutyIssue
            for i=1, #v.jobs do
                if Config.Framework.PlayerData.job.name == v.jobs[i] then
					if Config.Framework.Name == 'JLRP-Framework' and Config.Framework.PlayerData.job.onDuty then
						found = true
					elseif Config.Framework.Name == 'es_extended' and Config.Framework.PlayerData.job.onDuty then
						found = true
					elseif Config.Framework.Name == 'qb-core' and Config.Framework.PlayerData.job.onduty then
						found = true
					elseif Config.Framework.Name == 'other' then
						found = true
					else
						onDutyIssue = true
					end
					break -- LOOK INTO!
                end
            end
            if found then
                table.insert(Options, {
                    title = title,
                    description = v.description,
                    event = 'JLRP-Elevators:Client:GoToFloor',
                    args = { elevator = elevator, floor = k }
                })
            else
                table.insert(Options, {
                    title = title,
                    description = v.description,
                    event = 'JLRP-Elevators:Client:NoAccess',
					args = { elevator = elevator, floor = k, extra = onDutyIssue}
                })
            end
        elseif not v.jobs then
            table.insert(Options, {
                title = title,
                description = v.description,
                event = 'JLRP-Elevators:Client:GoToFloor',
                args = { elevator = elevator, floor = k }
            })
        else
            table.insert(Options, {
                title = title,
                description = v.description,
                event = 'JLRP-Elevators:Client:NoAccess',
				args = { elevator = elevator, floor = k }
            })
        end
    end
	
	table.sort(Options, function(a, b)
		return a?.args?.floor < b?.args?.floor
	end)
	
    lib.registerContext({
		id = 'elevator_menu',
		title = 'Elevator Menu',
		options = Options
	})

	lib.showContext('elevator_menu')

end)

CreateThread(function()
    for k, v in pairs(Config.Elevators) do
        for a, b in pairs(Config.Elevators[k]) do
            local zone = exports[Config.Target]:AddBoxZone(k..':'..a, b.coords, b.target.width, b.target.length, {
                name = k..':'..a,
                heading = b.heading or 0.0,
                debugPoly = b.debug or false,
                minZ = b.coords.z - 0.5,
                maxZ = b.coords.z + 0.5
            },
            {
                options = {
                    {
                        event = 'JLRP-Elevators:Client:OpenMenu',
                        icon = 'fa-solid fa-elevator',
                        label = 'Interact',
                        elevator = k,
                        floor = a
						},
                },
                distance = 1.5 
            })
			table.insert(zones, zone)
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() == resourceName then
		for i = 1, #zones, 1 do
			exports[Config.Target]:RemoveZone(zones[i])
		end
		zones = {}
	else
		return
	end
end)