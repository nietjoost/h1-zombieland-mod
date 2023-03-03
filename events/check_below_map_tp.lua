-- [[ TP players below map to map ]] --
function CheckPlayersForBelowMap(below_map_y, below_map_tp)
    for player_below_map_index, player_below_map in ipairs(players) do
        if player_below_map.origin.z < below_map_y then               
            player_below_map:setorigin(below_map_tp)       
        end
    end
end