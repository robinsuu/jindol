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
local sections = require("scripts.levelsections")

----
-- Physics
----
physics.start()
physics.setGravity(0, 9.8) -- Default: Earth gravity (0, 9.8)
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
local memoryText -- Used for memory monitoring
local lastGround -- Values: "hole", "normal". To keep track of the previous type of ground section
local gameSpeed

----
-- Tables
----
local groundTable -- Holds all the ground blocks currently on screen
local nextGroundTable -- Holds all the ground blocks that are about to appear on screen

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

local function initVariables()
	groundTable = {}
	nextGroundTable = {}
	gameSpeed = 1 -- The speed modifier of the game, increases speed on the background/ground. Default: 1
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
	scenery1 = display.newImageRect(backGroup, "images/background/icecreambg.png", 1136, 495)
	scenery1.x = contCX
	scenery1.y = contH-240

	scenery2 = display.newImageRect(backGroup, "images/background/icecreambg.png", 1136, 495)
	scenery2.x = scenery1.x+1136
	scenery2.y = contH-240

	scenery3 = display.newImageRect(backGroup, "images/background/icecreambg.png", 1136, 495)
	scenery3.x = scenery2.x+1136
	scenery3.y = contH-240
end

local function displayGroundBlock(xPos)
	local nextTile = nextGroundTable[#nextGroundTable] -- Get the next block to display
	table.remove(nextGroundTable) -- Remove the block from the table
	
	local newTile = nil -- What to initialize empty local variables to?

	if(nextTile.type == "solid") then
		newTile = display.newImageRect(groundGroup, nextTile.path, nextTile.w, nextTile.h)
		newTile.x = xPos
		newTile.y = nextTile.y
	else -- If not solid, insert a blank
		newTile = display.newRect(groundGroup, xPos, nextTile.y, nextTile.w, nextTile.h)
		newTile.alpha = 0
	end

	groundTable[#groundTable+1] = newTile -- Insert the new block into the display table
	physics.addBody(newTile, "static", { bounce=0, density=10 })
end

local function loadGround()
	nextGroundTable = sections.normalGround()
	lastGround = "normal"
	for i=0, 19, 1 do
		displayGroundBlock(64*i)
	end
end

local function createRandomSection()
	if(mRand(2) == 1) then 
		nextGroundTable = sections:normalGround()
		lastGround = "normal"
	elseif(lastGround ~= "hole") then
		nextGroundTable = sections:hole()
		lastGround = "hole"
	else
		nextGroundTable = sections:normalGround()
		lastGround = "normal"
	end
end

----
-- Update on tick functions
----
local function updateGround()
	-- If the nextGroundTable is empty, create a new randomly selected section
	if(#nextGroundTable == 0) then
		print("<<Create new ground section>>")
		createRandomSection()
	end

	for i=#groundTable, 1, -1 do
		groundTable[i].x = groundTable[i].x - (10 * gameSpeed) -- Move the block to the left Default: 5*3

		if(groundTable[i].x < -64) then -- If the block disappears from view
			display.remove(groundTable[i])
			table.remove(groundTable, i)
			displayGroundBlock(groundTable[#groundTable].x + 64) -- Create and display the next block next to the one furthest away
		end
	end
end

local function updateBackground()
	clouds1.x = clouds1.x - (1 * gameSpeed)
	clouds2.x = clouds2.x - (1 * gameSpeed)
	clouds3.x = clouds3.x - (1 * gameSpeed)

	if(clouds1.x < -414) then
		clouds1.x = clouds3.x + 828
		print("clouds1 pos:" .. clouds1.x .. " Switch!")
	end

	if(clouds2.x < -414) then
		clouds2.x = clouds1.x + 828
		print("clouds2 pos:" .. clouds2.x .. " Switch!")
	end

	if(clouds3.x < -414) then
		clouds3.x = clouds2.x + 828
		print("clouds3 pos:" .. clouds3.x .. " Switch!")
	end
end

local function updateScenery()
	scenery1.x = scenery1.x - (3 * gameSpeed)
	scenery2.x = scenery2.x - (3 * gameSpeed)
	scenery3.x = scenery3.x - (3 * gameSpeed)

	if(scenery1.x < -568) then
		scenery1.x = scenery3.x + 1136
		print("scenery1 pos:" .. scenery1.x .. " Switch!")
	end

	if(scenery2.x < -568) then
		scenery2.x = scenery1.x + 1136
		print("scenery2 pos:" .. scenery2.x .. " Switch!")
	end

	if(scenery3.x < -568) then
		scenery3.x = scenery2.x + 1136
		print("scenery3 pos:" .. scenery3.x .. " Switch!")
	end
end
----
-- Memory monitoring
--
-- https://gist.github.com/JesterXL/5615023
----
local function monitorMemory()
  collectgarbage()
  local sysMem = collectgarbage("count") * 0.001
  local textMem = system.getInfo("textureMemoryUsed") / 1000000
   memoryText.text = "M: " .. math.round(sysMem*10)*0.1 .. " T: " .. math.round(textMem*10)*0.1
end

local function gameLoop(event)
	updateGround()
	updateBackground()
	updateScenery()
	monitorMemory()
end

local function loadEventListeners()
	
end

local function loadTimers()
	Runtime:addEventListener("enterFrame", gameLoop)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	physics.pause() -- Pause physics while everything initializes

	initDisplayGroups()
	sceneGroup:insert(backGroup)
	sceneGroup:insert(uiGroup)
	sceneGroup:insert(mainGroup)
	sceneGroup:insert(groundGroup)
	sceneGroup:insert(heroGroup)

	initVariables()

	loadBackground()
	loadScenery()
	loadGround()
	loadMemoryMonitor()
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