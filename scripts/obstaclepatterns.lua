-----------------------------------------------------------------------------------------
--
-- obstaclepatterns.lua
--
-- Holds the table containing data of obstacle patterns
--
-----------------------------------------------------------------------------------------

----
-- Fields
----
local patternTable = {}

patternTable = {
	[1] = { -- Small tomato single
		name = "tomato_small",
		count = 1,
		space = 0,
		ability = ""
	},
	[2] = { -- Small tomato row
		name = "tomato_small",
		count = 4,
		space = 150,
		ability = ""
	},
	[3] = { -- Small tomato bouncing
		name = "tomato_small",
		count = 1,
		space = 0,
		ability = "bounce"
	},
	[4] = { -- Big tomato single
		name = "tomato_big",
		count = 1,
		space = 0,
		ability = ""
	},
	[5] = { -- Big tomato bouncing
		name = "tomato_big",
		count = 1,
		space = 0,
		ability = "bounce"
	},
	[6] = { -- Broccoli single
		name = "broccoli",
		count = 1,
		space = 0,
		ability = ""
	},
	[7] = { -- Carrot single
		name = "carrot",
		count = 1,
		space = 0,
		ability = ""
	}
}

return patternTable