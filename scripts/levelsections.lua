-----------------------------------------------------------------------------------------
--
-- levelsections.lua
--
-- Different ground sections represented as tables of properties
--
-- Default length: 19
--
-----------------------------------------------------------------------------------------
module(..., package.seeall)
local sectionTable = {}

function normalGround()
	--local test = number
	--print(type(test))
	for i=0, 19, 1 do
		local properties =
		{
			type="solid",
			y=display.contentHeight-32, 
			path="images/ground/groundtile1.png",
			w=64, 
			h=64
		}
		sectionTable[#sectionTable+1] = properties
	end

	return sectionTable
end

function hole()
	for i=0, 10, 1 do
		local properties =
		{
			type="hole",
			y=display.contentHeight-32, 
			path="",
			w=64, 
			h=64
		}

		sectionTable[#sectionTable+1] = properties
	end

	return sectionTable
end