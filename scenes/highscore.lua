-----------------------------------------------------------------------------------------
--
-- highscore.lua
--
-- This is the high score screen
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
local json = require("json")

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
local titleText, finalScoreText, okText
local filePath
local finalScore, finalMetersRun, finalCoinsConsumed

----
-- Tables
----
local scoresTable

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

local function initVariables()
	filePath = system.pathForFile("scores.json", system.DocumentsDirectory)
	scoresTable = {}
end

local function initImageSheets()
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function loadBackground()
	background = display.newRect(backGroup, contCX, contCY, contW, contH)
	background:setFillColor(1, 0.6, 0.6)
end

local function loadUI()
	highScoreTitleText = display.newEmbossedText(uiGroup, "High Scores", contCX, 50, native.systemFont, 72)

	okText = display.newEmbossedText(uiGroup, "Tap to return to main menu", contCX, contH-50, native.systemFont, 72)

end

local function loadScoresFromFile()
	local file = io.open(filePath, "r")

	if(file) then
		local content = file:read("*a")
		io.close(file)
		scoresTable = json.decode(content)
	end

	if(scoresTable == nil or #scoresTable == 0) then
		scoresTable = { 0, 0, 0, 0, 0 }
	end
end

local function saveScoresToFile()
	for i=#scoresTable, 6, -1 do
		table.remove(scoresTable, i)
	end

	local file = io.open(filePath, "w")

	if(file) then
		file:write(json.encode(scoresTable))
		io.close(file)
	end
end

local function compare(a, b)
	return a > b
end

local function loadScores()
	finalScore = composer.getVariable("finalScore")
	finalMetersRun = composer.getVariable("finalMetersRun")
	finalCoinsConsumed = composer.getVariable("finalCoinsConsumed")

	table.insert(scoresTable, finalScore) -- Insert new score in table

	-- Reset globals
	composer.setVariable("finalScore", 0)
	composer.setVariable("finalMetersRun", 0)
	composer.setVariable("finalCoinsConsumed", 0)

	table.sort(scoresTable, compare) -- Sort scores in order

	saveScoresToFile()

	if(finalScore and finalScore ~= 0) then
		finalScoreText = display.newText(uiGroup, "Your score: " .. finalScore, display.contentCenterX, 150, native.systemFont, 36)
	end

	for i=1, 5 do
		if(scoresTable[i]) then
			local yPos = 200 + (i * 56)

			if(not finalScore or finalScore == 0) then
				yPos = 100 + (i * 56)
			end

			local rankNum = display.newText(uiGroup, "#" .. i, contCX-50, yPos, native.systemFont, 36)
			rankNum:setFillColor(0)
			rankNum.anchorX = 1

			local thisScore = display.newText(uiGroup, scoresTable[i], contCX-30, yPos, native.systemFont, 36)
			thisScore.anchorX = 0
		end
	end
end

local function gotoMenu()
	composer.gotoScene("scenes.mainmenu")
end

local function loadEventListeners()
	 background:addEventListener("tap", gotoMenu)
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
	loadScoresFromFile()
	loadScores()
end

-- show()
function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif (phase == "did") then
		-- Code here runs when the scene is entirely on screen
		--composer.removeScene("scenes.game", false) -- Try false if it acts weird
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