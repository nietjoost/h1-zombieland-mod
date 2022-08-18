local do_not_touch_me = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
local helper_table = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
local random_number = 0
local new_random_number = 0

function spawnFlag(flagLocation)
    local teleportFlag = game:spawn("script_model", flagLocation)
    game:precachemodel("h1_flag_mp_domination_spetsnaz_red") 
    teleportFlag:setmodel("h1_flag_mp_domination_spetsnaz_red") 
    local teleportCircle = game:loadfx("vfx/unique/vfx_marker_ctf_red")
    game:playfx(teleportCircle, flagLocation) 
    game:precacheshader("waypoint_flag")
    if #helper_table > 0 then
        random_number = math.random(#helper_table)
    end
    for i = 1, #helper_table do
        if i == random_number then
            new_random_number = helper_table[random_number]
            table.remove(helper_table, i)
            game:objective_add(new_random_number, "active", "invisible", vector:new(0, 0, 0))
            game:objective_icon(new_random_number, "waypoint_flag")
            game:objective_state(new_random_number, "active")
            game:objective_position(new_random_number, flagLocation)
        end	
    end
end

function spawnFlagOutside(flagLocation)
    local teleportFlag = game:spawn("script_model", flagLocation)
    game:precachemodel("h1_flag_mp_domination_spetsnaz_red") 
    teleportFlag:setmodel("h1_flag_mp_domination_spetsnaz_red") 
    local teleportCircle = game:loadfx("vfx/unique/vfx_marker_ctf_red")
    game:playfx(teleportCircle, flagLocation) 
    game:precacheshader("waypoint_flag_enemy")
    if #helper_table > 0 then
        random_number = math.random(#helper_table)
    end
    for i = 1, #helper_table do
        if i == random_number then
            new_random_number = helper_table[random_number]
            table.remove(helper_table, i)
            game:objective_add(new_random_number, "active", "invisible", vector:new(0, 0, 0))
            game:objective_icon(new_random_number, "waypoint_flag_enemy")
            game:objective_state(new_random_number, "active")
            game:objective_position(new_random_number, flagLocation)
        end	
    end
end