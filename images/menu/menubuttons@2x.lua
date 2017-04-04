--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2580a14a52e65ec61a0bb9dcdc8757e2:a9b0202bab511eae41844437b033d522:c613fe11d427795fb34012e4e22eb0dc$
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
            x=2,
            y=1226,
            width=338,
            height=300,

            sourceX = 12,
            sourceY = 14,
            sourceWidth = 370,
            sourceHeight = 320
        },
        {
            -- button_back
            x=344,
            y=1226,
            width=202,
            height=202,

        },
        {
            -- button_high-score
            x=2,
            y=308,
            width=502,
            height=302,

        },
        {
            -- button_how-to-play
            x=2,
            y=614,
            width=502,
            height=302,

        },
        {
            -- button_ok
            x=208,
            y=1638,
            width=152,
            height=152,

        },
        {
            -- button_ok_square
            x=2,
            y=1736,
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
            x=344,
            y=1432,
            width=202,
            height=202,

        },
        {
            -- button_share
            x=2,
            y=1530,
            width=202,
            height=202,

        },
        {
            -- button_shop
            x=2,
            y=920,
            width=502,
            height=302,

        },
        {
            -- button_x
            x=364,
            y=1638,
            width=152,
            height=152,

        },
    },
    
    sheetContentWidth = 606,
    sheetContentHeight = 1890
}

SheetInfo.frameIndex =
{

    ["34"] = 1,
    ["button_back"] = 2,
    ["button_high-score"] = 3,
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
