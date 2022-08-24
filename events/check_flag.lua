game:precachesound("rocket_explode_concrete_layer")

function check_flags(posFlag, posTP)
    for player_flag_index, player_flag in ipairs(players) do
        local max_distance = 50

        for flag_index, flag in ipairs(posFlag) do
            local player_distance = game:distance(player_flag.origin, posFlag[flag_index])
            if (player_distance <= max_distance) then
                player_flag:setorigin(posTP[flag_index])
                player_flag:clientiprintln("^4You have been teleported!")
                player_flag:playlocalsound("rocket_explode_concrete_layer")        
            end
        end
    end
end