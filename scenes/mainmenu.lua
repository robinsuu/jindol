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
local menuBgSheetInfo = require("scripts.mainmenu_images")
local heroData = require("scripts.herodata")
local widget = require("widget")

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
local background1, background2
local hidi, jindol, logo, talkBubble
local playButton, highScoreButton, settingsButton, shareButton, howToPlayButton
local playText, tapToPlayArea
local coins, cash
local coinsText, cashText
local sharedItems -- For sharing to social media/messaging

----
-- Timers
----
local playTextTimer

----
-- Image sheets
----
local menuButtonImageSheet
local menuBgImageSheet

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

local function loadSharedItems()
	sharedItems =
	{
	    --{ type = "image", value = { filename = "images/share/shareimg.png", baseDir = system.ResourceDirectory, } },
	    { type = "string", value = "Come play Jindol Run!" },
	    { type = "url", value = "https://www.lezhin.com/ko/comic/jindoltoon/" },
	}
end

local function initImageSheets()
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
	menuBgImageSheet = graphics.newImageSheet("images/menu/mainmenu_images.png", menuBgSheetInfo:getSheet())
end

local function loadBackground()
	--background = display.newRect(backGroup, contCX, contCY, contW, contH)
	--background:setFillColor(1, 0.6, 0.6)

	background1 = display.newImageRect(backGroup, "images/menu/bg.png", 1136, 752)
	background1.x = contCX
	background1.y = contCY

	hidi = display.newImageRect(backGroup, menuBgImageSheet, menuBgSheetInfo:getFrameIndex("hidi"), 372, 538)
	hidi.x = contW+hidi.width
	hidi.y = contCY-50

	background2 = display.newImageRect(backGroup, "images/menu/bg_front.png", 1136, 514)
	background2.x = contCX
	background2.y = contCY+63

	jindol = display.newImageRect(backGroup, menuBgImageSheet, menuBgSheetInfo:getFrameIndex("jindol"), 472, 484)
	jindol.x = contW+jindol.width
	jindol.y = contCY

	logo = display.newImageRect(backGroup, menuBgImageSheet, menuBgSheetInfo:getFrameIndex("logo"), 570, 302)
	logo.x = contW - (logo.width/2) - 10
	logo.y = -logo.height
	
	talkBubble = display.newImageRect(backGroup, menuBgImageSheet, menuBgSheetInfo:getFrameIndex("talk_bubble"), 160, 119)
	talkBubble.x = 180
	talkBubble.y = talkBubble.height - 20
	talkBubble.alpha = 0
end

local function loadUI()
	--titleText = display.newEmbossedText(uiGroup, "진돌 & 히디!", contCX, 50, native.systemFontBold, 72)

	--playButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_play"), 301, 151)
	--playButton.x = contCX
	--playButton.y = contH-100

	shareButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_share"), 92, 96)
	shareButton.x = 60
	shareButton.y = 60
	shareButton.alpha = 0

	settingsButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_settings"), 88, 88)
	settingsButton.x = contW-60
	settingsButton.y = 60
	settingsButton.alpha = 0

	highScoreButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_highscore"), 96, 60)
	highScoreButton.x = 60
	highScoreButton.y = contH-40
	highScoreButton.alpha = 0

	--shopButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_shop"), 251, 151)
	--shopButton.x = contCX-300
	--shopButton.y = contH-100

	--titleImage = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("34"), 338, 300)
	--titleImage.x = contCX
	--titleImage.y = contCY-50

	coinsText = display.newEmbossedText(uiGroup, "Coins: " .. coins, 10, 140, native.systemFontBold, 36)
	coinsText.anchorX = 0
	coinsText.alpha = 0
	cashText = display.newEmbossedText(uiGroup, "Cash: " .. cash, 10, 180, native.systemFontBold, 36)
	cashText.anchorX = 0
	cashText.alpha = 0

	playText = display.newText(uiGroup, "Tap to play", contCX, contCY, native.systemFont, 72)
	playText:setFillColor(0, 0, 0)
	playText.alpha = 0

	tapToPlayArea = display.newRect(backGroup, contCX, contCY, contW/1.3, contH/1.3)
	tapToPlayArea.alpha = 0
	--background:setFillColor(1, 0.6, 0.6)
end

