Config = {}

Config.Framework = {
	Name = 'JLRP-Framework', -- valid values: 'JLRP-Framework', 'es_extended', 'qb-core', 'other'
}

Config.Target = 'qtarget' -- valid values: 'qtarget', 'qb-target', 'none'

Config.Notification = function(message, style)
	if GetResourceState('ox_lib') == 'started' then
		lib.notify({
			description = message or '',
			type = style or 'inform'
		})
	else
		
	end
end
Config.Elevators = {
	PillboxHospital1 = {
		[1] = {
            coords = vec(338.34, -583.76, 74.46), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Rooftop', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			jobs = {-- (optional) job authorized access to that floor
                'ambulance'
            },
			floorLevel = 4, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[2] = {
            coords = vec(331.87, -597.23, 43.58), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Main Floor', -- Title 
            description = 'Hallway', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 3, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[3] = {
            coords = vec(344.28, -584.48, 29.1), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Lower Floor', -- Title 
            description = 'Parking / Reception', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	PillboxHospital2 = {
		[1] = {
            coords = vec(338.34, -583.76, 74.46), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Rooftop', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			jobs = {-- (optional) job authorized access to that floor
                'ambulance'
            },
			floorLevel = 4, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[2] = {
            coords = vec(331.87, -597.23, 43.58), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Main Floor', -- Title 
            description = 'Hallway', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 3, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[3] = {
            coords = vec(340.17, -586.48, 29.1), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Lower Floor', -- Title 
            description = 'Parking / Reception', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	PillboxHospital3 = {
		[1] = {
            coords = vec(338.34, -583.76, 74.46), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Rooftop', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			jobs = {-- (optional) job authorized access to that floor
                'ambulance'
            },
			floorLevel = 4, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[2] = {
            coords = vec(329.83, -602.61, 43.58), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Main Floor', -- Title 
            description = 'Hallway', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 3, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[3] = {
            coords = vec(345.67, -580.82, 29.1), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Lower Floor', -- Title 
            description = 'Parking / Reception', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	PillboxHospital4 = {
		[1] = {
            coords = vec(338.34, -583.76, 74.46), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Rooftop', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			jobs = {-- (optional) job authorized access to that floor
                'ambulance'
            },
			floorLevel = 4, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[2] = {
            coords = vec(329.83, -602.61, 43.58), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Main Floor', -- Title 
            description = 'Hallway', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 3, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[3] = {
            coords = vec(341.53, -582.75, 29.1), -- Coords, if you're new; last number is heading
            heading = 340.0, -- Heading of how will spawn on floor
            title = 'Lower Floor', -- Title 
            description = 'Parking / Reception', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	MountZonahHospital1 = {
		[1] = {
            coords = vec(-453.22, -289.83, 69.83), -- Coords, if you're new; last number is heading
            heading = 107.7, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Private', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 2, -- (optional) your logic-based number of this elavator's floor
			debug = false,			
        },
		[2] = {
            coords = vec(-453.2, -289.8, 35.2), -- Coords, if you're new; last number is heading
            heading = 110.55, -- Heading of how will spawn on floor
            title = 'Main Floor', -- Title 
            description = 'Emergency', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 0, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
		[3] = {
            coords = vec(-420.47, -344.3, 24.52), -- Coords, if you're new; last number is heading
            heading = 110.55, -- Heading of how will spawn on floor
            title = 'Underground Floor', -- Title 
            description = 'Underground Parking', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = -1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
		[4] = {
            coords = vec(-453.291, -289.767, -130.54), -- Coords, if you're new; last number is heading
            heading = 119.055, -- Heading of how will spawn on floor
            title = 'Underground Floor', -- Title 
            description = 'Laboratory / Diagnostic / Surgery', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = -2, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	MountZonahHospital2 = {
		[1] = {
            coords = vec(-436.94, -358.39, 35.24), -- Coords, if you're new; last number is heading
            heading = 354.33, -- Heading of how will spawn on floor
            title = 'Main Floor', -- Title 
            description = 'Parking', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 0, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
		[2] = {
            coords = vec(-420.47, -344.3, 24.52), -- Coords, if you're new; last number is heading
            heading = 110.55, -- Heading of how will spawn on floor
            title = 'Underground Floor', -- Title 
            description = 'Underground Parking', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = -1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	MountZonahHospital3 = {
		[1] = {
            coords = vec(-492.69, -328.55, 69.8), -- Coords, if you're new; last number is heading
            heading = 164.409, -- Heading of how will spawn on floor
            title = 'Higer Floor', -- Title 
            description = 'Entrance 1', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 2, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
		[2] = {
            coords = vec(-492.78, -328.43, 42.6), -- Coords, if you're new; last number is heading
            heading = 170.078, -- Heading of how will spawn on floor
            title = 'Upper Floor', -- Title 
            description = 'Entrance 1', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	MountZonahHospital4 = {
		[1] = {
            coords = vec(-489.72, -328.89, 69.9), -- Coords, if you're new; last number is heading
            heading = 167.24, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Entrance 2', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 2, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
		[2] = {
            coords = vec(-489.81, -328.90, 42.6), -- Coords, if you're new; last number is heading
            heading = 170.07, -- Heading of how will spawn on floor
            title = 'Upper Floor', -- Title 
            description = 'Entrance 2', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
	MountZonahHospital5 = {
		[1] = {
            coords = vec(-486.73, -329.401, 69.800), -- Coords, if you're new; last number is heading
            heading = 161.57, -- Heading of how will spawn on floor
            title = 'Higher Floor', -- Title 
            description = 'Entrance 3', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 2, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
		[2] = {
            coords = vec(-486.725, -329.327, 42.604), -- Coords, if you're new; last number is heading
            heading = 170.07, -- Heading of how will spawn on floor
            title = 'Upper Floor', -- Title 
            description = 'Entrance 3', -- Description
            target = { -- Target length/width
                width = 0.5,
                length = 0.5,
            },
			floorLevel = 1, -- (optional) your logic-based number of this elavator's floor
			debug = false,
        },
	},
}

