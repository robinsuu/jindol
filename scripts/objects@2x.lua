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
            x=1084,
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
            x=850,
            y=266,
            width=208,
            height=188,

            sourceX = 22,
            sourceY = 18,
            sourceWidth = 250,
            sourceHeight = 223
        },
        {
            -- coin
            x=272,
            y=266,
            width=100,
            height=100,

        },
        {
            -- hamburger
            x=646,
            y=266,
            width=200,
            height=200,

        },
        {
            -- hole
            x=376,
            y=266,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- leftedge
            x=272,
            y=2,
            width=604,
            height=128,

            sourceX = 36,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- middle
            x=2,
            y=378,
            width=640,
            height=128,

        },
        {
            -- pizza
            x=880,
            y=2,
            width=200,
            height=188,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 200,
            sourceHeight = 200
        },
        {
            -- rightedge
            x=272,
            y=134,
            width=604,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
    },
    
    sheetContentWidth = 1162,
    sheetContentHeight = 508
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
