-----------------------------------------------------------------------------------------
--
-- game.lua
--
-- Holds most of the game's logic
--
-----------------------------------------------------------------------------------------
----
-- Composer (scene management)
----
local composer = require("composer")
local scene = composer.newScene()

----
-- Requires
----
local physics = require("physics")
local heroPhysicsData = require("scripts.herophysics").physicsData(1.0)

----
-- Physics
----
physics.start()
physics.setGravity(0, 120) -- Default: Earth gravity (0, 9.8). Normal value: 0, 50
physics.setDrawMode("normal")

----
-- Forward declarations
----
local contCX = display.contentCenterX
local contCY = display.contentCenterY
local contW = display.contentWidth
local contH = display.contentHeight
local mRand = math.random

----
-- Fields
----
local background
local clouds1, clouds2, clouds3
local scenery1, scenery2, scenery3
local foreground1, foreground2, foreground3
local leftTouchArea, rightTouchArea, jumpButton, dashButton
local hero
local memoryText -- Used for memory monitoring
local gameSpeed
local isJumping, jumpTransition, isDashing, dashTransition
local gameOver, gameOverPerformed
local runtime -- Game time (used to calculate delta time)
local dt -- Delta time
local groundBuffer -- The number of ground sections to be loaded at once
local lastGroundType
local metersRun, meterText

----
-- Animations
----
local sheetOptions_hero, sheet_hero, sequences_hero

----
-- Image sheets
----

----
-- Tables
----
local groundSections -- Holds the properties of the different ground sections
local groundTable -- Holds the actual ground sections displayed in the world
local coinPatterns
local coinTable

----
-- Timers
----
local coinTimer

----
-- Display groups
----
local backGroup, uiGroup, mainGroup, groundGroup, heroGroup

----
-- Functions
----
-- If adding more display groups, don't forget to insert them into the scene group at scene:create
local function initDisplayGroups()
	backGroup = display.newGroup()
	uiGroup = display.newGroup()
	mainGroup = display.newGroup()
	groundGroup = display.newGroup()
	heroGroup = display.newGroup()
end

local function getDeltaTime()
    local temp = system.getTimer()  -- Get current game time in ms
    local deltaTime = (temp-runtime) / (1000/60)  -- 60 fps or 30 fps as base
    runtime = temp  -- Store game time
    return deltaTime
end

local function initVariables()
	groundTable = {}
	groundBuffer = 10
	coinTable = {}
	lastGroundType = "middleGround"
	gameSpeed = 1 -- The speed modifier of the game, increases speed on the background/ground. Default: 1
	isJumping = false
	isDashing = false
	gameOver = false
	gameOverPerformed = false
	runtime = 0
	dt = getDeltaTime()
	metersRun = 0
end

local function initGroundSections()
	groundSections = require("scripts.groundsections")
end

local function initCoinPatterns()
	coinPatterns = require("scripts.coinpatterns")
end

local function loadMemoryMonitor()
	memoryText = display.newText(uiGroup, "", contW-150, 30, native.systemFont, 30)
	memoryText:setFillColor(0,0,0)
end

local function loadBackground()
	background = display.newRect(backGroup, contCX, contCY, contW, contH)
	background:setFillColor(0.4, 0.8, 1)

	clouds1 = display.newImageRect(backGroup, "images/background/clouds.png", 828, 241)
	clouds1.x = 0
	clouds1.y = contCY-175

	clouds2 = display.newImageRect(backGroup, "images/background/clouds.png", 828, 241)
	clouds2.x = clouds1.x+828
	clouds2.y = contCY-175

	clouds3 = display.newImageRect(backGroup, "images/background/clouds.png", 828, 241)
	clouds3.x = clouds2.x+828
	clouds3.y = contCY-175
end

local function loadScenery()
	scenery1 = display.newImageRect(backGroup, "images/background/icecreambg.png", 1136, 485)
	scenery1.x = contCX
	scenery1.y = contH-240

	scenery2 = display.newImageRect(backGroup, "images/background/icecreambg.png", 1136, 485)
	scenery2.x = scenery1.x+1136
	scenery2.y = contH-240

	scenery3 = display.newImageRect(backGroup, "images/background/icecreambg.png", 1136, 485)
	scenery3.x = scenery2.x+1136
	scenery3.y = contH-240
