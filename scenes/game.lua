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
local physicsDef = require("scripts.physicsdef").physicsData(1.0)
local objectSheetInfo = require("scripts.objects")
local heroSheetInfo = require("scripts.hero")
local hidiSheetInfo = require("scripts.hidi")
local menuSheetInfo = require("scripts.menubuttons")

----
-- Physics
----
physics.start()
physics.setGravity(0, 120) -- Default: Earth gravity (0, 9.8). Normal value: 0, 120
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
local hero, hidi
local memoryText -- Used for memory monitoring
local gameSpeed, mainSpeed -- mainSpeed default: 10 (the speed of the interactable objects)
local isJumping, jumpTransition, isDashing, dashTransition, hidiTransition
local obstacleCollisionTransition, heroCollisionTransition
local gameOver, gameOverPerformed
local runtime -- Game time (used to calculate delta time)
local dt -- Delta time
local groundBuffer -- The number of ground sections to be loaded at once
local lastGroundType
local metersRun, meterText
local energy, energyMeter
local coinsConsumed, coinsText, coinsIcon
local cashConsumed, cashText, cashIcon
local foodConsumed, foodText -- To be implemented
local score, scoreText
local velocityX, velocityY -- Keeps track of hero speed
local pauseButton, isPaused -- isPaused determines whether the entire game is paused or not

----
-- Image sheets
----
local objectImageSheet, heroImageSheet, hidiImageSheet, menuButtonImageSheet

----
-- Animations
----
local heroSequences, hidiSequences

----
-- Tables
----
local groundSections -- Holds the properties of the different ground sections
local groundTable -- Holds the actual ground sections displayed in the world
local coinPatterns -- Holds the coordinates for different coin patterns
local coinTable -- Holds the coins displayed in the world
local obstacleTable -- Holds the obstacles displayed in the world
local foodTable -- Holds the food displayed in the world
local cashTable -- Holds the cash displayed in the world

----
-- Timers
----
local coinTimer, dashTimer, foodTimer, cashTimer, energyTimer, hidiTimer

----
-- Display groups
----
local backGroup, uiGroup, mainGroup, groundGroup

----
-- Functions
----
-- If adding more display groups, don't forget to insert them into the scene group at scene:create
local function initDisplayGroups()
	backGroup = display.newGroup()
	uiGroup = display.newGroup()
	mainGroup = display.newGroup()
	groundGroup = display.newGroup()
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
	obstacleTable = {}
	foodTable = {}
	cashTable = {}
	lastGroundType = "middleGround"
	gameSpeed = 1 -- The speed modifier of the game, increases speed on the background/ground. Default: 1
	mainSpeed = 12 -- Default: 10 (the speed of interactable objects)
	isJumping = false
	isDashing = false
	gameOver = false
	gameOverPerformed = false
	runtime = 0
	dt = getDeltaTime()
	metersRun = 0
	coinsConsumed = 0
	cashConsumed = 0
	foodConsumed = 0
	energy = 100 -- Default 0
	score = 0
	velocityX = 0
	velocityY = 0
	coinTimer = nil
	dashTimer = nil
	foodTimer = nil
	cashTimer = nil
	energyTimer = nil
	hidiTimer = nil
	isPaused = false
	composer.setVariable("allowedToQuit", false) -- For making sure that the death animation is finished before you can continue
end

local function initImageSheets()
	objectImageSheet = graphics.newImageSheet("images/objects.png", objectSheetInfo:getSheet())
	heroImageSheet = graphics.newImageSheet("images/hero/hero.png", heroSheetInfo:getSheet())
	hidiImageSheet = graphics.newImageSheet("images/background/hidi.png", hidiSheetInfo:getSheet())
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function initGroundSections()
	groundSections = require("scripts.groundsections")
end

local function initCoinPatterns()
	coinPatterns = require("scripts.coinpatterns")
end

