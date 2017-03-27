--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:75307caa3219a913908c8d025a7ddfd7:f8f66e862aae2a7e9556f2bc0cd9c2dd:e9f8a8f32260ecedd7b73afd7e45d099$
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
            -- ground2x10
            x=1,
            y=453,
            width=640,
            height=128,

        },
        {
            -- ground3x10
            x=1,
            y=259,
            width=640,
            height=192,

        },
        {
            -- ground4x4
            x=643,
            y=1,
            width=256,
            height=256,

        },
        {
            -- ground4x10
            x=1,
            y=1,
            width=640,
            height=256,

        },
    },
    
    sheetContentWidth = 900,
    sheetContentHeight = 582
}

SheetInfo.frameIndex =
{

    ["ground2x10"] = 1,
    ["ground3x10"] = 2,
    ["ground4x4"] = 3,
    ["ground4x10"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
