-----------------------------------------------------------------------------------------
--
-- hidisequences.lua
--
-- Holds the hidi animations
--
-----------------------------------------------------------------------------------------

----
-- Fields
----
local sequences = {}

sequences =
{
	{
		name = "normalRun",
		start = 1,
		count = 36, -- How many frames that should be animated
		loopCount = 0, -- Number of times to loop (0 means infinite)
		loopDirection = "forward", -- "forward" loops from start to end, "bounce" loops from start to end, then backwards to the start again
	},
	{
		name = "fastRun",
		start = 1,
		count = 36, -- How many frames that should be animated
		time = 200,
		loopCount = 0, -- Number of times to loop (0 means infinite)
		loopDirection = "forward", -- "forward" loops from start to end, "bounce" loops from start to end, then backwards to the start again
	}
}

return sequences