local function loadMemoryMonitor()
	memoryText = display.newText(uiGroup, "", contW-30, 30, native.systemFont, 30)
	memoryText.anchorX = 1
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
	heroSequences = require("scripts.herosequences")
	hidiSequences = require("scripts.hidisequences")
end

local function loadHero()
	hero = display.newSprite(mainGroup, heroImageSheet, heroSequences)
	hero.x = 300 -- Default: 300
	hero.y = contH-157 -- Default: contH-157
	hero.myName = "hero"
	hero:play()

	physics.addBody(hero, "dynamic", physicsDef:get("hero"))
	hero.isFixedRotation = true -- This makes sure the sprite is never rotated unless explicitly told so
	hero.isSleepingAllowed = false -- This makes sure the player falls down gaps
end

local function loadHidi()
	hidi = display.newSprite(mainGroup, hidiImageSheet, hidiSequences)
	hidi.x = 50
	hidi.y = contH-330
	hidi.myName = "hidi"
	hidi:play()
end

local function loadTouchAreas()
	leftTouchArea = display.newRect(uiGroup, contCX/2, contCY*1.5, contW/2, contH/1.05)
	rightTouchArea = display.newRect(uiGroup, contCX*1.5, contCY*1.5, contW/2, contH/1.05)
	leftTouchArea.alpha = 0
	leftTouchArea.isHitTestable = true
	rightTouchArea.alpha = 0
	rightTouchArea.isHitTestable = true
end

local function getObjectIndex(type)
	return objectSheetInfo:getFrameIndex(type)
end

local function getObjectProperties(index)
	return objectSheetInfo:getSheet().frames[index]
end

local function loadUI()
	jumpButton = display.newEmbossedText(uiGroup, "JUMP", 70, contH-40, native.systemFont, 44)
	dashButton = display.newEmbossedText(uiGroup, "DASH", contW-70, contH-40, native.systemFont, 44)
	meterText = display.newEmbossedText(uiGroup, "0 meters", contCX, 30, native.systemFont, 30)
	meterText.anchorX = 0.5 -- Aligned center

	local index = getObjectIndex("coin")
	local properties = getObjectProperties(index)
	coinsIcon = display.newImageRect(uiGroup, objectImageSheet, objectSheetInfo:getFrameIndex("coin"), 35, 35)
	coinsIcon.x = 10
	coinsIcon.y = 30
	coinsIcon.anchorX = 0

	index = getObjectIndex("cash")
	properties = getObjectProperties(index)
	cashIcon = display.newImageRect(uiGroup, objectImageSheet, objectSheetInfo:getFrameIndex("cash"), 40, 35)
	cashIcon.x = 10
	cashIcon.y = 70
	cashIcon.anchorX = 0

	coinsText = display.newEmbossedText(uiGroup, "0", 60, 30, native.systemFont, 30)
	coinsText.anchorX = 0 -- Aligned left
	cashText = display.newEmbossedText(uiGroup, "0", 60, 70, native.systemFont, 30)
	cashText.anchorX = 0 -- Aligned left
	scoreText = display.newEmbossedText(uiGroup, "Score: 0", contCX, 70, native.systemFont, 30)
	scoreText.anchorX = 0.5 -- Aligned middle

	energyMeter = display.newRect(uiGroup, contW-30, 70, (energy * 3), 30)
	energyMeter:setFillColor(0, 0.8, 0)
	energyMeter.anchorX = 1

	pauseButton = display.newImageRect(uiGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("button_x"), 50, 50)
	pauseButton.x = contW-300
	pauseButton.y = 25
end

local function createCash(yPos)
	local index = getObjectIndex("cash")
	local properties = getObjectProperties(index)
	local newCash = display.newImageRect(mainGroup, objectImageSheet, index, properties.width, properties.height)

	newCash.x = contW+100
	newCash.y = yPos
	newCash.myName = "cash"
	physics.addBody(newCash, "static", physicsDef:get("cash"))
	table.insert(cashTable, newCash)
end

local function createRandomCash()
	local randYPos = (contCY+100)-(mRand(300))
	createCash(randYPos)
