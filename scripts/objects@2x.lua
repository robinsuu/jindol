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
            x=650,
            y=710,
            width=132,
            height=136,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 131,
            sourceHeight = 135
        },
        {
            -- broccoli
            x=2,
            y=2,
            width=266,
            height=332,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 265,
            sourceHeight = 331
        },
        {
            -- carrot
            x=426,
            y=542,
            width=220,
            height=366,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 220,
            sourceHeight = 365
        },
        {
            -- cash
            x=206,
            y=612,
            width=216,
            height=192,

            sourceX = 22,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 217
        },
        {
            -- chicken
            x=822,
            y=680,
            width=148,
            height=200,

        },
        {
            -- coin
            x=206,
            y=808,
            width=100,
            height=100,

        },
        {
            -- fries
            x=306,
            y=338,
            width=172,
            height=200,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 171,
            sourceHeight = 200
        },
        {
            -- hamburger
            x=482,
            y=338,
            width=200,
            height=170,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 169
        },
        {
            -- hole
            x=916,
            y=2,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- leftGround
            x=272,
            y=114,
            width=614,
            height=108,

            sourceX = 26,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 107
        },
        {
            -- magnet
            x=650,
            y=512,
            width=168,
            height=194,

        },
        {
            -- middleGround
            x=272,
            y=2,
            width=640,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 107
        },
        {
            -- pizza
            x=686,
            y=338,
            width=200,
            height=134,

        },
        {
            -- rightGround
            x=272,
            y=226,
            width=614,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 107
        },
        {
            -- soda
            x=822,
            y=476,
            width=150,
            height=200,

        },
        {
            -- tomato_big
            x=2,
            y=338,
            width=300,
            height=270,

        },
        {
            -- tomato_small
            x=2,
            y=612,
            width=200,
            height=218,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 217
        },
    },
    
    sheetContentWidth = 974,
    sheetContentHeight = 910
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
