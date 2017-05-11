--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:981dcd7b9cd73738bba73d0e6787b33b:43df92a948965bb2b3efbaade6d60ea5:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            -- 2xmultiplier
            x=325,
            y=355,
            width=66,
            height=68,

        },
        {
            -- broccoli
            x=1,
            y=1,
            width=133,
            height=166,

        },
        {
            -- carrot
            x=213,
            y=271,
            width=110,
            height=183,

        },
        {
            -- cash
            x=103,
            y=306,
            width=108,
            height=96,

            sourceX = 11,
            sourceY = 5,
            sourceWidth = 125,
            sourceHeight = 109
        },
        {
            -- chicken
            x=411,
            y=340,
            width=74,
            height=100,

        },
        {
            -- coin
            x=103,
            y=404,
            width=50,
            height=50,

        },
        {
            -- fries
            x=153,
            y=169,
            width=86,
            height=100,

        },
        {
            -- hamburger
            x=241,
            y=169,
            width=100,
            height=85,

        },
        {
            -- hole
            x=458,
            y=1,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- leftGround
            x=136,
            y=57,
            width=307,
            height=54,

            sourceX = 13,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 54
        },
        {
            -- magnet
            x=325,
            y=256,
            width=84,
            height=97,

        },
        {
            -- middleGround
            x=136,
            y=1,
            width=320,
            height=54,

        },
        {
            -- pizza
            x=343,
            y=169,
            width=100,
            height=67,

        },
        {
            -- rightGround
            x=136,
            y=113,
            width=307,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 54
        },
        {
            -- soda
            x=411,
            y=238,
            width=75,
            height=100,

        },
        {
            -- tomato_big
            x=1,
            y=169,
            width=150,
            height=135,

        },
        {
            -- tomato_small
            x=1,
            y=306,
            width=100,
            height=109,

        },
    },
    
    sheetContentWidth = 487,
    sheetContentHeight = 455
}

SheetInfo.frameIndex =
{

    ["2xmultiplier"] = 1,
    ["broccoli"] = 2,
    ["carrot"] = 3,
    ["cash"] = 4,
    ["chicken"] = 5,
    ["coin"] = 6,
    ["fries"] = 7,
    ["hamburger"] = 8,
    ["hole"] = 9,
    ["leftGround"] = 10,
    ["magnet"] = 11,
    ["middleGround"] = 12,
    ["pizza"] = 13,
    ["rightGround"] = 14,
    ["soda"] = 15,
    ["tomato_big"] = 16,
    ["tomato_small"] = 17,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
