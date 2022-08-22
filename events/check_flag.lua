game:precachesound("rocket_explode_concrete_layer")

function check_flags(posFlag, posTP)
    for index, player in ipairs(players) do
        local maxDistance = 50

        for flagIndex, flag in ipairs(posFlag) do
            local distance = game:distance(player.origin, posFlag[flagIndex])
            if (distance <= maxDistance) then
                player:setorigin(posTP[flagIndex])
                player:clientiprintln("^4You have been teleported!")
                player:playlocalsound("rocket_explode_concrete_layer")        
            end
        end
    end

    for index2, player2 in ipairs(players) do
        --print(player2.origin)
    end
end