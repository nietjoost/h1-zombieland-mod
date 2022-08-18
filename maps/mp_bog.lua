local map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

local posFlag = {
    flag1pos = vector:new(6080.000000, 880.000000, 20.271774),
}

local posTP = {
    teleport1pos = vector:new(1,1,1),
}

function building_map()
    -- Message building
    for index, player in ipairs(players) do
        player:notify_message("Building map!", vector:new(0, 0, 1))
    end

    -- Build map
    local loadfxshit = game:loadfx("vfx/unique/vfx_marker_dom_white")
    game:playfx(loadfxshit , posFlag.flag1pos)

    --level._id_2CDF[var_0._id_4450]_id_6304 = maps\mp\gametypes\_gameobjects::_id_4041()
    --objective_add(level._id_2CDF[var_0._id_4450]._id_6304, "invisible", (0, 0, 0))
    --objective_add(level._id_2CDF[var_0._id_4450]._id_6304, "waypoint_dogtags")

    -- Done building message
    for index, player in ipairs(players) do
        player:clientiprintln("^1Done building!")
    end
end

function check_flags()
    for index, player in ipairs(players) do
        local maxDistance = 60
        --for index, flag in ipairs(posFlag) do
            --print(flag)
            local distance = game:distance(player.origin, vector:new(6080.000000, 880.000000, 20.271774))
            if (distance <= maxDistance) then
                player:setorigin(vector:new(6080.000000, 880.000000, 20.271774))
            end
        --end
    end 
end

map.main = function()
    game:ontimeout(building_map, 8000)

    game:oninterval(function()
        check_flags()
    end, 0)
end

return map