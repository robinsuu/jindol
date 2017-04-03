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
            x=458,
            y=1,
            width=38,
            height=183,

        },
        {
            -- broccoli
            x=323,
            y=1,
            width=133,
            height=186,

        },
        {
            -- coin
            x=458,
            y=186,
            width=50,
            height=50,

        },
        {
            -- hole
            x=305,
            y=189,
            width=3,
            height=3,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
        {
            -- leftedge
            x=1,
            y=67,
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
            y=1,
            width=320,
            height=64,

        },
        {
            -- rightedge
            x=1,
            y=133,
            width=302,
            height=64,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 320,
            sourceHeight = 64
        },
    },
    
    sheetContentWidth = 509,
    sheetContentHeight = 237
}

SheetInfo.frameIndex =
{

    ["asparagus"] = 1,
    ["broccoli"] = 2,
    ["coin"] = 3,
    ["hole"] = 4,
    ["leftGround"] = 5,
    ["middleGround"] = 6,
    ["rightGround"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