end

local function createFood(yPos, type)
	local index = getObjectIndex(type)
	local properties = getObjectProperties(index)
	local newFood = display.newImageRect(mainGroup, objectImageSheet, index, properties.width, properties.height)

	newFood.x = contW+100
	newFood.y = yPos
	newFood.myName = type
	physics.addBody(newFood, "static", physicsDef:get(type))
	table.insert(foodTable, newFood)
end

local function createRandomFood()
	local randNum = mRand(2)
	local randYPos = (contCY+100)-(mRand(300))

	if(randNum == 1) then
		createFood(randYPos, "pizza")
	elseif(randNum == 2) then
		createFood(randYPos, "hamburger")
	elseif(randNum == 3) then
		createFood(randYPos, "fries")
	elseif(randNum == 4) then
		createFood(randYPos, "soda")
	elseif(randNum == 5) then
		createFood(randYPos, "chicken")
	end
end

local function createCoin(xPos, yPos)
	--local newCoin = display.newImageRect(mainGroup, "images/items/coin.png", 50, 50)
	local newCoin = display.newImageRect(mainGroup, objectImageSheet, objectSheetInfo:getFrameIndex("coin"), 50, 50)
	newCoin.x = xPos + contW+100
	newCoin.y = yPos
	newCoin.myName = "coin"
	physics.addBody(newCoin, "static", physicsDef:get("coin"))
	table.insert(coinTable, newCoin)
end

local function createRandomCoinPattern()
	local newPattern = nil
	local randNum = mRand(10)

	if(randNum == 9) then
		newPattern = "jindol"
	elseif(randNum > 1)	then
		newPattern = "straightTen"
	end

	if(newPattern ~= nil) then
		for i=1, #coinPatterns[newPattern], 1 do
			local newCoin = coinPatterns[newPattern][i]
			createCoin(newCoin.x, newCoin.y)
		end
	end
end

local function createObstacle(obstacleType, xPos)
	local index = getObjectIndex(obstacleType)
	local properties = getObjectProperties(index)
	local newObstacle = display.newImageRect(mainGroup, objectImageSheet, index, properties.width, properties.height)
	newObstacle.x = xPos
	newObstacle.y = contH-(newObstacle.height/2 + 64) -- Default: contH-(newObstacle.height/2 + 64) -- 64 is the default height of the ground
	newObstacle.myName = obstacleType

	physics.addBody(newObstacle, "static", physicsDef:get(obstacleType))
	newObstacle.isFixedRotation = true

	table.insert(obstacleTable, newObstacle)
end

local function createRandomObstacle(xPos)
	local randNum = mRand(4)
	--randNum = 3
	if(randNum == 1) then
		createObstacle("broccoli", xPos)
	elseif(randNum == 2) then
		createObstacle("carrot", xPos)
	elseif(randNum == 3) then
		createObstacle("tomato_small", xPos-300)
		createObstacle("tomato_small", xPos-150)
		createObstacle("tomato_small", xPos)
		createObstacle("tomato_small", xPos+150)
	elseif(randNum == 4) then
		createObstacle("tomato_big", xPos)
	end
end

