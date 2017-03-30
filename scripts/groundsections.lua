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
		file = "images/ground/middle.png",
		width = 320,
		height = 64,
		y = contH-64/2
	},
	["leftGround"] = {
		file = "images/ground/leftedge.png",
		width = 320,
		height = 64,
		y = contH-64/2
	},
	["rightGround"] = {
		file = "images/ground/rightedge.png",
		width = 320,
		height = 64,
		y = contH-64/2
	},
	["hole"] = {
		file = "images/ground/hole.png",
		width = 320,
		height = 64,
		y = contH-64/2
	}
}

return sectionTable