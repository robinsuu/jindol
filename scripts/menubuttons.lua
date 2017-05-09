--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:981b2d1022f4dbbbdff68bef545f9d92:af126ae86b1a2a6f13bfc4427117a82a:c613fe11d427795fb34012e4e22eb0dc$
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
            x=259,
            y=237,
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
            y=503,
            width=101,
            height=101,

        },
        {
            -- button_highscore
            x=104,
            y=503,
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
            y=350,
            width=251,
            height=151,

        },
        {
            -- button_ok
            x=430,
            y=237,
            width=76,
            height=76,

        },
        {
            -- button_ok_square
            x=430,
            y=315,
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
            x=346,
            y=546,
            width=44,
            height=44,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 48,
            sourceHeight = 48
        },
        {
            -- button_share
            x=298,
            y=546,
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
            y=393,
            width=251,
            height=151,

        },
        {
            -- button_x
            x=162,
            y=503,
            width=76,
            height=76,

        },
        {
            -- cancel
            x=304,
            y=1,
            width=182,
            height=234,

            sourceX = 39,
            sourceY = 15,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- checkboxchecked
            x=104,
            y=546,
            width=56,
            height=56,

            sourceX = 3,
            sourceY = 3,
            sourceWidth = 64,
            sourceHeight = 64
        },
        {
            -- checkboxempty
            x=240,
            y=546,
            width=56,
            height=56,

            sourceX = 3,
            sourceY = 3,
            sourceWidth = 64,
            sourceHeight = 64
        },
        {
            -- film
            x=1,
            y=154,
            width=256,
            height=194,

            sourceX = 0,
            sourceY = 31,
            sourceWidth = 256,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 507,
    sheetContentHeight = 605
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
    ["cancel"] = 12,
    ["checkboxchecked"] = 13,
    ["checkboxempty"] = 14,
    ["film"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
