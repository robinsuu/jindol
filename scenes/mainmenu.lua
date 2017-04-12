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
local menuSheetInfo = require("scripts.menubuttons")
local heroData = require("scripts.herodata")

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
local titleText, titleImage
local playButton, highScoreButton, settingsButton, shareButton, shopButton, howToPlayButton
local coins, cash
local coinsText, cashText

----
-- Image sheets
----
local menuButtonImageSheet

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

local function loadHeroData()
	heroData:loadHeroFromFile()

	coins = composer.getVariable("totalCoinsConsumed")
	cash = composer.getVariable("totalCashConsumed")
end

local function initImageSheets()
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function loadBackground()
	background = display.newRect(backGroup, contCX, contCY, contW, contH)
	background:setFillColor(1, 0.6, 0.6)
end

local function loadUI()
	titleText = display.newEmbossedText(uiGroup, "진돌 & 히디!", contCX, 50, native.systemFontBold, 72)

	playButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_play"), 301, 151)
	playButton.x = contCX
	playButton.y = contH-100

	shareButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_share"), 101, 101)
	shareButton.x = 60
	shareButton.y = 60

	settingsButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_settings"), 101, 101)
	settingsButton.x = contW-60
	settingsButton.y = 60

	highScoreButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_high-score"), 251, 151)
	highScoreButton.x = contCX+300
	highScoreButton.y = contH-100

	shopButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_shop"), 251, 151)
	shopButton.x = contCX-300
	shopButton.y = contH-100

	titleImage = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("34"), 338, 300)
	titleImage.x = contCX
	titleImage.y = contCY-50

	coinsText = display.newEmbossedText(uiGroup, "Coins: " .. coins, 10, 140, native.systemFontBold, 36)
	coinsText.anchorX = 0
	cashText = display.newEmbossedText(uiGroup, "Cash: " .. cash, 10, 180, native.systemFontBold, 36)
	cashText.anchorX = 0
end

local function gotoGame()
	composer.gotoScene("scenes.game")
end

local function gotoHighScore()
	composer.gotoScene("scenes.highscore")
end

local function loadEventListeners()
	--background:addEventListener("tap", gotoGame)
	playButton:addEventListener("tap", gotoGame)
	highScoreButton:addEventListener("tap", gotoHighScore)
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
	loadHeroData()

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
		composer.removeScene("scenes.game", false) -- Try false if it acts weird
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