local function createGroundSection(name)
	local section = groundSections[name]
	local newObj = display.newImageRect(groundGroup, objectImageSheet, objectSheetInfo:getFrameIndex(name), section.width, section.height)
	newObj.myName = name
	if(#groundTable == 0) then -- This is needed to load the first section
		newObj.x = 0
	else
		newObj.x = groundTable[#groundTable].x + 320 -- This number should be the full width of the ground sections
	end
	newObj.y = section.y

	if(name ~= "hole") then
		physics.addBody(newObj, "static", { bounce=0, density=0 })

		-- Chance of spawning obstacle
		if(metersRun > 10 and mRand(3) == 1 and #obstacleTable < 3 and lastGroundType == "middleGround") then
			createRandomObstacle(newObj.x)
		end
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
		section.x = section.x - (mainSpeed * gameSpeed)-- * dt

		if(section.x <= -640) then
			table.remove(groundTable, i)
			createRandomGroundSection()
		end
	end
end

local function updateObstacles()
	for i=#obstacleTable, 1, -1 do
		local obstacle = obstacleTable[i]
		obstacle.x = (obstacle.x or 0) - (mainSpeed * gameSpeed)-- * dt -- If obstacle.x is false it will use 0 as a fallback value (obstacle.x will be false after a player has collided with it)

		if(obstacle.x <= -100) then
			-- Why no display.remove(obstable) ???
			display.remove(obstacle)
			table.remove(obstacleTable, i)
		end
	end
end

local function updateCash()
	for i=#cashTable, 1, -1 do	
		local cash = cashTable[i]
		cash.x = (cash.x or 0) - (mainSpeed * gameSpeed)-- * dt -- If cash.x is false it will use 0 as a fallback value (cash.x will be false after cash has been consumed)

		if(cash.x <= -100) then
			display.remove(cash)
			table.remove(cashTable, i)
		end
	end
end

local function updateFood()
	for i=#foodTable, 1, -1 do	
		local food = foodTable[i]
		food.x = (food.x or 0) - (mainSpeed * gameSpeed)-- * dt -- If food.x is false it will use 0 as a fallback value (food.x will be false after food has been consumed)

		if(food.x <= -100) then
			display.remove(food)
			table.remove(foodTable, i)
		end
	end
end

local function updateCoins()
	for i=#coinTable, 1, -1 do	
		local coin = coinTable[i]
		coin.x = (coin.x or 0) - (mainSpeed * gameSpeed)-- * dt -- If coin.x is false it will use 0 as a fallback value (coin.x will be false after a coin has been consumed)

		if(coin.x <= -100) then
			display.remove(coin)
			table.remove(coinTable, i)
		end
	end
end

local function updateBackground()
	clouds1.x = clouds1.x - (1 * gameSpeed)-- * dt
	clouds2.x = clouds2.x - (1 * gameSpeed)-- * dt
	clouds3.x = clouds3.x - (1 * gameSpeed)-- * dt

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
	scenery1.x = scenery1.x - (2 * gameSpeed)-- * dt
	scenery2.x = scenery2.x - (2 * gameSpeed)-- * dt
	scenery3.x = scenery3.x - (2 * gameSpeed)-- * dt

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
	foreground1.x = foreground1.x - (3 * gameSpeed)-- * dt
	foreground2.x = foreground2.x - (3 * gameSpeed)-- * dt
	foreground3.x = foreground3.x - (3 * gameSpeed)-- * dt

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

local function updateScore()
	metersRun = metersRun + (0.05 * gameSpeed)-- * dt -- Meter updates depending on game speed
	meterText.text = math.floor(metersRun) .. " meters"

	score = (metersRun) + ((foodConsumed * 5) + (coinsConsumed * 2) + (cashConsumed * 10))
	scoreText.text = "Score: " .. math.floor(score)
end

local function updateScreen()
	updateGround()
	updateCoins()
	updateFood()
	updateCash()
	updateObstacles()
	updateBackground()
	updateForeground()
	updateScenery()
	updateScore()
end

local function cancelHidiMovement()
	if(hidiTimer) then
		timer.cancel(hidiTimer)
	end

	if(hidiTransition) then
		transition.cancel(hidiTransition)
	end
end

local function hidiMoveBack()
	cancelHidiMovement()

	hidiTransition = transition.to(hidi, { time=500, x=-hidi.width })
end

local function hidiMoveForward()
	cancelHidiMovement()

	hidiTimer = timer.performWithDelay(1000, function() 
		hidiTransition = transition.to(hidi, { time=2000, x=50 })
		end, 1)
end

local function popDeath()
	hero:toFront()
	gameOver = true
		timer.performWithDelay(1, function()
		physics.pause()
		--physics.removeBody(hero)
		hero.x = contCX
		hero.y = contCY
		hero:setSequence("pop")
		hero:play()
		--heroCollisionTransition = transition.to(hero, { time=100, rotation=-90, onComplete=function() hero.x = 300 hero:pause() end })
		heroCollisionTransition = transition.to(hero, { 
			delay=1500, 
			time=2500, 
			y=contH+hero.height, 
			onComplete=function() 
				--hero:pause()
				composer.setVariable("allowedToQuit", true)
			end })
	end, 1)
end

local function checkEnergyStatus()

	--[[
	if(energy <= 33) then
		energyMeter:setFillColor(1, 0.2, 0)
	elseif(energy > 33 and energy < 66) then
		energyMeter:setFillColor(1, 1, 0)
	else
		energyMeter:setFillColor(0, 0.8, 0)
	end--]]

	local energyGradient = {
		type = "gradient",
		color1 = { 1, 0.8, 1 }, -- 1, 0.8, 0
		color2 = { 1, 1, 1 }, -- 1, 1, 1
		direction = "right"
	}
	energyMeter.fill = energyGradient

	if(energy <= 0) then
		popDeath()
	end
end

local function addEnergy(energyAdded)
	if(energy < 100) then
		energy = energy + energyAdded
		energyMeter.width = energyMeter.width + (energyAdded * 3)
		checkEnergyStatus()
		if(energy > 100) then
			energy = 100
			energyMeter.width = 100 * 3
			checkEnergyStatus()
		end
	end
end

local function removeEnergy(energyRemoved)
	if(energy > 0) then
		energy = energy - energyRemoved
		energyMeter.width = energyMeter.width - (energyRemoved * 3)
		checkEnergyStatus()
	end
end

local function performJump()
	if(not isDashing) then
		hero:setSequence("jumpUp")
		hero:play()
	end
	
	jumpTransition = transition.to(hero, { time=400, y=hero.y-350, transition=easing.outQuart })
end

local function jump(event)
	if(event.phase == "began" and not isJumping and not gameOver and hero.y < 465 and hero.y > 464) then -- Remove if velocityY == 0 for double jump (this is kind of a side effect though and might be better implemented)
		performJump()
		isJumping = true
	end
end

local function dashEnding()
	if(not gameOver) then
		hero:setSequence("normalRun")
		hero:play()
		hidiMoveForward()
	end
	isDashing = false
	gameSpeed = 1
	transition.cancel(dashTransition)
	
	if(dashTimer) then
		timer.cancel(dashTimer)
	end

	if(energyTimer) then
		timer.cancel(energyTimer)
	end
end

local function performDash()
	hero:setSequence("dashRun")
	hero:play()
	gameSpeed = 2.5

	if(hidiTimer) then
		timer.cancel(hidiTimer)
	end

	if(not gameOver) then
		hidiMoveBack()
	end

	dashTransition = transition.to(hero, { time=1000, y=hero.y })
	dashTimer = timer.performWithDelay(1000, dashEnding, 1)
end

local function dash(event)
	if(event.phase == "began" and not isDashing and hero.y <= contH-157 and not gameOver and energy >= 1) then
		isDashing = true
		performDash()
		energyTimer = timer.performWithDelay(100, function() removeEnergy(2) end, 0)
	end

	if(event.phase == "ended" or event.phase == "cancelled" or hero.y > contH-157) then
		dashEnding()
	end
end

local function consumeFood(food)
	if(not gameOver) then
		transition.to(food, { time=250, x=-100, y=-food.height})

		if(not food.consumed) then
			addEnergy(20)
			foodConsumed = foodConsumed + 1
			food.consumed = true
		end
	end
end

local function consumeCoin(coin)
	if(not gameOver) then
		transition.to(coin, { time=250, x=-100, y=-coin.height})

		if(not coin.consumed) then
			coinsConsumed = coinsConsumed + 1
			coinsText.text = coinsConsumed
			coin.consumed = true
		end
	end
end

local function consumeCash(cash)
	if(not gameOver) then
		transition.to(cash, { time=250, x=-100, y=-cash.height})

		if(not cash.consumed) then
			cashConsumed = cashConsumed + 1
			cashText.text = cashConsumed
			cash.consumed = true
		end
	end
end

local function hidiDeathRun()
	cancelHidiMovement()
	hidi:setSequence("fastRun")
	hidi:play()
	transition.to(hidi, { time=1500, x=contW+hidi.width})
end

local function checkHeroStatus()
	if(isDashing and energy == 0) then
		dashEnding()
	end
end

local function checkHeroPosition()
	-- Check if the player has fallen down a gap
	if(hero.y > contH+hero.height) then
		gameOver = true
		composer.setVariable("allowedToQuit", true)
	end

	-- Adjust hero position if offset
	if(hero.x > 301 or hero.x < 299 and hero.y <= contH-157) then
		hero.x = 300
	end

	if(isJumping) then
		velocityX, velocityY = hero:getLinearVelocity()

		-- If the character stands still it's OK to jump
		if(velocityY == 0) then
			isJumping = false
		end
	end
end

local function performGameOver()
	print("<<Game Over>>")
	hero:pause()
	hidiDeathRun()
	--leftTouchArea:removeEventListener("touch", jump)
	--rightTouchArea:removeEventListener("touch", dash)
	composer.setVariable("finalScore", math.floor(score))
	composer.setVariable("finalMetersRun", math.floor(metersRun))
	composer.setVariable("finalCoinsConsumed", coinsConsumed)
	composer.setVariable("finalCashConsumed", cashConsumed)
	timer.performWithDelay(1000, function() composer.showOverlay("scenes.gameover", { isModal=true }) end, 1) -- Experimental
	--composer.showOverlay("scenes.gameover")
	composer.setVariable("gamePaused", false)
	isPaused = false
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

local function collideWithObstacle(obstacle)
	obstacleCollisionTransition = transition.to(obstacle, { time=300, x=-obstacle.width-100, y=-obstacle.height-100, rotation=-360, 
		onComplete=function() 
		display.remove(obstacle)
	end })

	if(not isDashing) then
		popDeath()
	end
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

		if(didCollide(obj1, obj2, "hero", "coin")) then
			if(obj1.myName == "coin") then
				consumeCoin(obj1)
			else
				consumeCoin(obj2)
			end
		end

		if(didCollide(obj1, obj2, "hero", "cash")) then
			if(obj1.myName == "cash") then
				consumeCash(obj1)
			else
				consumeCash(obj2)
			end
			
		end

		if(didCollide(obj1, obj2, "hero", "pizza") or didCollide(obj1, obj2, "hero", "hamburger")) then
			if(obj1.myName == "pizza" or obj1.myName == "hamburger") then
				consumeFood(obj1)
			else
				consumeFood(obj2)
			end
		end

		if(didCollide(obj1, obj2, "hero", "carrot") or didCollide(obj1, obj2, "hero", "broccoli") or didCollide(obj1, obj2, "hero", "tomato_small") or didCollide(obj1, obj2, "hero", "tomato_big")) then
			local obstacle = nil

			if(obj1.myName == "carrot" or obj1.myName == "broccoli" or obj1.myName == "tomato_small" or obj1.myName == "tomato_big") then
					obstacle = obj1
				else
					obstacle = obj2
			end

			collideWithObstacle(obstacle)
		end
	end
end

local function pauseGame()
	isPaused = true
	composer.setVariable("gamePaused", true)

	physics.pause()

	if(dashTimer) then
		timer.pause(dashTimer)
	end
	if(coinTimer) then
		timer.pause(coinTimer)
	end
	if(foodTimer) then
		timer.pause(foodTimer)
	end
	if(cashTimer) then
		timer.pause(cashTimer)
	end
	if(energyTimer) then
		timer.pause(energyTimer)
	end
	if(hidiTimer) then
		timer.pause(hidiTimer)
	end

	if(jumpTransition) then
		transition.pause(jumpTransition)
	end
	if(dashTransition) then
		transition.pause(dashTransition)
	end
	if(hidiTransition) then
		transition.pause(hidiTransition)
	end
	if(obstacleCollisionTransition) then
		transition.pause(obstacleCollisionTransition)
	end
	if(heroCollisionTransition) then
		transition.pause(heroCollisionTransition)
	end

	--[[
	composer.setVariable("groundTable", groundTable)
	composer.setVariable("coinTable", coinTable)
	composer.setVariable("obstacleTable", obstacleTable)
	composer.setVariable("foodTable", foodTable)
	composer.setVariable("cashTable", cashTable)
	composer.setVariable("gameSpeed", gameSpeed)
	composer.setVariable("mainSpeed", mainSpeed)
	composer.setVariable("lastGroundType", lastGroundType)
	composer.setVariable("isJumping", isJumping)
	composer.setVariable("isDashing", isDashing)
	composer.setVariable("gameOver", gameOver)
	composer.setVariable("gameOverPerformed", gameOverPerformed)
	composer.setVariable("runtime", runtime)
	composer.setVariable("dt", dt)
	composer.setVariable("metersRun", metersRun)
	composer.setVariable("coinsConsumed", coinsConsumed)
	composer.setVariable("cashConsumed", cashConsumed)
	composer.setVariable("foodConsumed", foodConsumed)
	composer.setVariable("energy", energy)
	composer.setVariable("score", score)
	composer.setVariable("velocityX", velocityX)
	composer.setVariable("velocityY", velocityY)
	]]

	hidi:pause()
	hero:pause()

	--Runtime:removeEventListener("enterFrame", gameLoop)
	--Runtime:removeEventListener("collision", onCollision)
	--print(composer.getVariable("gamePaused"))

	print("<<Paused game>>")

	composer.showOverlay("scenes.pause", { isModal=true })
end

local function gameLoop(event)
	--[[
	if(isPaused) then
		checkPauseStatus()
	end]]
	if(not gameOver and not isPaused) then
		checkHeroPosition()
		checkHeroStatus()

		--dt = getDeltaTime()

		if(energy > 0) then
			removeEnergy(0.05)
		end

		updateScreen()

	elseif(gameOver and not gameOverPerformed) then
		performGameOver()
	end
	monitorMemory()
	--[[
	if(composer.getVariable("gamePaused") == false) then
		print("FALSE")
	else
		print("TRUE")
	end]]
end

local function loadEventListeners()
	Runtime:addEventListener("enterFrame", gameLoop)
	leftTouchArea:addEventListener("touch", jump)
	rightTouchArea:addEventListener("touch", dash)
	pauseButton:addEventListener("tap", pauseGame)
	Runtime:addEventListener("collision", onCollision)
end

-- Important: Omit the () after timer callback functions or it will malfunction
local function loadTimers()
	coinTimer = timer.performWithDelay(5000, createRandomCoinPattern, 0)
	foodTimer = timer.performWithDelay(5000, createRandomFood, 0)
	cashTimer = timer.performWithDelay(7000, createRandomCash, 0)
end

local function resumeGame()
--if(not composer.getVariable("gamePaused")) then

	-- IMPORTANT! Any new tables added to the game needs to be added here too
	--[[
	groundTable = composer.getVariable("groundTable")
	coinTable = composer.getVariable("coinTable")
	obstacleTable = composer.getVariable("obstacleTable")
	foodTable = composer.getVariable("foodTable")
	cashTable = composer.getVariable("cashTable")
	gameSpeed = composer.getVariable("gameSpeed")
	mainSpeed = composer.getVariable("mainSpeed")
	lastGroundType = composer.getVariable("lastGroundType")
	isJumping = composer.getVariable("isJumping")
	isDashing = composer.getVariable("isDashing")
	gameOver = composer.getVariable("gameOver")
	gameOverPerformed = composer.getVariable("gameOverPerformed")
	runtime = composer.getVariable("runtime")
	dt = composer.getVariable("dt")
	metersRun = composer.getVariable("metersRun")
	coinsConsumed = composer.getVariable("coinsConsumed")
	cashConsumed = composer.getVariable("cashConsumed")
	foodConsumed = composer.getVariable("foodConsumed")
	energy = composer.getVariable("energy")
	score = composer.getVariable("score")
	velocityX = composer.getVariable("velocityX")
	velocityY = composer.getVariable("velocityY")
	]]

	physics.start()

	--loadEventListeners()

	if(dashTimer) then
		timer.resume(dashTimer)
	end
	if(coinTimer) then
		timer.resume(coinTimer)
	end
	if(foodTimer) then
		timer.resume(foodTimer)
	end
	if(cashTimer) then
		timer.resume(cashTimer)
	end
	if(energyTimer) then
		timer.resume(energyTimer)
	end
	if(hidiTimer) then
		timer.resume(hidiTimer)
	end

	if(jumpTransition) then
		transition.resume(jumpTransition)
	end
	if(dashTransition) then
		transition.resume(dashTransition)
	end
	if(hidiTransition) then
		transition.resume(hidiTransition)
	end
	if(obstacleCollisionTransition) then
		transition.resume(obstacleCollisionTransition)
	end
	if(heroCollisionTransition) then
		transition.resume(heroCollisionTransition)
	end

	hidi:play()
	hero:play()

	isPaused = false

	print("<<Resumed game>>")
--end
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
	sceneGroup:insert(mainGroup)
	sceneGroup:insert(uiGroup)

	initVariables()
	initImageSheets()
	initGroundSections()
	initCoinPatterns()

	loadBackground()
	loadScenery()
	loadForeground()
	loadGround()
	loadMemoryMonitor()
	loadAnimations()
	loadHero()
	loadHidi()
	loadUI()
	loadTouchAreas()

	hero:toBack()
	hidi:toBack()

	print("<<CREATE>>")
end

-- show()
function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
		print("<<WILL SHOW>>")
	elseif (phase == "did") then
		print("<<DID SHOW>>")
		-- Code here runs when the scene is entirely on screen
		if(not composer.getVariable("gamePaused")) then
			physics.start()
			loadTimers()
			loadEventListeners()
			print("fresh start")
		else
			--Runtime:addEventListener("enterFrame", gameLoop)
			--Runtime:addEventListener("collision", onCollision)
			resumeGame()	
			print("resume")
		end
	end
end

-- hide()
function scene:hide(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		print("<<WILL HIDE>>")
		if(not isPaused) then
			-- Code here runs when the scene is on screen (but is about to go off screen)
			physics.pause()
			Runtime:removeEventListener("collision", onCollision)
			Runtime:removeEventListener("enterFrame", gameLoop)

			if(coinTimer) then
				timer.cancel(coinTimer)
			end

			if(foodTimer) then
				timer.cancel(foodTimer)
			end

			if(cashTimer) then
				timer.cancel(cashTimer)
			end

			if(energyTimer) then
				timer.cancel(energyTimer)
			end

			if(dashTimer) then
				timer.cancel(dashTimer)
			end
			dashTimer = nil
			coinTimer = nil
			foodTimer = nil
			cashTimer = nil
			energyTimer = nil
			hidiTimer = nil
		else
			--Runtime:removeEventListener("enterFrame", gameLoop)
			--Runtime:removeEventListener("collision", onCollision)
		end
	elseif (phase == "did") then
		print("<<DID HIDE>>")
		-- Code here runs immediately after the scene goes entirely off screen
		if(not isPaused) then
			physics.stop()
			display.remove(backGroup)
			display.remove(groundGroup)
			display.remove(uiGroup)
			display.remove(mainGroup)
			backGroup, groundGroup, uiGroup, mainGroup = nil, nil, nil, nil
		end
	end
end

-- destroy()
function scene:destroy(event)
	print("<<DESTROYED>>")
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