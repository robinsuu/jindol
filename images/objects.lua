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
            x=246,
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
            x=136,
            y=1,
            width=108,
            height=96,

            sourceX = 11,
            sourceY = 5,
            sourceWidth = 125,
            sourceHeight = 109
        },
        {
            -- coin
            x=136,
            y=99,
            width=50,
            height=50,

        },
        {
            -- hamburger
            x=323,
            y=101,
            width=100,
            height=100,

        },
        {
            -- hole
            x=595,
            y=1,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- jindol_cash
            x=425,
            y=101,
            width=104,
            height=94,

            sourceX = 11,
            sourceY = 9,
            sourceWidth = 125,
            sourceHeight = 112
        },
        {
            -- leftGround
            x=323,
            y=1,
            width=270,
            height=48,

            sourceX = 50,
            sourceY = 16,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- middleGround
            x=1,
            y=189,
            width=320,
            height=48,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- pizza
            x=531,
            y=101,
            width=100,
            height=94,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 100,
            sourceHeight = 100
        },
        {
            -- rightGround
            x=286,
            y=51,
            width=270,
            height=48,

            sourceX = 0,
            sourceY = 16,
            sourceWidth = 320,
            sourceHeight = 64
        },
    },
    
    sheetContentWidth = 632,
    sheetContentHeight = 238
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
