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
            x=824,
            y=606,
            width=134,
            height=112,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 133,
            sourceHeight = 112
        },
        {
            -- broccoli
            x=2,
            y=338,
            width=266,
            height=332,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 265,
            sourceHeight = 331
        },
        {
            -- carrot
            x=646,
            y=2,
            width=220,
            height=366,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 220,
            sourceHeight = 365
        },
        {
            -- cash
            x=780,
            y=410,
            width=216,
            height=192,

            sourceX = 22,
            sourceY = 10,
            sourceWidth = 250,
            sourceHeight = 217
        },
        {
            -- chicken
            x=870,
            y=206,
            width=148,
            height=200,

        },
        {
            -- coin
            x=824,
            y=722,
            width=100,
            height=100,

        },
        {
            -- fries
            x=476,
            y=612,
            width=172,
            height=200,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 171,
            sourceHeight = 200
        },
        {
            -- hamburger
            x=272,
            y=612,
            width=200,
            height=170,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 169
        },
        {
            -- hole
            x=620,
            y=114,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- leftGround
            x=2,
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
            x=652,
            y=606,
            width=168,
            height=194,

        },
        {
            -- middleGround
            x=2,
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
            x=2,
            y=674,
            width=200,
            height=134,

        },
        {
            -- rightGround
            x=2,
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
            x=870,
            y=2,
            width=150,
            height=200,

        },
        {
            -- tomato_big
            x=272,
            y=338,
            width=300,
            height=270,

        },
        {
            -- tomato_small
            x=576,
            y=372,
            width=200,
            height=218,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 217
        },
    },
    
    sheetContentWidth = 1022,
    sheetContentHeight = 824
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
