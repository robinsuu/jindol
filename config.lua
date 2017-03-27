-----------------------------------------------------------------------------------------
--
-- config.lua
--
-- Modified version of: https://github.com/coronalabs-samples/CoronaCannon/blob/master/config.lua
--
-----------------------------------------------------------------------------------------

local normalW, normalH = 1640, 3136 -- Default: 640, 1136

-- This calculation extends the standard letterbox scaling
-- Using this point x = 0, y = 0 is always in the top left corner of the screen on all devices
-- And x = display.contentWidth, y = display.contentHeight is always in the bottom right corner
local w, h = display.pixelWidth, display.pixelHeight
local scale = math.max(normalW / w, normalH / h)
w, h = w * scale, h * scale

application = {
    content = {
		width = w,
        height = h,
        scale = "letterbox",
        fps = 60,
        imageSuffix = {
			["@2x"] = 1.1,
		}
    }
}