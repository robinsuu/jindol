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
            x=1,
            y=613,
            width=169,
            height=150,

            sourceX = 6,
            sourceY = 7,
            sourceWidth = 185,
            sourceHeight = 160
        },
        {
            -- button_back
            x=172,
            y=613,
            width=101,
            height=101,

        },
        {
            -- button_high-score
            x=1,
            y=154,
            width=251,
            height=151,

        },
        {
            -- button_how-to-play
            x=1,
            y=307,
            width=251,
            height=151,

        },
        {
            -- button_ok
            x=104,
            y=819,
            width=76,
            height=76,

        },
        {
            -- button_ok_square
            x=1,
            y=868,
            width=76,
            height=76,

        },
        {
            -- button_play
            x=1,
            y=1,
            width=301,
            height=151,

        },
        {
            -- button_settings
            x=172,
            y=716,
            width=101,
            height=101,

        },
        {
            -- button_share
            x=1,
            y=765,
            width=101,
            height=101,

        },
        {
            -- button_shop
            x=1,
            y=460,
            width=251,
            height=151,

        },
        {
            -- button_x
            x=182,
            y=819,
            width=76,
            height=76,

        },
    },
    
    sheetContentWidth = 303,
    sheetContentHeight = 945
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
