-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Jindol Run v 0.1
--
-----------------------------------------------------------------------------------------

local composer = require("composer")

composer.isDebug = true -- Turn off on release
--composer.recycleOnSceneChange = true -- Try setting this if strange things happen with composer scene changes

display.setStatusBar(display.HiddenStatusBar)

-- Seed the random number generator
math.randomseed(os.time())

-- The below should be removed on release:
print("________________________________")
print("App init messages:")
print("________________________________")
print("Scale factor: " .. (display.pixelWidth / display.actualContentWidth)) -- This shows the scale factor of the device
local deviceWidth = (display.contentWidth - (display.screenOriginX * 2) ) / display.contentScaleX
local scaleFactor = (deviceWidth / display.contentWidth)
print("Scale factor according to Corona docs: " .. scaleFactor)
print("Design area: W:" .. display.contentWidth .. " H:" .. display.contentHeight)
print("Actual area: W:" .. display.actualContentWidth .. " H:" .. display.actualContentHeight)
print("________________________________")

-- Starts at the main menu screen
composer.gotoScene("scenes.mainmenu")