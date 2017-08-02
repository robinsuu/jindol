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
local background1, background2, foreground
local titleText, scoreText, okText
local highscoreFilePath
local score, metersRun, coinsConsumed, cashConsumed
local totalMeters, totalCoins, totalCash

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
	highscoreFilePath = system.pathForFile("scores.json", system.DocumentsDirectory)
	scoresTable = {}
	score = 0
	metersRun = 0
	coinsConsumed = 0
	cashConsumed = 0
	totalScore = 0
	totalMeters = 0
	totalCoins = 0
	totalCash = 0
end

local function initImageSheets()
	menuButtonImageSheet = graphics.newImageSheet("images/menu/menubuttons.png", menuSheetInfo:getSheet())
end

local function loadBackground()
	background1 = display.newImageRect(backGroup, "images/menu/bg.png", 1136, 752)
	background1.x = contCX
	background1.y = contCY

	background2 = display.newImageRect(backGroup, "images/menu/bg_front.png", 1136, 514)
	background2.x = contCX
	background2.y = contCY+63

	foreground = display.newImageRect(backGroup, menuButtonImageSheet, menuSheetInfo:getFrameIndex("score"), 499, 355)
	foreground.x = contCX
	foreground.y = contCY
end

local function loadUI()
	highScoreTitleText = display.newEmbossedText(uiGroup, "High Scores", contCX, 50, "BRLNSR.TTF", 72)

	okText = display.newEmbossedText(uiGroup, "Return", contCX, contH-50, "BRLNSR.TTF", 72)
end

local function loadScoresFromFile()
	local file = io.open(highscoreFilePath, "r")

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

	local file = io.open(highscoreFilePath, "w")

	if(file) then
		file:write(json.encode(scoresTable))
		io.close(file)
	end
end

local function compare(a, b)
	return a > b
end

local function loadScores()
	score = composer.getVariable("lastScore")

	table.insert(scoresTable, score) -- Insert new score in table

	table.sort(scoresTable, compare) -- Sort scores in order

	saveScoresToFile()

	if(score and score ~= 0) then
		scoreText = display.newEmbossedText(uiGroup, "Your score: " .. score, display.contentCenterX, 120, "BRLNSR.TTF", 36)
	end

	for i=1, 5 do
		if(scoresTable[i]) then
			local yPos = 230 + (i * 30) -- Default 230 + (i * 30)

			local rankNum = display.newText(uiGroup, "#" .. i, contCX-30, yPos, "BRLNSR.TTF", 24)
			rankNum:setFillColor(0)
			rankNum.anchorX = 0.5

			local thisScore = display.newText(uiGroup, scoresTable[i], contCX-10, yPos, "BRLNSR.TTF", 24)
			thisScore.anchorX = 0
			thisScore:setFillColor(0)
		end
	end
end

local function loadHeroData()
	totalMeters = composer.getVariable("totalMetersRun")
	totalCoins = composer.getVariable("totalCoinsConsumed")
	totalCash = composer.getVariable("totalCashConsumed")

	print("<Last score:> " .. score .. " <Meters:> " .. totalMeters .. " <Coins:> " .. totalCoins .. " <Cash:> " .. totalCash)
end

local function gotoMenu()
	composer.gotoScene("scenes.mainmenu")
end

local function loadEventListeners()
	background1:addEventListener("tap", gotoMenu)
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
	heroData:saveHeroToFile()
	loadScoresFromFile()
	loadScores()
	loadHeroData()
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