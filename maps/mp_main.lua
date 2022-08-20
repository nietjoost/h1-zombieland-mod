main_level  = {}

function buildSequence(map)
    for index, player in ipairs(players) do
        player:notify_message("Building map!", vector:new(0, 0, 1))
    end

    building = building_map()

    if building then
        game:oninterval(function()
            check_flags(map.posFlag, map.posTP)
        end, 0)
    end
end


main_level.main = function()
    mapfile = io.open(scriptdir() .. "/maps/" .. game:getdvar("mapname") .. ".lua", "r")
    if (mapfile == nil) then
        print("[ZombieLand] Map not found!")
    else
        mapfile:close()
        map = require("maps/" .. game:getdvar("mapname"))
        
        game:ontimeout(function()
            buildSequence(map)
        end, 6000)
    end
end

return main_level