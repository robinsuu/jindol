--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2aec4c786ac723051263004c500ade0f:13d45d548394608c10fdeb0a68b125f7:c613fe11d427795fb34012e4e22eb0dc$
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
            x=502,
            y=254,
            width=169,
            height=150,

            sourceX = 6,
            sourceY = 7,
            sourceWidth = 185,
            sourceHeight = 160
        },
        {
            -- button_highscore
            x=185,
            y=552,
            width=48,
            height=30,

            sourceX = 0,
            sourceY = 9,
            sourceWidth = 48,
            sourceHeight = 48
        },
        {
            -- button_settings
            x=544,
            y=497,
            width=44,
            height=44,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 48,
            sourceHeight = 48
        },
        {
            -- button_share
            x=443,
            y=356,
            width=46,
            height=48,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 50
        },
        {
            -- button_x
            x=773,
            y=328,
            width=76,
            height=76,

        },
        {
            -- cancel
            x=1,
            y=356,
            width=182,
            height=234,

            sourceX = 39,
            sourceY = 15,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- checkboxchecked
            x=859,
            y=1,
            width=56,
            height=56,

            sourceX = 3,
            sourceY = 3,
            sourceWidth = 64,
            sourceHeight = 64
        },
        {
            -- checkboxempty
            x=673,
            y=345,
            width=56,
            height=56,

            sourceX = 3,
            sourceY = 3,
            sourceWidth = 64,
            sourceHeight = 64
        },
        {
            -- dash
            x=773,
            y=254,
            width=99,
            height=72,

        },
        {
            -- film
            x=185,
            y=356,
            width=256,
            height=194,

            sourceX = 0,
            sourceY = 31,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- jump
            x=443,
            y=497,
            width=99,
            height=72,

        },
        {
            -- pause
            x=502,
            y=1,
            width=355,
            height=251,

            sourceX = 2,
            sourceY = 1,
            sourceWidth = 358,
            sourceHeight = 255
        },
        {
            -- pause_button
            x=673,
            y=254,
            width=98,
            height=89,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 101,
            sourceHeight = 89
        },
        {
            -- score
            x=1,
            y=1,
            width=499,
            height=353,

            sourceX = 2,
            sourceY = 1,
            sourceWidth = 503,
            sourceHeight = 358
        },
        {
            -- top_banner
            x=443,
            y=406,
            width=492,
            height=89,

        },
    },
    
    sheetContentWidth = 936,
    sheetContentHeight = 591
}

SheetInfo.frameIndex =
{

    ["34"] = 1,
    ["button_highscore"] = 2,
    ["button_settings"] = 3,
    ["button_share"] = 4,
    ["button_x"] = 5,
    ["cancel"] = 6,
    ["checkboxchecked"] = 7,
    ["checkboxempty"] = 8,
    ["dash"] = 9,
    ["film"] = 10,
    ["jump"] = 11,
    ["pause"] = 12,
    ["pause_button"] = 13,
    ["score"] = 14,
    ["top_banner"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
