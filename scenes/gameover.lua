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
local menuSheetInfo = require("scripts.menubuttons")
local appodeal = require("plugin.appodeal")
local appodealkey = require ("scripts.appodealkey")

----
-- Image sheets
----
local objectImageSheet, menuButtonImageSheet

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
local continueText, cashText, cashIcon, cashContinueIcon, adContinueIcon, cancelIcon
local cashContinueText, adContinueText, cancelText
local okToContinue
local cash, newCash
local adStarted

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
	adStarted = false
end

local function initImageSheets()
	objectImageSheet = graphics.newImageSheet("images/objects.png", objectSheetInfo:getSheet())
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function loadCash()
	newCash = composer.getVariable("finalCashConsumed")
	cash = heroData:getCash()

	if(cash == nil) then
		cash = 0
	end
end

local function loadUI()
	continueText = display.newEmbossedText(uiGroup, "Continue?", contCX-100, (display.contentHeight/2)-140, "BRLNSR.TTF", 50)
	continueText.anchorX = 0
	continueText:setFillColor(0)

	cashContinueIcon = display.newImageRect(uiGroup, objectImageSheet, objectSheetInfo:getFrameIndex("cash"), 240, 210)
	cashContinueIcon.x = contCX-250
	cashContinueIcon.y = (display.contentHeight/2)

	adContinueIcon = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("film"), 256, 194)
	adContinueIcon.x = contCX
	adContinueIcon.y = (display.contentHeight/2)

	cancelIcon = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("cancel"), 182, 234)
	cancelIcon.x = contCX+250
	cancelIcon.y = (display.contentHeight/2)

	cashIcon = display.newImageRect(uiGroup, objectImageSheet, objectSheetInfo:getFrameIndex("cash"), 80, 70)
	cashIcon.x = contCX-100
	cashIcon.y = (display.contentHeight/2)-200
	cashIcon.anchorX = 0

	cashText = display.newEmbossedText(uiGroup, (cash + newCash), contCX, (display.contentHeight/2)-200, "BRLNSR.TTF", 50)
	cashText.anchorX = 0
	cashText:setFillColor(0)

	cashContinueText = display.newEmbossedText(uiGroup, "5x", contCX-270, (display.contentHeight/2)+130, "BRLNSR.TTF", 40)
	cashContinueText.anchorX = 0
	cashContinueText:setFillColor(0)

	adContinueText = display.newEmbossedText(uiGroup, "Watch ad", contCX-85, (display.contentHeight/2)+130, "BRLNSR.TTF", 40)
	adContinueText.anchorX = 0
	adContinueText:setFillColor(0)

	cancelText = display.newEmbossedText(uiGroup, "Quit", contCX+215, (display.contentHeight/2)+130, "BRLNSR.TTF", 40)
	cancelText.anchorX = 0
	cancelText:setFillColor(0)
end

-- Check whether the player has more than 5 cash, then subtract it
local function payCash()
	if(cash ~= nil) then
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
end

local function continueGame()
	if(okToContinue and composer.getVariable("allowedToQuit")) then
		composer.setVariable("continueGame", true)
		composer.setVariable("continuePerformed", true)
		composer.gotoScene("scenes.game")
	end
end

local function checkCash()
	if(not composer.getVariable("continuePerformed")) then
		payCash()
		continueGame()
	end
end

local function gotoHighScores()
	local allowedToQuit = composer.getVariable("allowedToQuit")
	if(allowedToQuit) then
		composer.setVariable("okToCleanup", true)
		composer.gotoScene("scenes.highscore")
	end
end

----
-- Ads
----
local function adListener(event)
	if(event.phase == "init") then -- Successful initiation
		--appodeal.load("rewardedVideo")
	elseif(event.phase == "failed") then -- The ad failed to load
		print(event.type)
		print(event.isError)
		print(event.response)
	elseif(event.phase == "loaded") then
	end

	if(event.phase == "playbackEnded") then
		print("Video watched! Paying out reward..")
		okToContinue = true
	end

	if(event.phase == "closed" and okToContinue) then
		continueGame()
	end
end

function playAd()
	print("Attempting to play ad")
	if(not composer.getVariable("continuePerformed") and not adStarted) then
		print("Showing ad")
		appodeal.show("rewardedVideo")
		adStarted = true
	end
end

local function initAds()
	local key = appodealkey:getApiKey()
	appodeal.init(adListener, {
		appKey = key,
		locationTracking = false,
		supportedAdTypes = {"rewardedVideo"},
		testMode = true
	})
end

local function loadEventListeners()
	cancelIcon:addEventListener("tap", gotoHighScores)
	cashContinueIcon:addEventListener("tap", checkCash)
	adContinueIcon:addEventListener("tap", playAd)
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

	if(not composer.getVariable("continuePerformed")) then
		initAds()
	end

	initVariables()
	initImageSheets()

	loadCash()
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