local function startPlayTextTimer()
	playTextTimer = timer.performWithDelay(2500, 
		function() 
			transition.to(playText, { 
				time = 1250,
				alpha=0.1,
				onComplete=function() 
					transition.to(playText, { time=1250, alpha = 1 })
				end 
				})
		end, 0)
end

local function playButtons()
	transition.to(playText, {
		time = 500,
		alpha = 1,
		onComplete=startPlayTextTimer
		})
	transition.to(shareButton, {
		time = 500,
		alpha = 1
		})
	transition.to(settingsButton, {
		time = 500,
		alpha = 1
		})
	transition.to(highScoreButton, {
		time = 500,
		alpha = 1
		})
	tapToPlayArea.isHitTestable = true
end

local function playTalkBubble()
	transition.to(talkBubble, {
		time = 500,
		alpha = 1,
		onComplete = playButtons
		})
end

local function playLogo()
	transition.to(logo, {
		time = 500,
		y = contH - (logo.height/2) - 10,
		onComplete=playTalkBubble
	})
end

local function playHidi()
	transition.to(hidi, {
		time = 500,
		x = contCX+150,
		onComplete=playLogo
	})
end

local function playJindol()
	transition.to(jindol, {
		time = 500,
		x = contW/3,
		--onComplete=playHidi
	})

		transition.to(hidi, {
		time = 1000,
		x = contCX+150,
		onComplete=playLogo
	})
end

local function playIntro()
	playJindol()
end

local function displayErrorMessage(isSimulator, device)
	if(isSimulator) then
	native.showAlert("Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or the XCode simulator", "OK")
	elseif(device == "apple") then
		-- Popup isn't available, show error message
		native.showAlert("Error", "Can't display the view controller. Are you running iOS 7 or later?", { "OK" })
	else
		native.showAlert( "Cannot send *serviceName* message.", "Please setup your android account or check your network connection (on android this means that the package/app (ie Twitter) is not installed on the device)", { "OK" } )
	end
end

local function displayShare(event)
	local isSimulator = system.getInfo("environment") == "simulator"
	-- Share on Apple phone
	if(system.getInfo("platform") == "ios") then
		local popupName = "activity"
		local isAvailable = native.canShowPopup(popupName)

		if(isAvailable) then
			local listener = {}
			function listener:popup(event)
				print( "name(" .. event.name .. ") type(" .. event.type .. ") activity(" .. tostring(event.activity) .. ") action(" .. tostring(event.action) .. ")" )
			end

			native.showPopup(popupName,
			{
				items = sharedItems,
				listener = listener,
				origin = shareButton.contentBounds,
				permittedArrowDirection = { "up", "down" }
			})
		else
			displayErrorMessage(isSimulator, "apple")
		end
	else -- Share on Android phone
		--local serviceName = event.target.id
		local isAvailable = native.canShowPopup("social")
		if(isAvailable) then
			local listener = {}
			function listener:popup(event)
				            print( "name(" .. event.name .. ") type(" .. event.type .. ") action(" .. tostring(event.action) .. ") limitReached(" .. tostring(event.limitReached) .. ")" )
			end

			native.showPopup("social", 
			{
				service = serviceName, -- The service key is ignored on Android
				message = "Come play Jindol Run!",
				url = "https://www.lezhin.com/ko/comic/jindoltoon/",
				listener = listener,
				image = { { filename = "images/share/shareimg.png", baseDir = system.ResourceDirectory }, },
			})
		else
			displayErrorMessage(isSimulator, "android")
		end
	end
end

local function gotoGame()
	composer.gotoScene("scenes.game")
end

local function gotoHighScore()
	composer.gotoScene("scenes.highscore")
end

local function gotoSettings()
	--timer.pause(playTextTimer)
	composer.showOverlay("scenes.settings", { isModal=true })
end

local function loadEventListeners()
	--playButton:addEventListener("tap", gotoGame)
	highScoreButton:addEventListener("tap", gotoHighScore)
	--playText:addEventListener("tap", gotoGame)
	tapToPlayArea:addEventListener("tap", gotoGame)
	settingsButton:addEventListener("tap", gotoSettings)
	shareButton:addEventListener("tap", displayShare)
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
	loadSharedItems()

	loadBackground()
	playIntro()
	loadUI()
end

-- show()
function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
	--if(system.getInfo("platform") ~= "ios") then
	--	native.setProperty("androidSystemUiVisibility", "immersive")
	--end
		if(playTextTimer) then
			timer.cancel(playTextTimer)
		end
		playTextTimer = nil
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