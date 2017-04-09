-----------------------------------------------------------------------------------------
--
-- herosequences.lua
--
-- Holds the hero animations
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
		start = 72,
		count = 9, -- How many frames that should be animated
		loopCount = 0, -- Number of times to loop (0 means infinite)
		loopDirection = "forward", -- "forward" loops from start to end, "bounce" loops from start to end, then backwards to the start again
	},
	{
		name = "jumpUp",
		start = 23,
		count = 12,
		loopCount = 1
	},
	{
		name = "jumpDown",
		start = 35,
		count = 8,
		time = 400, -- This must be tweaked, or replaced with a transition
		loopCount = 1
	},
	{
		name = "dashRun",
		start = 7,
		count = 7,
		loopCount = 0,
		time = 150,
		--time = 100, -- This must be tweaked, or replaced with a transition
		--loopCount = 1
	},
	{
		name = "pop",
		start = 43,
		count = 28,
		loopCount = 1,
		time = 700,
	}
}

return sequences