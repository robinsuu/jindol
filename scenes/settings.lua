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
local audioIcon, bgmIcon
local audioSetting, bgmSetting
local audioToggleArea, bgmToggleArea

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
	background = display.newImageRect(backGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("settings"), 504, 315)
	background.x = contCX
	background.y = contCY
end

local function pauseBgm()
	audio.pause(1)
end

local function playBgm()
	audio.resume(1)
end

local function checkSettings()
	if(composer.getVariable("soundActive")) then
		display.remove(audioSetting)
		audioSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxchecked"), 72, 66)
	else
		display.remove(audioSetting)
		audioSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxempty"), 45, 42)
	end

	audioSetting.x = contCX+30
	audioSetting.y = (contH/2)-20

	if(composer.getVariable("bgmActive")) then
		display.remove(bgmSetting)
		bgmSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxchecked"), 72, 66)
	else
		display.remove(bgmSetting)
		bgmSetting = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("checkboxempty"), 45, 42)
	end

	bgmSetting.x = contCX+30
	bgmSetting.y = (contH/2)+90
end

local function loadUI()
	backButton = display.newRect(uiGroup, contCX+195, contCY-100, 110, 110)
	backButton.alpha = 0
	backButton.isHitTestable = true

	audioIcon = display.newImageRect(backGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("sound"), 57, 57)
	audioIcon.x = contCX-70
	audioIcon.y = (contH/2)-20

	audioToggleArea = display.newRect(uiGroup, contCX-70, (contH/2)-20, 250, 55)
	audioToggleArea.alpha = 0
	audioToggleArea.isHitTestable = true

	bgmIcon = display.newImageRect(backGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("music"), 48, 63)
	bgmIcon.x = contCX-70
	bgmIcon.y = (contH/2)+90

	bgmToggleArea = display.newRect(uiGroup, contCX-70, (contH/2)+90, 250, 55)
	bgmToggleArea.alpha = 0
	bgmToggleArea.isHitTestable = true

	checkSettings()
end

local function toggleBgm()
	if(composer.getVariable("bgmActive")) then
		composer.setVariable("bgmActive", false)
		pauseBgm()
		print("BGM toggled off")
	else
		composer.setVariable("bgmActive", true)
		playBgm()
		print("BGM toggled on")
	end
	checkSettings()
end

local function toggleAudio()
	if(composer.getVariable("soundActive")) then
		composer.setVariable("soundActive", false)
		print("Audio toggled off")
	else
		composer.setVariable("soundActive", true)
		print("Audio toggled on")
	end
	checkSettings()
end

local function gotoMainMenu()
	composer.hideOverlay()
end

local function loadEventListeners()
	backButton:addEventListener("tap", gotoMainMenu)
	bgmToggleArea:addEventListener("tap", toggleBgm)
	audioToggleArea:addEventListener("tap", toggleAudio)
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