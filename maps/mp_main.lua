-- [[ VARIABLE ]] --
main_level  = {}

-- [[ Build sequence with teleport check ]] --
function BuildSequence(selected_map)

    -- Not all maps has a prebuild map function
    if PreBuildMap ~=nil then 
        PreBuildMap()
    end

    game:ontimeout(function()
        building_succes = BuildMap()

        if building_succes then
            game:oninterval(function()
                CheckPlayersForFlags(selected_map.posFlag, selected_map.posTP)
            end, 200)

            game:oninterval(function()
                CheckPlayersForBelowMap(selected_map.below_map_tp)
            end, 2000)
        end

        -- Build Ziplines
        game:oninterval(function() BuildZiplines() end, 10000)
        -- Build boosters
        game:oninterval(function() BuildBoosters() end, 20000)
    end, 6000)
end

-- [[ Level manager: main function ]] --
main_level.main = function()
    map_file = io.open(scriptdir() .. "/maps/" .. game:getdvar("mapname") .. ".lua", "r")
    if (map_file == nil) then
        print("[ZombieLand] Map not found!")
    else
        map_file:close()
        selected_map = require("maps/" .. game:getdvar("mapname"))

        BuildSequence(selected_map)
    end
end

return main_level