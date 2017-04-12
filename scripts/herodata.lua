-----------------------------------------------------------------------------------------
--
-- herodata.lua
--
-- Functions for accessing and storing data about the hero
--
-----------------------------------------------------------------------------------------

----
-- Requires
----
local composer = require("composer")
local json = require("json")

----
-- Fields
----
local M = {}
local heroFilePath = system.pathForFile("hero.json", system.DocumentsDirectory)
local heroTable = {}

-- Not used
function M:clearGlobals()
	composer.setVariable("finalScore", 0)
	composer.setVariable("finalMetersRun", 0)
	composer.setVariable("finalCoinsConsumed", 0)
	composer.setVariable("finalCashConsumed", 0)
	--composer.setVariable("lastScore", 0)
	--composer.setVariable("totalMetersRun", 0)
	--composer.setVariable("totalCoinsConsumed", 0)
	--composer.setVariable("totalCashConsumed", 0)
end

function M:loadHeroFromFile()
	print(">>> Loading hero from file")
	local file = io.open(heroFilePath, "r")

	if(file) then
		local content = file:read("*a")
		io.close(file)
		heroTable = json.decode(content)
	end

	print(">>> Hero loaded from file")
end

function M:saveHeroToFile()
	M:loadHeroFromFile()

	print(">>> Saving hero to file")

	local oldMeters = 0
	local oldCoins = 0
	local oldCash = 0

	if(heroTable == nil) then
		heroTable = {
			lastScore = composer.getVariable("finalScore"),
			meters = composer.getVariable("finalMetersRun"),
			coins = composer.getVariable("finalCoinsConsumed"),
			cash = composer.getVariable("finalCashConsumed")
		}
	else
		oldMeters = heroTable.meters
		oldCoins = heroTable.coins
		oldCash = heroTable.cash
	end

	local score = composer.getVariable("finalScore")
	local meters = composer.getVariable("finalMetersRun")
	local coins = composer.getVariable("finalCoinsConsumed")
	local cash = composer.getVariable("finalCashConsumed")

	composer.setVariable("lastScore", composer.getVariable("finalScore"))

	M:clearGlobals()

	heroTable.lastScore = score
	heroTable.meters = oldMeters + meters
	heroTable.coins = oldCoins + coins
	heroTable.cash = oldCash + cash

	composer.setVariable("totalMetersRun", heroTable.meters)
	composer.setVariable("totalCoinsConsumed", heroTable.coins)
	composer.setVariable("totalCashConsumed", heroTable.cash)

	local file = io.open(heroFilePath, "w")

	if(file) then
		file:write(json.encode(heroTable))
		io.close(file)
	end

	print(">>> Hero saved to file")
end

return M