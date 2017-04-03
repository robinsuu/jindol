-----------------------------------------------------------------------------------------
--
-- groundsections.lua
--
-- Holds the table containing data of ground sections
--
-----------------------------------------------------------------------------------------
----
-- Forward declarations
----
local contCX = display.contentCenterX
local contCY = display.contentCenterY
local contW = display.contentWidth
local contH = display.contentHeight

----
-- Fields
----
local sectionTable = {}

sectionTable = {
	["middleGround"] = {
		width = 320,
		height = 64,
		y = contH-64/2
	},
	["leftGround"] = {
		width = 320,
		height = 64,
		y = contH-64/2
	},
	["rightGround"] = {
		width = 320,
		height = 64,
		y = contH-64/2
	},
	["hole"] = {
		width = 320,
		height = 64,
		y = contH-64/2
	}
}

return sectionTable