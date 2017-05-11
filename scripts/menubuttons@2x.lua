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
            x=1004,
            y=508,
            width=338,
            height=300,

            sourceX = 12,
            sourceY = 14,
            sourceWidth = 370,
            sourceHeight = 320
        },
        {
            -- button_highscore
            x=370,
            y=1104,
            width=96,
            height=60,

            sourceX = 0,
            sourceY = 18,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- button_settings
            x=1088,
            y=994,
            width=88,
            height=88,

            sourceX = 4,
            sourceY = 6,
            sourceWidth = 96,
            sourceHeight = 96
        },
        {
            -- button_share
            x=886,
            y=712,
            width=92,
            height=96,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 100,
            sourceHeight = 100
        },
        {
            -- button_x
            x=1546,
            y=656,
            width=152,
            height=152,

        },
        {
            -- cancel
            x=2,
            y=712,
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
            y=2,
            width=112,
            height=112,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 127,
            sourceHeight = 127
        },
        {
            -- checkboxempty
            x=1346,
            y=690,
            width=112,
            height=112,

            sourceX = 6,
            sourceY = 6,
            sourceWidth = 127,
            sourceHeight = 127
        },
        {
            -- dash
            x=1546,
            y=508,
            width=198,
            height=144,

        },
        {
            -- film
            x=370,
            y=712,
            width=512,
            height=388,

            sourceX = 0,
            sourceY = 62,
            sourceWidth = 512,
            sourceHeight = 512
        },
        {
            -- jump
            x=886,
            y=994,
            width=198,
            height=144,

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
            x=1346,
            y=508,
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
            -- top_banner
            x=886,
            y=812,
            width=984,
            height=178,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 984,
            sourceHeight = 177
        },
    },
    
    sheetContentWidth = 1872,
    sheetContentHeight = 1182
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
