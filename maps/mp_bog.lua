local map = {
    primary = "h1_ak74u_mp_a#silencer_f#kin_emblem80_camo340",
    secondary = "h1_deserteagle55_mp_a#none_f#base_emblem80",
    knife = "h1_meleefeb3_mp_a#none_f#base",
}

function building_map()
    for index, player in ipairs(players) do
        player:notify_message("Building map!", vector:new(0, 0, 1))
    end
end

map.main = function()
    game:ontimeout(building_map, 8000)


end

return map