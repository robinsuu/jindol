--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:cc9dbd471b410be07dec79002627c937:6c053e703b5515f50eaa183546b719fc:02ee67bb1d744d8a086f79ef6d2fcbaa$
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
            x=916,
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
            x=646,
            y=2,
            width=266,
            height=372,

        },
        {
            -- coin
            x=916,
            y=372,
            width=100,
            height=100,

        },
        {
            -- hole
            x=610,
            y=378,
            width=6,
            height=6,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
        {
            -- leftedge
            x=2,
            y=134,
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
            y=2,
            width=640,
            height=128,

        },
        {
            -- rightedge
            x=2,
            y=266,
            width=604,
            height=128,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 640,
            sourceHeight = 128
        },
    },
    
    sheetContentWidth = 1018,
    sheetContentHeight = 474
}

SheetInfo.frameIndex =
{

    ["asparagus"] = 1,
    ["broccoli"] = 2,
    ["coin"] = 3,
    ["hole"] = 4,
    ["leftedge"] = 5,
    ["middle"] = 6,
    ["rightedge"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
