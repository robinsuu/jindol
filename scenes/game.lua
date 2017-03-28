-----------------------------------------------------------------------------------------
--
-- game.lua
--
-- Holds most of the game's logic
--
-----------------------------------------------------------------------------------------
----
-- Composer
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
physics.setGravity(0, 9.8) -- Default: Earth gravity (0, 9.8). Normal value: 0, 50
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
local isJumping, jumpTransition
local isDashing, dashTransition
local gameOver, gameOverPerformed
local runtime -- Game time
local dt -- Delta time

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
local groundSections
local currentGround

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
	gameSpeed = 1 -- The speed modifier of the game, increases speed on the background/ground. Default: 1
	isJumping = false
	isDashing = false
	gameOver = false
	gameOverPerformed = false
	runtime = 0
	dt = getDeltaTime()
end

local function initGroundSections()
	groundSections = {
		["middle"] = {
			file = "images/ground/middle.png",
			width = 275,
			height = 25,
			y = contH-25/2
		},
		["left"] = {
			file = "images/ground/leftedge.png",
			width = 275,
			height = 25,
			y = contH-25/2
		},
		["right"] = {
			file = "images/ground/rightedge.png",
			width = 275,
			height = 25,
			y = contH-25/2
		},
		["hole"] = {
			file = "images/ground/hole.png",
			width = 275,
			height = 25,
			y = contH-25/2
		}
	}
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
	foreground1.y = contH-100

	foreground2 = display.newImageRect(backGroup, "images/background/cookiebg.png", 1136, 185)
	foreground2.x =	foreground1.x+1136
	foreground2.y = contH-100

	foreground3 = display.newImageRect(backGroup, "images/background/cookiebg.png", 1136, 185)
	foreground3.x = foreground2.x+1136
	foreground3.y = contH-100
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

	-- These are the different sequences (animations) for the imagesheet
	sequences_hero =
	{
		{
			name = "normalRun", -- Name to call the animation in the program
			start = 21, -- Which frame it should start on
			count = 10, -- How many frames that should be animated
			--time = 200, -- The total time of the animation from start to stop in milliseconds (1000 = 1 second)
			loopCount = 0, -- Number of times to loop (0 means infinite)
			loopDirection = "forward", -- "forward" loops from start to end, "bounce" loops from start to end, then backwards to the start again
		},
		{
			name = "jump",
			start = 1,
			count = 20,
			time = 1000,
			loopCount = 0
		}
	}
end

local function loadHero()
	hero = display.newSprite(heroGroup, sheet_hero, sequences_hero)
	hero.x = 300
	hero.y = contH-200
	hero.myName = "hero"
	--hero:setSequence("jump")
	hero:play()

	--physics.addBody(hero, "dynamic", heroPhysicsData:get("hero"))
	physics.addBody(hero, "dynamic", { bounce=0, radius=109 })
	hero.isFixedRotation = true
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
end

local function createGroundSection(name, xPos)
	local section = groundSections[name]
	local newObj = display.newImageRect(groundGroup, section.file, section.width, section.height)
	newObj.x = xPos
	newObj.y = section.y 
	physics.addBody(newObj, "static", { bounce=0 })
end

local function loadGround()
	createGroundSection("middle", 0)
	createGroundSection("middle", 275)
	createGroundSection("middle", 550)
	createGroundSection("middle", 825)
	createGroundSection("middle", 1100)
	createGroundSection("middle", 1375)
	--ground1 = display.newImageRect(groundGroup, groundSheet1, groundSheet1Info:getFrameIndex("ground3x10"), 640, 192)
	--ground1.x = contCX
	--ground1.y = contH-ground1.height/2
end

----
-- Update on tick functions
----
local function updateGround()

end

