--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:d4903b90e7f631bea5fec806c1be1277:e7ea0d262fd5a4a2233511edd96f5125:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            x=412,
            y=303,
            width=67,
            height=56,

        },
        {
            -- broccoli
            x=1,
            y=169,
            width=133,
            height=166,

        },
        {
            -- carrot
            x=323,
            y=1,
            width=110,
            height=183,

        },
        {
            -- cash
            x=390,
            y=205,
            width=108,
            height=96,

            sourceX = 11,
            sourceY = 5,
            sourceWidth = 125,
            sourceHeight = 109
        },
        {
            -- chicken
            x=435,
            y=103,
            width=74,
            height=100,

        },
        {
            -- coin
            x=412,
            y=361,
            width=50,
            height=50,

        },
        {
            -- fries
            x=238,
            y=306,
            width=86,
            height=100,

        },
        {
            -- hamburger
            x=136,
            y=306,
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
            x=326,
            y=303,
            width=84,
            height=97,

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
            x=1,
            y=337,
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
            x=435,
            y=1,
            width=75,
            height=100,

        },
        {
            -- tomato_big
            x=136,
            y=169,
            width=150,
            height=135,

        },
        {
            -- tomato_small
            x=288,
            y=186,
            width=100,
            height=109,

        },
    },
    
    sheetContentWidth = 511,
    sheetContentHeight = 412
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
