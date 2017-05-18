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
            x=840,
            y=387,
            width=55,
            height=41,

        },
        {
            -- button_highscore
            x=840,
            y=254,
            width=67,
            height=72,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 68,
            sourceHeight = 72
        },
        {
            -- button_settings
            x=840,
            y=328,
            width=58,
            height=57,

        },
        {
            -- button_share
            x=859,
            y=1,
            width=49,
            height=51,

        },
        {
            -- cancel
            x=1,
            y=466,
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
            y=54,
            width=48,
            height=44,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 50,
            sourceHeight = 44
        },
        {
            -- checkboxempty
            x=859,
            y=184,
            width=30,
            height=28,

        },
        {
            -- contact
            x=185,
            y=466,
            width=332,
            height=207,

            sourceX = 2,
            sourceY = 3,
            sourceWidth = 338,
            sourceHeight = 213
        },
        {
            -- dash
            x=777,
            y=466,
            width=99,
            height=72,

        },
        {
            -- film
            x=519,
            y=466,
            width=256,
            height=194,

            sourceX = 0,
            sourceY = 31,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- jump
            x=777,
            y=540,
            width=99,
            height=72,

        },
        {
            -- music
            x=859,
            y=140,
            width=32,
            height=42,

            sourceX = 5,
            sourceY = 0,
            sourceWidth = 38,
            sourceHeight = 42
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
            x=777,
            y=614,
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
            -- settings
            x=502,
            y=254,
            width=336,
            height=210,

            sourceX = 1,
            sourceY = 0,
            sourceWidth = 338,
            sourceHeight = 213
        },
        {
            -- sound
            x=859,
            y=100,
            width=38,
            height=38,

            sourceX = 0,
            sourceY = 5,
            sourceWidth = 38,
            sourceHeight = 43
        },
        {
            -- top_banner
            x=1,
            y=356,
            width=492,
            height=89,

        },
    },
    
    sheetContentWidth = 909,
    sheetContentHeight = 704
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
