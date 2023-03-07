boosters = {}

function SpawnBoost(startPos)
    -- Spawn effect
    local boostEffect = game:loadfx("fx/misc/ui_pickup_available_bright")
    game:playfx(boostEffect, startPos)

    -- Model
    local tire = game:spawn("script_model", startPos + vector:new(0, 0, 2))
    tire:setmodel("afr_junktire")
    tire.angles = vector:new(0, 0, 90)
    tire:show()

    -- Add and check booster
    table.insert(boosters, startPos)

    if #boosters == 1 then
        CheckPlayersByBoosters()
    end
end


function CheckPlayersByBoosters()
    game:oninterval(function()
        for player_flag_index, player_flag in ipairs(players) do
            local max_distance = 20
            for booster_index, flag in ipairs(boosters) do
                local player_distance = game:distance(player_flag.origin, boosters[booster_index])
                if (player_distance <= max_distance) then
                    player_flag:playlocalsound("weap_harrier_missile_fire")       
                end
            end
        end
    end, 100)
end