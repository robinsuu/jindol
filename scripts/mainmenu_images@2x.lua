--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f70b79178d9e43d931c6364599f07eec:3b28d2496c007a8b3cf8d94696a5b41d:ef77c85f4ae7e7bd105b85b34ee21750$
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
            -- hidi
            x=950,
            y=610,
            width=744,
            height=1076,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 744,
            sourceHeight = 1077
        },
        {
            -- jindol
            x=2,
            y=610,
            width=944,
            height=968,

        },
        {
            -- logo
            x=326,
            y=2,
            width=1140,
            height=604,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 1152,
            sourceHeight = 608
        },
        {
            -- talk_bubble
            x=2,
            y=2,
            width=320,
            height=238,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 319,
            sourceHeight = 239
        },
    },
    
    sheetContentWidth = 1696,
    sheetContentHeight = 1688
}

SheetInfo.frameIndex =
{

    ["hidi"] = 1,
    ["jindol"] = 2,
    ["logo"] = 3,
    ["talk_bubble"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