end

local function loadForeground()
	foreground1 = display.newImageRect(backGroup, "images/background/cookiebg.png", 1136, 185)
	foreground1.x = contCX
	foreground1.y = contH-90

	foreground2 = display.newImageRect(backGroup, "images/background/cookiebg.png", 1136, 185)
	foreground2.x =	foreground1.x+1136
	foreground2.y = contH-90

	foreground3 = display.newImageRect(backGroup, "images/background/cookiebg.png", 1136, 185)
	foreground3.x = foreground2.x+1136
	foreground3.y = contH-90
end

----
-- Animation functions
----
local function loadAnimations()
	sheetOptions_hero =
	{
		sheetContentWidth = 2000,
		sheetContentHeight = 1000,
		width = 250, -- The width of each frame
		height = 250, -- The height of each frame
		numFrames = 30 -- Total number of frames/images in the spritesheet
	}

	sheet_hero = graphics.newImageSheet("images/hero/hero.png", sheetOptions_hero)

	sequences_hero =
	{
		{
			name = "normalRun",
			start = 21,
			count = 10, -- How many frames that should be animated
			loopCount = 0, -- Number of times to loop (0 means infinite)
			loopDirection = "forward", -- "forward" loops from start to end, "bounce" loops from start to end, then backwards to the start again
		},
		{
			name = "jumpUp",
			start = 1,
			count = 12,
			loopCount = 1
		},
		{
			name = "jumpDown",
			start = 13,
			count = 8,
			time = 400, -- This must be tweaked, or replaced with a transition
			loopCount = 1
		}
	}
end

local function loadHero()
	hero = display.newSprite(heroGroup, sheet_hero, sequences_hero)
	hero.x = 300 -- Default: 300
	hero.y = contH-157 -- Default: contH-157
	hero.myName = "hero"
	hero:play()

	physics.addBody(hero, "dynamic", heroPhysicsData:get("hero"))
	hero.isFixedRotation = true -- This makes sure the sprite is never rotated unless explicitly told so
	hero.isSleepingAllowed = false -- This makes sure the player falls down gaps
end

local function loadTouchAreas()
	leftTouchArea = display.newRect(uiGroup, contCX/2, contCY*1.5, contW/2, contH/1.05)
	rightTouchArea = display.newRect(uiGroup, contCX*1.5, contCY*1.5, contW/2, contH/1.05)
	leftTouchArea.alpha = 0
	leftTouchArea.isHitTestable = true
	rightTouchArea.alpha = 0
	rightTouchArea.isHitTestable = true
end

local function loadUI()
	jumpButton = display.newEmbossedText(uiGroup, "JUMP", 70, contH-40, native.systemFont, 44)
	dashButton = display.newEmbossedText(uiGroup, "DASH", contW-70, contH-40, native.systemFont, 44)
	meterText = display.newEmbossedText(uiGroup, "0 meters", contCX, 30, native.systemFont, 30)
end

local function createCoin(xPos, yPos)
	local newCoin = display.newImageRect(mainGroup, "images/items/coin.png", 50, 50)
	newCoin.x = xPos + contW+100
	newCoin.y = yPos
	table.insert(coinTable, newCoin)
end

local function createRandomCoinPattern()
	local newPattern = nil
	local randNum = mRand(10)

	if(randNum == 10) then
		newPattern = "jindol"
	elseif(randNum > 1)	then
		newPattern = "straightFive"
	end

	if(newPattern ~= nil) then
		for i=1, #coinPatterns[newPattern], 1 do
			local newCoin = coinPatterns[newPattern][i]
			createCoin(newCoin.x, newCoin.y)
		end
	end
end

