--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e115f82771c3329eb7b71ae88fc96335:dccb4dbb73d690c468b2de5c62073dda:c613fe11d427795fb34012e4e22eb0dc$
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
            x=1,
            y=307,
            width=101,
            height=101,

        },
        {
            -- button_highscore
            x=338,
            y=365,
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
            y=154,
            width=251,
            height=151,

        },
        {
            -- button_ok
            x=104,
            y=307,
            width=76,
            height=76,

        },
        {
            -- button_ok_square
            x=182,
            y=307,
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
            x=454,
            y=357,
            width=44,
            height=44,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 48,
            sourceHeight = 48
        },
        {
            -- button_share
            x=454,
            y=307,
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
            y=154,
            width=251,
            height=151,

        },
        {
            -- button_x
            x=260,
            y=307,
            width=76,
            height=76,

        },
        {
            -- checkboxchecked
            x=338,
            y=307,
            width=56,
            height=56,

            sourceX = 3,
            sourceY = 3,
            sourceWidth = 64,
            sourceHeight = 64
        },
        {
            -- checkboxempty
            x=396,
            y=307,
            width=56,
            height=56,

            sourceX = 3,
            sourceY = 3,
            sourceWidth = 64,
            sourceHeight = 64
        },
    },
    
    sheetContentWidth = 506,
    sheetContentHeight = 409
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
    ["checkboxchecked"] = 12,
    ["checkboxempty"] = 13,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
