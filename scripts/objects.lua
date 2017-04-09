--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ab29e7e1cf35005a8759cae3496bdef7:29c7c0df9e68de9921af2b3b81f952d5:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            x=542,
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
            x=425,
            y=133,
            width=104,
            height=94,

            sourceX = 11,
            sourceY = 9,
            sourceWidth = 125,
            sourceHeight = 112
        },
        {
            -- coin
            x=136,
            y=133,
            width=50,
            height=50,

        },
        {
            -- hamburger
            x=323,
            y=133,
            width=100,
            height=100,

        },
        {
            -- hole
            x=188,
            y=133,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- leftedge
            x=136,
            y=1,
            width=302,
            height=64,

            sourceX = 18,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- middle
            x=1,
            y=189,
            width=320,
            height=64,

        },
        {
            -- pizza
            x=440,
            y=1,
            width=100,
            height=94,

            sourceX = 0,
            sourceY = 3,
            sourceWidth = 100,
            sourceHeight = 100
        },
        {
            -- rightedge
            x=136,
            y=67,
            width=302,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
    },
    
    sheetContentWidth = 581,
    sheetContentHeight = 254
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