local function createGroundSection(name)
	local section = groundSections[name]
	local newObj = display.newImageRect(groundGroup, section.file, section.width, section.height)
	newObj.myName = name
	if(#groundTable == 0) then -- This is needed to load the first section
		newObj.x = 0
	else
		newObj.x = groundTable[#groundTable].x + 320 -- This number should be the full width of the ground sections
	end
	newObj.y = section.y 

	if(name ~= "hole") then
		physics.addBody(newObj, "static", { bounce=0 })
	end

	table.insert(groundTable, newObj)
end

local function createRandomGroundSection()
	if(lastGroundType == "hole") then
		createGroundSection("leftGround")
		lastGroundType = "leftGround"
	elseif(lastGroundType == "leftGround" or lastGroundType == "middleGround") then
		if(mRand(4) == 1) then
			createGroundSection("rightGround")
			lastGroundType = "rightGround"
		else
			createGroundSection("middleGround")
			lastGroundType = "middleGround"
		end
	elseif(lastGroundType == "rightGround") then
		lastGroundType = "hole"
		createGroundSection("hole")
	end
end

local function loadGround()
	for i=1, groundBuffer, 1 do
		createGroundSection("middleGround")
	end
end

----
-- Update on new frame functions
----
local function updateGround()
	for i=#groundTable, 1, -1 do
		local section = groundTable[i]
		section.x = section.x - (10 * gameSpeed) * dt

		if(section.x <= -640) then
			table.remove(groundTable, i)
			createRandomGroundSection()
		end
	end
end

local function updateCoins()
	for i=#coinTable, 1, -1 do
		local coin = coinTable[i]
		coin.x = coin.x - (10 * gameSpeed) * dt

		if(coin.x <= -100) then
			table.remove(coinTable, i)
		end
	end
end

local function updateBackground()
	clouds1.x = clouds1.x - (1 * gameSpeed) * dt
	clouds2.x = clouds2.x - (1 * gameSpeed) * dt
	clouds3.x = clouds3.x - (1 * gameSpeed) * dt

	if(clouds1.x < -414) then
		clouds1.x = clouds3.x + 828
	end

	if(clouds2.x < -414) then
		clouds2.x = clouds1.x + 828
	end

	if(clouds3.x < -414) then
		clouds3.x = clouds2.x + 828
	end
end

local function updateScenery()
	scenery1.x = scenery1.x - (2 * gameSpeed) * dt
	scenery2.x = scenery2.x - (2 * gameSpeed)* dt
	scenery3.x = scenery3.x - (2 * gameSpeed) * dt

	if(scenery1.x < -568) then
		scenery1.x = scenery3.x + 1136	end

	if(scenery2.x < -568) then
		scenery2.x = scenery1.x + 1136
	end

	if(scenery3.x < -568) then
		scenery3.x = scenery2.x + 1136
	end
end

local function updateForeground()
	foreground1.x = foreground1.x - (3 * gameSpeed) * dt
	foreground2.x = foreground2.x - (3 * gameSpeed)* dt
	foreground3.x = foreground3.x - (3 * gameSpeed) * dt

	if(foreground1.x < -568) then
		foreground1.x = foreground3.x + 1136
	end

	if(foreground2.x < -568) then
		foreground2.x = foreground1.x + 1136
	end

	if(foreground3.x < -568) then
		foreground3.x = foreground2.x + 1136
	end
end

local function updateMetersRun()
	metersRun = metersRun + (0.05 * gameSpeed) * dt -- Meter updates depending on game speed
	meterText.text = math.floor(metersRun) .. " meters"
end

local function performJump()
	hero:setSequence("jumpUp")
	hero:play()
	
	jumpTransition = transition.to(hero, { time=600, y=hero.y-300, transition=easing.outQuart })
end

local function jump(event)
	local velocityX, velocityY = hero:getLinearVelocity()

	-- If the character stands still it's OK to jump
	if(velocityY == 0) then
		isJumping = false
	end

	if(event.phase == "began" and not isJumping and velocityY == 0) then
		isJumping = true
		performJump()
	end

	if(event.phase == "ended" or event.phase == "cancelled") then
		transition.cancel(jumpTransition)
		if(hero.y <= contCY-100 and not isDashing) then
			hero:setSequence("jumpDown")
			hero:play()
		end
	end
end

local function dashEnding()
	isDashing = false 
	gameSpeed = 1
	transition.cancel(dashTransition)
end

local function performDash()
	gameSpeed = 5
	dashTransition = transition.to(hero, { time=500, y=hero.y })
	timer.performWithDelay(500, dashEnding, 1)
end

local function dash(event)
	if(event.phase == "began" and not isDashing and hero.y <= contH-157) then
		isDashing = true
		performDash()
	end

	if(event.phase == "ended" or event.phase == "cancelled" or hero.y > contH-157) then
		dashEnding()
	end
end

local function checkHeroPosition()
	-- Check if the player has fallen down a gap
	if(hero.y > contH-64) then
		gameOver = true
	end

	-- Adjust hero position if offset
	if(hero.x > 301 or hero.x < 299 and hero.y <= contH-157) then
		hero.x = 300
	end
end

local function performGameOver()
	print("<<Game Over>>")
	leftTouchArea:removeEventListener("tap", jump)
	rightTouchArea:removeEventListener("tap", dash)
	composer.showOverlay("scenes.gameover")
	gameOverPerformed = true
end

----
-- Memory monitoring (https://gist.github.com/JesterXL/5615023)
----
local function monitorMemory()
  	collectgarbage()
  	local sysMem = collectgarbage("count") * 0.001
  	local textMem = system.getInfo("textureMemoryUsed") / 1000000
	memoryText.text = "M: " .. math.round(sysMem*10)*0.1 .. " T: " .. math.round(textMem*10)*0.1
end

local function gameLoop(event)
	if(not gameOver) then
		checkHeroPosition()
		dt = getDeltaTime()
		updateGround()
		updateCoins()
		updateBackground()
		updateForeground()
		updateScenery()
		updateMetersRun()
	elseif(gameOver and not gameOverPerformed) then
		performGameOver()
	end
	monitorMemory()
end

----
-- Returns true if the two specified objects collided
--
-- obj1, obj2: the two objects that collided
-- name1, name2: the name of the two objects to check
----
local function didCollide(obj1, obj2, name1, name2)
	local collided = false

	if((obj1.myName == name1 and obj2.myName == name2) or 
		(obj1.myName == name2 and obj2.myName == name1))
	then
		collided = true
	else
		collided = false
	end

	return collided
end

local function onCollision(event)
	if(event.phase == "began") then
		local obj1 = event.object1
		local obj2 = event.object2

		-- Reset run animation when colliding with ground
		if(didCollide(obj1, obj2, "hero", "middleGround") or didCollide(obj1, obj2, "hero", "leftGround") or didCollide(obj1, obj2, "hero", "rightGround")) then
			if(hero ~= nil and (hero.sequence == "jumpDown" or hero.sequence == "jumpUp")) then
				hero:setSequence("normalRun")
				hero:play()
			end
		end
	end
end

local function loadEventListeners()
	Runtime:addEventListener("enterFrame", gameLoop)
	leftTouchArea:addEventListener("touch", jump)
	rightTouchArea:addEventListener("touch", dash)
	Runtime:addEventListener("collision", onCollision)
end

-- Important: Omit the () after timer callback functions or it will malfunction
local function loadTimers()
	coinTimer = timer.performWithDelay(5000, createRandomCoinPattern, 0)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	--physics.pause() -- Pause physics while everything initializes
	initDisplayGroups()
	sceneGroup:insert(backGroup)
	sceneGroup:insert(groundGroup)
	sceneGroup:insert(uiGroup)
	sceneGroup:insert(mainGroup)
	sceneGroup:insert(heroGroup)

	initVariables()
	initGroundSections()
	initCoinPatterns()

	loadBackground()
	loadScenery()
	loadForeground()
	loadGround()
	loadMemoryMonitor()
	loadAnimations()
	loadHero()
	loadUI()
	loadTouchAreas()
end

-- show()
function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif (phase == "did") then
		-- Code here runs when the scene is entirely on screen
		physics.start()
		loadTimers()
		loadEventListeners()
	end
end

-- hide()
function scene:hide(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		physics.pause()
		Runtime:removeEventListener("collision", onCollision)
		Runtime:removeEventListener("enterFrame", gameLoop)
		timer.cancel(coinTimer)
		coinTimer = nil
	elseif (phase == "did") then
		-- Code here runs immediately after the scene goes entirely off screen
		display.remove(backGroup)
		display.remove(groundGroup)
		display.remove(uiGroup)
		display.remove(mainGroup)
		display.remove(heroGroup)
		backGroup, groundGroup, uiGroup, mainGroup, heroGroup = nil, nil, nil, nil, nil
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