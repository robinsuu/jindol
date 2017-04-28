--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8e7ad07490b20b7e603f38e80469934f:c9dc3bc32e2e5edf607a63b5eb071b69:c613fe11d427795fb34012e4e22eb0dc$
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
            -- 34
            x=608,
            y=2,
            width=338,
            height=300,

            sourceX = 12,
            sourceY = 14,
            sourceWidth = 370,
            sourceHeight = 320
        },
        {
            -- button_back
            x=608,
            y=306,
            width=202,
            height=202,

        },
        {
            -- button_highscore
            x=406,
            y=408,
            width=96,
            height=60,

            sourceX = 0,
            sourceY = 18,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- button_how-to-play
            x=2,
            y=512,
            width=502,
            height=302,

        },
        {
            -- button_ok
            x=814,
            y=306,
            width=152,
            height=152,

        },
        {
            -- button_ok_square
            x=2,
            y=308,
            width=152,
            height=152,

        },
        {
            -- button_play
            x=2,
            y=2,
            width=602,
            height=302,

        },
        {
            -- button_settings
            x=314,
            y=408,
            width=88,
            height=88,

            sourceX = 4,
            sourceY = 6,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- button_share
            x=314,
            y=308,
            width=92,
            height=96,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 100
        },
        {
            -- button_shop
            x=508,
            y=512,
            width=502,
            height=302,

        },
        {
            -- button_x
            x=158,
            y=308,
            width=152,
            height=152,

        },
    },
    
    sheetContentWidth = 1012,
    sheetContentHeight = 816
}

SheetInfo.frameIndex =
{

    ["34"] = 1,
    ["button_back"] = 2,
    ["button_highscore"] = 3,
    ["button_how-to-play"] = 4,
    ["button_ok"] = 5,
    ["button_ok_square"] = 6,
    ["button_play"] = 7,
    ["button_settings"] = 8,
    ["button_share"] = 9,
    ["button_shop"] = 10,
    ["button_x"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
