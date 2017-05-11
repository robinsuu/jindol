-----------------------------------------------------------------------------------------
--
-- settings.lua
--
-- Mainly sound/music settings. This should be used as an overlay
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
local menuSheetInfo = require("scripts.menubuttons")

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
local backButton
local settingsText
local audioText, bgmText
local audioSetting, bgmSetting

----
-- Display groups
----
local backGroup, uiGroup

----
-- Functions
----
-- If adding more display groups, don't forget to insert them into the scene group at scene:create
local function initDisplayGroups()
	backGroup = display.newGroup()
	uiGroup = display.newGroup()
end

local function initImageSheets()
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function loadBackground()
	background = display.newRect(backGroup, contCX, contCY, contW/1.5, contH/1.5)
	background:setFillColor(0.5, 0.8, 1)
end

local function checkSettings()
	if(composer.getVariable("soundActive")) then
		display.remove(audioSetting)
		audioSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxchecked"), 56, 56)
	else
		display.remove(audioSetting)
		audioSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxempty"), 56, 56)
	end

	audioSetting.x = contCX
	audioSetting.y = (display.contentHeight/2)

	if(composer.getVariable("bgmActive")) then
		display.remove(bgmSetting)
		bgmSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxchecked"), 56, 56)
	else
		display.remove(bgmSetting)
		bgmSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxempty"), 56, 56)
	end

	bgmSetting.x = contCX
	bgmSetting.y = (display.contentHeight/2)+70
end

local function loadUI()
	settingsText = display.newEmbossedText(uiGroup, "Settings", contCX, (display.contentHeight/2)-170, "BRLNSR.TTF", 60)
	
	backButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_x"), 101, 101)
	backButton.x = contCX+370
	backButton.y = contH-530

	audioText = display.newEmbossedText(uiGroup, "Audio: ", contCX-100, (display.contentHeight/2), "BRLNSR.TTF", 40)
	bgmText = display.newEmbossedText(uiGroup, "BGM: ", contCX-100, (display.contentHeight/2)+70, "BRLNSR.TTF", 40)

	checkSettings()
end

local function toggleBgm()
	if(composer.getVariable("bgmActive")) then
		composer.setVariable("bgmActive", false)
	else
		composer.setVariable("bgmActive", true)
	end
	checkSettings()
end

local function toggleAudio()
	if(composer.getVariable("soundActive")) then
		composer.setVariable("soundActive", false)
	else
		composer.setVariable("soundActive", true)
	end
	checkSettings()
end

local function gotoMainMenu()
	composer.hideOverlay()
	--composer.gotoScene("scenes.mainmenu")
end

local function loadEventListeners()
	backButton:addEventListener("tap", gotoMainMenu)
	bgmText:addEventListener("tap", toggleBgm)
	audioText:addEventListener("tap", toggleAudio)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	initDisplayGroups()
	sceneGroup:insert(backGroup)
	sceneGroup:insert(uiGroup)

	initImageSheets()
	loadBackground()
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