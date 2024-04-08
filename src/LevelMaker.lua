NONE = 1
SINGLE_PYRAMID = 2
MULTI_PYRAMID = 3

SOLID = 1           -- all colors the same in this row
ALTERNATE = 2       -- alternate colors
SKIP = 3            -- skip every other block
NONE = 4            -- no blocks this row

LevelMaker = Class{}

function LevelMaker.createMap(level)
    local bricks = {}

    local numRows = math.random(1,5)

    local numCols  = math.random(7,13) 

    numCols = numCols % 2 == 0 and (numCols+1) or numCols
    -- highest possible spawned brick color in this level; ensure we
    -- don't go above 3
    local highestTier = math.min(3,math.floor(level/5))
    -- highest color of the highest tier
    local highestColor = math.min(5, level % 5 + 3)

    for y=1, numRows do
        -- whether we want to enable skipping for this row
        -- whether we want to enable alternating colors for this row
        local skipPattern = math.random(1,2) == 1 and true or false
        local alternatePattern = math.random(1,2) == 1 and true or false

        -- choose two colors to alternate between
        local alternateColor1 = math.random(1, highestColor)
        local alternateColor2 = math.random(1, highestColor)
        local alternateTier1 = math.random(0, highestTier)
        local alternateTier2 = math.random(0, highestTier)
        -- used only when we want to skip a block, for skip pattern
        -- used only when we want to alternate a block, for alternate pattern
        local skipFlag = math.random(2) == 1 and true or false
        local alternateFlag = math.random(1,2) == 1 and true or false

        -- solid color we'll use if we're not skipping or alternating
        local solidColor = math.random(1, highestColor)
        local solidTier = math.random(0, highestTier)

        for x = 1, numCols do

            if skipPattern and skipFlag then

                skipFlag = not skipFlag
                goto continue
            else
                skipFlag = not skipFlag
            end

            b=Brick(
                (x-1)
                * 32
                + 8
                +(13-numCols) * 16,

                y*16
            )

            if alternatePattern and alternateFlag then
                b.color = alternateColor1
                b.tier = alternateTier1
                alternateFlag = not alternateFlag
            else
                b.color = alternateColor2
                b.tier = alternateTier2
                alternateFlag = not alternateFlag
            end


            table.insert(bricks,b)

            ::continue::
        end
    end
    -- in the event we didn't generate any bricks, try again
    if #bricks == 0 then
        return self.createMap(level)
    else
        return bricks
    end
end