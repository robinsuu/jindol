--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f70b79178d9e43d931c6364599f07eec:3b28d2496c007a8b3cf8d94696a5b41d:ef77c85f4ae7e7bd105b85b34ee21750$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- hidi
            x=475,
            y=305,
            width=372,
            height=538,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 372,
            sourceHeight = 539
        },
        {
            -- jindol
            x=1,
            y=305,
            width=472,
            height=484,

        },
        {
            -- logo
            x=163,
            y=1,
            width=570,
            height=302,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 576,
            sourceHeight = 304
        },
        {
            -- talk_bubble
            x=1,
            y=1,
            width=160,
            height=119,

            sourceX = 0,
            sourceY = 1,
            sourceWidth = 160,
            sourceHeight = 120
        },
    },
    
    sheetContentWidth = 848,
    sheetContentHeight = 844
}

SheetInfo.frameIndex =
{

    ["hidi"] = 1,
    ["jindol"] = 2,
    ["logo"] = 3,
    ["talk_bubble"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