local function updateBackground()
	clouds1.x = clouds1.x - (1 * gameSpeed) * dt
	clouds2.x = clouds2.x - (1 * gameSpeed) * dt
	clouds3.x = clouds3.x - (1 * gameSpeed) * dt

	if(clouds1.x < -414) then
		clouds1.x = clouds3.x + 828
		--print("clouds1 pos:" .. clouds1.x .. " Switch!")
	end

	if(clouds2.x < -414) then
		clouds2.x = clouds1.x + 828
		--print("clouds2 pos:" .. clouds2.x .. " Switch!")
	end

	if(clouds3.x < -414) then
		clouds3.x = clouds2.x + 828
		--print("clouds3 pos:" .. clouds3.x .. " Switch!")
	end
end

local function updateScenery()
	scenery1.x = scenery1.x - (3 * gameSpeed) * dt
	scenery2.x = scenery2.x - (3 * gameSpeed)* dt
	scenery3.x = scenery3.x - (3 * gameSpeed) * dt

	if(scenery1.x < -568) then
		scenery1.x = scenery3.x + 1136
		--print("scenery1 pos:" .. scenery1.x .. " Switch!")
	end

	if(scenery2.x < -568) then
		scenery2.x = scenery1.x + 1136
		--print("scenery2 pos:" .. scenery2.x .. " Switch!")
	end

	if(scenery3.x < -568) then
		scenery3.x = scenery2.x + 1136
		--print("scenery3 pos:" .. scenery3.x .. " Switch!")
	end
end

local function updateForeground()
	foreground1.x = foreground1.x - (5 * gameSpeed) * dt
	foreground2.x = foreground2.x - (5 * gameSpeed)* dt
	foreground3.x = foreground3.x - (5 * gameSpeed) * dt

	if(foreground1.x < -568) then
		foreground1.x = foreground3.x + 1136
		--print("scenery1 pos:" .. scenery1.x .. " Switch!")
	end

	if(foreground2.x < -568) then
		foreground2.x = foreground1.x + 1136
		--print("scenery2 pos:" .. scenery2.x .. " Switch!")
	end

	if(foreground3.x < -568) then
		foreground3.x = foreground2.x + 1136
		--print("scenery3 pos:" .. scenery3.x .. " Switch!")
	end
end

local function performJump()
	jumpTransition = transition.to(hero, { time=500, y=hero.y-300, transition=easing.outQuart })
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
	end
end

local function dashEnding()
	isDashing = false 
	gameSpeed = 1
	transition.cancel(dashTransition)
end

local function performDash()
	gameSpeed = 10
	dashTransition = transition.to(hero, { time=1000, y=hero.y })
	timer.performWithDelay(1000, dashEnding, 1)
end

local function dash(event)
	if(event.phase == "began" and not isDashing) then
		isDashing = true
		performDash()
	end

	if(event.phase == "ended" or event.phase == "cancelled") then
		dashEnding()
	end
end

local function checkHeroPosition()
	--print(hero.y)
	if(hero.y > contH-64) then
		gameOver = true
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
-- Memory monitoring
-- https://gist.github.com/JesterXL/5615023
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
		updateBackground()
		updateForeground()
		updateScenery()
	elseif(gameOver and not gameOverPerformed) then
		--physics.pause()
		--Runtime:removeEventListener("enterFrame", gameLoop) -- This needs to be removed before game over (though, should it be removed in will hide? or here?)
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

		if(didCollide(obj1, obj2, "hero", "ground")) then
			print("<<Ground and hero collided!>>")
		end
	end
end

local function loadEventListeners()
	Runtime:addEventListener("enterFrame", gameLoop)
	leftTouchArea:addEventListener("touch", jump)
	rightTouchArea:addEventListener("touch", dash)
	--Runtime:addEventListener("collision", onCollision)
end

local function loadTimers()
	
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
		loadEventListeners()
		loadTimers()
	end
end

-- hide()
function scene:hide(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		physics.pause()
		Runtime:removeEventListener("enterFrame", gameLoop)
	elseif (phase == "did") then
		-- Code here runs immediately after the scene goes entirely off screen
		--physics.stop()
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