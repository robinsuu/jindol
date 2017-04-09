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
local tapToRestartText

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

local function loadBackground()
	background = display.newRect(uiGroup, contCX, contCY, contW, contH)
	background.alpha = 0
	--background:setFillColor(0.5, 0.5, 0.5)
	background.isHitTestable = true
end

local function loadText()
	tapToRestartText = display.newEmbossedText(uiGroup, "Game Over! Tap to continue", contCX, (display.contentHeight/2)-200, native.systemFont, 72)
end

local function gotoHighScores()
	--local allowedToQuit = composer.getVariable("allowedToQuit")
	local allowedToQuit = true
	if(allowedToQuit) then
		composer.gotoScene("scenes.highscore")
	end
end

local function loadEventListeners()
	background:addEventListener("tap", gotoHighScores)
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

	loadBackground()
	loadText()
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