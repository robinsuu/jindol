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
            x=304,
            y=1,
            width=169,
            height=150,

            sourceX = 6,
            sourceY = 7,
            sourceWidth = 185,
            sourceHeight = 160
        },
        {
            -- button_back
            x=304,
            y=153,
            width=101,
            height=101,

        },
        {
            -- button_highscore
            x=203,
            y=204,
            width=48,
            height=30,

            sourceX = 0,
            sourceY = 9,
            sourceWidth = 48,
            sourceHeight = 48
        },
        {
            -- button_how-to-play
            x=1,
            y=256,
            width=251,
            height=151,

        },
        {
            -- button_ok
            x=407,
            y=153,
            width=76,
            height=76,

        },
        {
            -- button_ok_square
            x=1,
            y=154,
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
            x=157,
            y=204,
            width=44,
            height=44,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 48,
            sourceHeight = 48
        },
        {
            -- button_share
            x=157,
            y=154,
            width=46,
            height=48,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- button_shop
            x=254,
            y=256,
            width=251,
            height=151,

        },
        {
            -- button_x
            x=79,
            y=154,
            width=76,
            height=76,

        },
    },
    
    sheetContentWidth = 506,
    sheetContentHeight = 408
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
