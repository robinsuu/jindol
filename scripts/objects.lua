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
            x=376,
            y=271,
            width=50,
            height=50,

        },
        {
            -- fries
            x=367,
            y=169,
            width=86,
            height=100,

        },
        {
            -- hamburger
            x=1,
            y=354,
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
            -- middleGround
            x=1,
            y=1,
            width=320,
            height=54,

        },
        {
            -- pizza
            x=299,
            y=382,
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
            x=299,
            y=280,
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
            x=265,
            y=169,
            width=100,
            height=109,

        },
    },
    
    sheetContentWidth = 457,
    sheetContentHeight = 450
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
