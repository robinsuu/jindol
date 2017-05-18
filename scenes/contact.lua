-----------------------------------------------------------------------------------------
--
-- contact.lua
--
-- Contains contact info for the game/developer and support
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
local websiteLink, emailLink, websiteText, emailText
local url, email

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

local function initVariables()
	url = "https://www.lezhin.com/ko/comic/jindoltoon/"
	email = "walkcabbage@naver.com"
end

local function initImageSheets()
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function loadBackground()
	background = display.newImageRect(backGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("contact"), 498, 310)
	background.x = contCX
	background.y = contCY
end

local function loadUI()
	websiteText = display.newText(uiGroup, "Visit our website at:", contCX, (display.contentHeight/2)-30, "BRLNSR.TTF", 24)
	websiteText:setFillColor(0)
	websiteLink = display.newText(uiGroup, "https://www.lezhin.com/ko/comic/jindoltoon/", contCX, (display.contentHeight/2), "BRLNSR.TTF", 24)
	websiteLink:setFillColor(0, 0.8, 1)
	
	emailText = display.newText(uiGroup, "E-mail us at:", contCX, (display.contentHeight/2)+50, "BRLNSR.TTF", 24)
	emailText:setFillColor(0)
	emailLink = display.newText(uiGroup, "walkcabbage@naver.com", contCX, (display.contentHeight/2)+80, "BRLNSR.TTF", 24)
	emailLink:setFillColor(0, 0.8, 1)
	
	backButton = display.newRect(uiGroup, contCX+195, contCY-100, 110, 110)
	backButton:setFillColor(0)
	backButton.alpha = 0
	backButton.isHitTestable = true
end

local function gotoMainMenu()
	composer.hideOverlay()
end

local function gotoUrl()
	if(system.canOpenURL(url)) then
		system.openURL(url)
	else
		native.showPopup("Could not open website")
	end
end

local function gotoEmail()
	if(system.canOpenURL("mailto:" .. email)) then
		system.openURL("mailto:" .. email)
	else
		native.showPopup("Could not open mail client")
	end
end

local function loadEventListeners()
	backButton:addEventListener("tap", gotoMainMenu)
	websiteLink:addEventListener("tap", gotoUrl)
	websiteText:addEventListener("tap", gotoUrl)
	emailLink:addEventListener("tap", gotoEmail)
	emailText:addEventListener("tap", gotoEmail)
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

	initVariables()
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