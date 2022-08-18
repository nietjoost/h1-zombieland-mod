game:precachesound("mp_challenge_complete")

local map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

local posFlag = { 
    vector:new(6047.105957, 1799.957764, 9.609579),
    vector:new(4455.023926, 1369.031738, 103.615898),
    vector:new(6375.125000, 1236.076904, 49.125000),
    vector:new(1528.849243, -535.244507, 258.125000),
    vector:new(3432.508301, -74.840248, -25.954500),
    vector:new(3728.712158, -987.368530, -12.692110),
}

local posTP = {
    vector:new(6408.397461, 27.427656, 49.125000),
    vector:new(853.135803, -216.277695, 458.125000),
    vector:new(6080.000000, 880.000000, 20.271774),
    vector:new(2115.813721, 70.457253, -25.017788),
    vector:new(3613.763916, -487.735199, -30.083664),
    vector:new(4092.301025, 430.048920, -5.968887),
}

function building_map()
    -- Message building
    for index, player in ipairs(players) do
        player:notify_message("Building map!", vector:new(0, 0, 1))
    end

    -- Build map
    spawnFlag(posFlag[1])
    spawnFlag(posFlag[2])
    spawnFlagOutside(posFlag[3])
    spawnFlagOutside(posFlag[4])
    spawnFlag(posFlag[5])
    spawnFlagOutside(posFlag[6])

    -- Done building message
    for index, player in ipairs(players) do
        player:clientiprintln("^1Done building the map!")
    end
end

function check_flags()
    for index, player in ipairs(players) do
        local maxDistance = 60

        for flagIndex, flag in ipairs(posFlag) do
            local distance = game:distance(player.origin, posFlag[flagIndex])
            if (distance <= maxDistance) then
                player:setorigin(posTP[flagIndex])
                player:clientiprintln("^4You have been teleported!")
                player:playlocalsound("mp_challenge_complete")        
            end
        end
    end

    for index2, player2 in ipairs(players) do
        print(player2.origin)
    end
end

map.main = function()
    game:ontimeout(building_map, 8000)

    game:oninterval(function()
        check_flags()
    end, 0)
end

return map