-----------------------------------------------------------------------------------------
--
-- mainmenu.lua
--
-- This is the first screen the player sees after the splash screen
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

----
-- Requires
----
local game = require("scenes.game")
local heroData = require("scripts.herodata")
local objectSheetInfo = require("scripts.objects")

----
-- Image sheets
----
local objectImageSheet

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
local background
local tapToRestartText, continueText, cashText
local okToContinue
local cash, newCash
local cashIcon, cashContinue, adContinue, quitGame

----
-- Display groups
----
local uiGroup

----
-- Functions
----
-- If adding more display groups, don't forget to insert them into the scene group at scene:create
local function initDisplayGroups()
	uiGroup = display.newGroup()
end

local function initVariables()
	okToContinue = false
end

local function initImageSheets()
	objectImageSheet = graphics.newImageSheet("images/objects.png", objectSheetInfo:getSheet())
end

local function loadCash()
	newCash = composer.getVariable("finalCashConsumed")
	cash = heroData:getCash()
end

local function loadBackground()
	--background = display.newRect(uiGroup, contCX, contCY, contW, contH)
	--background.alpha = 0
	--background:setFillColor(0.5, 0.5, 0.5)
	--background = display.newRect(uiGroup, contCX, contCY, contW/1.5, contH/1.5)
	--background:setFillColor(0.5, 0.8, 1)
	--background.isHitTestable = true
end

local function loadUI()
	tapToRestartText = display.newEmbossedText(uiGroup, "Game Over! Tap to quit!", contCX, (display.contentHeight/2)-100, native.systemFont, 72)
	continueText = display.newEmbossedText(uiGroup, "Try again? Tap here!", contCX, (display.contentHeight/2)+100, native.systemFont, 72)
	tapToRestartText:setFillColor(0)
	continueText:setFillColor(0)

	cashIcon = display.newImageRect(uiGroup, objectImageSheet, objectSheetInfo:getFrameIndex("cash"), 80, 70)
	cashIcon.x = contCX-100
	cashIcon.y = (display.contentHeight/2)-200
	cashIcon.anchorX = 0

	cashText = display.newEmbossedText(uiGroup, (cash + newCash), contCX, (display.contentHeight/2)-200, native.systemFont, 50)
	cashText.anchorX = 0
	cashText:setFillColor(0)
end

-- Check whether the player has more than 5 cash, then subtract it
local function checkCash()
	if((newCash + cash >= 5)) then
		for i=0, 4, 1 do
			if(newCash > 0) then -- First use the cash that's been collected during this game session
				newCash = newCash - 1
			else -- Otherwise, use the stored cash
				cash = cash - 1
			end
		end
		composer.setVariable("finalCashConsumed", newCash) -- Update the global with the new value after subtraction
		composer.setVariable("cashToSave", cash)
		heroData:saveCash() -- Update the cash saved to file
		composer.setVariable("cashToSave", 0) -- Reset the global
		okToContinue = true -- Allow the player to continue playing after paying the cash
	end
end

local function continueGame()
	--okToContinue = true

	if(not composer.getVariable("continuePerformed")) then
		checkCash()
	end

	if(okToContinue and composer.getVariable("allowedToQuit")) then
		composer.setVariable("continueGame", true)
		composer.setVariable("continuePerformed", true)
		--composer.hideOverlay()
		--game.continueGame()
		composer.gotoScene("scenes.game")
	end
end

local function gotoHighScores()
	--local allowedToQuit = composer.getVariable("allowedToQuit")
	local allowedToQuit = true
	if(allowedToQuit) then
		composer.gotoScene("scenes.highscore")
	end
end

local function loadEventListeners()
	tapToRestartText:addEventListener("tap", gotoHighScores)
	continueText:addEventListener("tap", continueGame)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	initDisplayGroups()
	sceneGroup:insert(uiGroup)

	initVariables()
	initImageSheets()

	loadCash()
	--loadBackground()
	loadUI()
end

-- show()
function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif (phase == "did") then
		-- Code here runs when the scene is entirely on screen
		--composer.removeScene("scenes.game", false)
		loadEventListeners()
	end
end

-- hide()
function scene:hide(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif (phase == "did") then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end

-- destroy()
function scene:destroy(event)

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene