--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:84102e0e216389e70f637ae1ce1ce3af:ff7e123b2ffade43179491ff6d79a2cb:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            x=387,
            y=271,
            width=66,
            height=68,

        },
        {
            -- broccoli
            x=323,
            y=1,
            width=133,
            height=166,

        },
        {
            -- carrot
            x=1,
            y=169,
            width=110,
            height=183,

        },
        {
            -- cash
            x=113,
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
            x=223,
            y=306,
            width=74,
            height=100,

        },
        {
            -- coin
            x=205,
            y=408,
            width=50,
            height=50,

        },
        {
            -- fries
            x=299,
            y=275,
            width=86,
            height=100,

        },
        {
            -- hamburger
            x=299,
            y=377,
            width=100,
            height=85,

        },
        {
            -- hole
            x=310,
            y=57,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- leftGround
            x=1,
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
            x=265,
            y=169,
            width=104,
            height=104,

        },
        {
            -- middleGround
            x=1,
            y=1,
            width=320,
            height=54,

        },
        {
            -- pizza
            x=103,
            y=404,
            width=100,
            height=67,

        },
        {
            -- rightGround
            x=1,
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
            x=371,
            y=169,
            width=75,
            height=100,

        },
        {
            -- tomato_big
            x=113,
            y=169,
            width=150,
            height=135,

        },
        {
            -- tomato_small
            x=1,
            y=354,
            width=100,
            height=109,

        },
    },
    
    sheetContentWidth = 457,
    sheetContentHeight = 472
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
