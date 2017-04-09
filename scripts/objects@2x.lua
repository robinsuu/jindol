--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:65f5332d183fcb29d62657dd612bf93f:86b5223c8dd592b9bf0ae1c8cea93cd2:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            -- asparagus
            x=272,
            y=2,
            width=76,
            height=366,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 365
        },
        {
            -- broccoli
            x=2,
            y=2,
            width=266,
            height=372,

        },
        {
            -- cash
            x=646,
            y=226,
            width=216,
            height=192,

            sourceX = 22,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 217
        },
        {
            -- coin
            x=352,
            y=226,
            width=100,
            height=100,

        },
        {
            -- hamburger
            x=352,
            y=2,
            width=200,
            height=200,

        },
        {
            -- hole
            x=352,
            y=206,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- leftGround
            x=556,
            y=2,
            width=614,
            height=108,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 107
        },
        {
            -- middleGround
            x=2,
            y=378,
            width=640,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 107
        },
        {
            -- pizza
            x=866,
            y=226,
            width=200,
            height=188,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- rightGround
            x=556,
            y=114,
            width=614,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 107
        },
    },
    
    sheetContentWidth = 1172,
    sheetContentHeight = 488
}

SheetInfo.frameIndex =
{

    ["asparagus"] = 1,
    ["broccoli"] = 2,
    ["cash"] = 3,
    ["coin"] = 4,
    ["hamburger"] = 5,
    ["hole"] = 6,
    ["leftGround"] = 7,
    ["middleGround"] = 8,
    ["pizza"] = 9,
    ["rightGround"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
