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
            x=136,
            y=1,
            width=38,
            height=183,

        },
        {
            -- broccoli
            x=1,
            y=1,
            width=133,
            height=186,

        },
        {
            -- cash
            x=323,
            y=113,
            width=108,
            height=96,

            sourceX = 11,
            sourceY = 5,
            sourceWidth = 125,
            sourceHeight = 109
        },
        {
            -- coin
            x=176,
            y=113,
            width=50,
            height=50,

        },
        {
            -- hamburger
            x=176,
            y=1,
            width=100,
            height=100,

        },
        {
            -- hole
            x=176,
            y=103,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- leftGround
            x=278,
            y=1,
            width=307,
            height=54,

            sourceX = 13,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 54
        },
        {
            -- middleGround
            x=1,
            y=189,
            width=320,
            height=54,

        },
        {
            -- pizza
            x=433,
            y=113,
            width=100,
            height=94,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 100,
            sourceHeight = 100
        },
        {
            -- rightGround
            x=278,
            y=57,
            width=307,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 54
        },
    },
    
    sheetContentWidth = 586,
    sheetContentHeight = 244
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
