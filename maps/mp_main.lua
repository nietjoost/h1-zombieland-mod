-- [[ VARIABLE ]] --
main_level  = {}

-- [[ Build sequence with teleport check ]] --
function BuildSequence(selected_map)
    AllPlayerNotifyMessage("Building map!", vector:new(0, 0, 1))

    building_succes = BuildMap()

    if building_succes then
        game:oninterval(function()
            CheckPlayersForFlags(selected_map.posFlag, selected_map.posTP)
        end, 200)

        game:oninterval(function()
            CheckPlayersForBelowMap(selected_map.below_map_y, selected_map.below_map_tp)
        end, 1000)
    end
end

-- [[ Level manager: main function ]] --
main_level.main = function()
    map_file = io.open(scriptdir() .. "/maps/" .. game:getdvar("mapname") .. ".lua", "r")
    if (map_file == nil) then
        print("[ZombieLand] Map not found!")
    else
        map_file:close()
        selected_map = require("maps/" .. game:getdvar("mapname"))
        
        game:ontimeout(function()
            BuildSequence(selected_map)
        end, 6000)
    end
end

return main_level