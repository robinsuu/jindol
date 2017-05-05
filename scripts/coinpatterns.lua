-----------------------------------------------------------------------------------------
--
-- coinpatterns.lua
--
-- Holds the table containing data of coin patterns
--
-----------------------------------------------------------------------------------------
----
-- Forward declarations
----
local contCX = display.contentCenterX
local contCY = display.contentCenterY
local contW = display.contentWidth
local contH = display.contentHeight
local baseY = contCY-150
local baseX = 50

----
-- Fields
----
local coinTable = {}

coinTable = {
	straightTen = {
		{ x=baseX*0, y=baseY+50 }, -- 1
		{ x=baseX*1, y=baseY+100 },-- 2
		{ x=baseX*2, y=baseY+50 }, -- 3
		{ x=baseX*3, y=baseY+100 },-- 4
		{ x=baseX*4, y=baseY+50 }, -- 5
		{ x=baseX*5, y=baseY+100 },-- 6
		{ x=baseX*6, y=baseY+50 },-- 7
		{ x=baseX*7, y=baseY+100 },-- 8
		{ x=baseX*8, y=baseY+50 },-- 9
		{ x=baseX*9, y=baseY+100 }-- 10
	},
	zigzag = {
		{ x=baseX*0, y=baseY },
		{ x=baseX*1, y=baseY+50 },
		{ x=baseX*2, y=baseY+100 },
		{ x=baseX*3, y=baseY+150 },
		{ x=baseX*4, y=baseY+100 },
		{ x=baseX*5, y=baseY+50 },
		{ x=baseX*6, y=baseY },
		{ x=baseX*7, y=baseY+50 },
		{ x=baseX*8, y=baseY+100 },
		{ x=baseX*9, y=baseY+150 },
		{ x=baseX*10, y=baseY+100 },
		{ x=baseX*11, y=baseY+50 },
		{ x=baseX*12, y=baseY },
		{ x=baseX*13, y=baseY+50 },
		{ x=baseX*14, y=baseY+100 },
		{ x=baseX*15, y=baseY+150 },
		{ x=baseX*16, y=baseY+100 },
		{ x=baseX*17, y=baseY+50 },
		{ x=baseX*18, y=baseY },
		{ x=baseX*19, y=baseY+50 },
		{ x=baseX*20, y=baseY+100 },
		{ x=baseX*21, y=baseY+150 },
	},
	jindol = {
		-- J
		{ x=baseX*0, y=baseY },
		{ x=baseX*0, y=baseY+100 },
		{ x=baseX*1, y=baseY },
		{ x=baseX*1, y=baseY+150 },
		{ x=baseX*2, y=baseY },
		{ x=baseX*2, y=baseY+150 },
		{ x=baseX*3, y=baseY },
		{ x=baseX*3, y=baseY+50 },
		{ x=baseX*3, y=baseY+100 },
		-- I
		{ x=baseX*5, y=baseY },
		{ x=baseX*5, y=baseY+50 },
		{ x=baseX*5, y=baseY+100 },
		{ x=baseX*5, y=baseY+150 },
		-- N
		{ x=baseX*7, y=baseY },
		{ x=baseX*7, y=baseY+50 },
		{ x=baseX*7, y=baseY+100 },
		{ x=baseX*7, y=baseY+150 },
		{ x=baseX*8, y=baseY+50 },
		{ x=baseX*9, y=baseY+100 },
		{ x=baseX*10, y=baseY },
		{ x=baseX*10, y=baseY+50 },
		{ x=baseX*10, y=baseY+100 },
		{ x=baseX*10, y=baseY+150 },
		-- D
		{ x=baseX*12, y=baseY },
		{ x=baseX*12, y=baseY+50 },
		{ x=baseX*12, y=baseY+100 },
		{ x=baseX*12, y=baseY+150 },
		{ x=baseX*13, y=baseY },
		{ x=baseX*13, y=baseY+150 },
		{ x=baseX*14, y=baseY+50 },
		{ x=baseX*14, y=baseY+100 },
		-- O
		{ x=baseX*16, y=baseY+50 },
		{ x=baseX*16, y=baseY+100 },
		{ x=baseX*17, y=baseY },
		{ x=baseX*17, y=baseY+150 },
		{ x=baseX*18, y=baseY },
		{ x=baseX*18, y=baseY+150 },
		{ x=baseX*19, y=baseY+50 },
		{ x=baseX*19, y=baseY+100 },
		-- L
		{ x=baseX*21, y=baseY },
		{ x=baseX*21, y=baseY+50 },
		{ x=baseX*21, y=baseY+100 },
		{ x=baseX*21, y=baseY+150 },
		{ x=baseX*22, y=baseY+150 },
		{ x=baseX*23, y=baseY+150 },
	},
}

return coinTable