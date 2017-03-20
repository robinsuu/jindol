-----------------------------------------------------------------------------------------
--
-- levelsections.lua
--
-- Different ground sections represented as table of properties
--
-----------------------------------------------------------------------------------------
local section = {}
local sectionTable = {}

function section:normalGround()
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

function section:holeGround()
	for i=0, 19, 1 do
		local properties =
		{
			type="hole",
			y=display.contentHeight-32, 
			path="images/ground/groundtile1.png",
			w=64, 
			h=64
		}

		if(i > 6) then
			properties.type = "solid"
		end
		sectionTable[#sectionTable+1] = properties
	end

	return sectionTable
end

return section