-----------------------------------------------------------------------------------------
--
-- emitters.lua
--
-- Loads and returns particle emitter parameters
--
-----------------------------------------------------------------------------------------

----
-- Requires
----
local json = require("json")
local emitterParams = {}

----
-- Fields
----
local M = {}

local function loadEmitterData(emitterName)
	local filePath = system.pathForFile("effects/" .. emitterName .. ".json")
	local f = io.open(filePath, "r")
	local emitterData = f:read( "*a" )
	f:close()

	return json.decode(emitterData)
end

function M:getCoinEmitter()
	return loadEmitterData("coin_particle")
end

function M:getDashEmitter()
	return loadEmitterData("dash_particle")
end

return M