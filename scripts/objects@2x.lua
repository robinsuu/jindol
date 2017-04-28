--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1c85738a19319810375fe5acf3a22c38:d2444507314823593b08497cb1fb38ac:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            -- broccoli
            x=646,
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
            x=2,
            y=338,
            width=220,
            height=366,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 220,
            sourceHeight = 365
        },
        {
            -- cash
            x=226,
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
            x=446,
            y=612,
            width=148,
            height=200,

        },
        {
            -- coin
            x=752,
            y=542,
            width=100,
            height=100,

        },
        {
            -- fries
            x=734,
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
            x=2,
            y=708,
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
            x=598,
            y=764,
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
            x=598,
            y=560,
            width=150,
            height=200,

        },
        {
            -- tomato_big
            x=226,
            y=338,
            width=300,
            height=270,

        },
        {
            -- tomato_small
            x=530,
            y=338,
            width=200,
            height=218,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 200,
            sourceHeight = 217
        },
    },
    
    sheetContentWidth = 914,
    sheetContentHeight = 900
}

SheetInfo.frameIndex =
{

    ["broccoli"] = 1,
    ["carrot"] = 2,
    ["cash"] = 3,
    ["chicken"] = 4,
    ["coin"] = 5,
    ["fries"] = 6,
    ["hamburger"] = 7,
    ["hole"] = 8,
    ["leftGround"] = 9,
    ["middleGround"] = 10,
    ["pizza"] = 11,
    ["rightGround"] = 12,
    ["soda"] = 13,
    ["tomato_big"] = 14,
    ["tomato_small"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
