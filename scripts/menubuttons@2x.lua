--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:08dbcc5e7f4a367f4022001ffa09e05a:f583d76384d14d480bbde28364447f73:c613fe11d427795fb34012e4e22eb0dc$
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
            -- button_contact
            x=1680,
            y=774,
            width=110,
            height=82,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 109,
            sourceHeight = 81
        },
        {
            -- button_highscore
            x=1680,
            y=508,
            width=134,
            height=144,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 135,
            sourceHeight = 144
        },
        {
            -- button_settings
            x=1680,
            y=656,
            width=116,
            height=114,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 116,
            sourceHeight = 113
        },
        {
            -- button_share
            x=1718,
            y=2,
            width=98,
            height=102,

        },
        {
            -- cancel
            x=2,
            y=932,
            width=364,
            height=468,

            sourceX = 78,
            sourceY = 30,
            sourceWidth = 512,
            sourceHeight = 512
        },
        {
            -- checkboxchecked
            x=1718,
            y=108,
            width=96,
            height=88,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 99,
            sourceHeight = 87
        },
        {
            -- checkboxempty
            x=1718,
            y=368,
            width=60,
            height=56,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 59,
            sourceHeight = 56
        },
        {
            -- contact
            x=370,
            y=932,
            width=664,
            height=414,

            sourceX = 4,
            sourceY = 6,
            sourceWidth = 675,
            sourceHeight = 425
        },
        {
            -- dash
            x=1554,
            y=932,
            width=198,
            height=144,

        },
        {
            -- film
            x=1038,
            y=932,
            width=512,
            height=388,

            sourceX = 0,
            sourceY = 62,
            sourceWidth = 512,
            sourceHeight = 512
        },
        {
            -- jump
            x=1554,
            y=1080,
            width=198,
            height=144,

        },
        {
            -- music
            x=1718,
            y=280,
            width=64,
            height=84,

            sourceX = 10,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 84
        },
        {
            -- pause
            x=1004,
            y=2,
            width=710,
            height=502,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 716,
            sourceHeight = 509
        },
        {
            -- pause_button
            x=1554,
            y=1228,
            width=196,
            height=178,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 202,
            sourceHeight = 177
        },
        {
            -- score
            x=2,
            y=2,
            width=998,
            height=706,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 1006,
            sourceHeight = 715
        },
        {
            -- settings
            x=1004,
            y=508,
            width=672,
            height=420,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 675,
            sourceHeight = 425
        },
        {
            -- sound
            x=1718,
            y=200,
            width=76,
            height=76,

            sourceX = 0,
            sourceY = 10,
            sourceWidth = 75,
            sourceHeight = 86
        },
        {
            -- top_banner
            x=2,
            y=712,
            width=984,
            height=178,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 984,
            sourceHeight = 177
        },
    },
    
    sheetContentWidth = 1818,
    sheetContentHeight = 1408
}

SheetInfo.frameIndex =
{

    ["button_contact"] = 1,
    ["button_highscore"] = 2,
    ["button_settings"] = 3,
    ["button_share"] = 4,
    ["cancel"] = 5,
    ["checkboxchecked"] = 6,
    ["checkboxempty"] = 7,
    ["contact"] = 8,
    ["dash"] = 9,
    ["film"] = 10,
    ["jump"] = 11,
    ["music"] = 12,
    ["pause"] = 13,
    ["pause_button"] = 14,
    ["score"] = 15,
    ["settings"] = 16,
    ["sound"] = 17,
    ["top_banner"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
