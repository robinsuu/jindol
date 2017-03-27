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
	for i=0, 19, 1 do -- Default 19
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
	--print("sec table ground: " .. #sectionTable)

	return sectionTable
end

function startingGround()
	for i=0, 49, 1 do -- Default 19
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
	--print("sec table ground: " .. #sectionTable)

	return sectionTable
end

function hole()
	for i=0, 9, 1 do -- default 10
		local properties =
		{
			type="hole",
			y=display.contentHeight-32, 
			path="",
			w=128, 
			h=64
		}
		sectionTable[#sectionTable+1] = properties
	end
	--print("sec table hole: " .. #sectionTable)
	return sectionTable
end