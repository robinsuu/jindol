--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2eb55d7dd4f675ef32039b52db9cbf6f:32809b259291e7c9b8bc3fca4219a7bf:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            x=492,
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
            x=272,
            y=2,
            width=216,
            height=192,

            sourceX = 22,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 217
        },
        {
            -- coin
            x=272,
            y=198,
            width=100,
            height=100,

        },
        {
            -- hamburger
            x=646,
            y=202,
            width=200,
            height=200,

        },
        {
            -- hole
            x=1190,
            y=2,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- jindol_cash
            x=850,
            y=202,
            width=208,
            height=188,

            sourceX = 22,
            sourceY = 18,
            sourceWidth = 250,
            sourceHeight = 223
        },
        {
            -- leftGround
            x=646,
            y=2,
            width=540,
            height=96,

            sourceX = 100,
            sourceY = 32,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- middleGround
            x=2,
            y=378,
            width=640,
            height=96,

            sourceX = 0,
            sourceY = 32,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- pizza
            x=1062,
            y=202,
            width=200,
            height=188,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- rightGround
            x=572,
            y=102,
            width=540,
            height=96,

            sourceX = 0,
            sourceY = 32,
            sourceWidth = 640,
            sourceHeight = 128
        },
    },
    
    sheetContentWidth = 1264,
    sheetContentHeight = 476
}

SheetInfo.frameIndex =
{

    ["asparagus"] = 1,
    ["broccoli"] = 2,
    ["cash"] = 3,
    ["coin"] = 4,
    ["hamburger"] = 5,
    ["hole"] = 6,
    ["jindol_cash"] = 7,
    ["leftGround"] = 8,
    ["middleGround"] = 9,
    ["pizza"] = 10,
    ["rightGround"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
