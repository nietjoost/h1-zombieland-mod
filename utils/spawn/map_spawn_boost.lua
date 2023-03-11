boosters = {}

-- [[ Spawn boosters FX and model ]] --
function SpawnBoost(startPos, height)
    -- Spawn effect
    local boostEffect = game:loadfx("fx/misc/ui_pickup_available_bright")
    game:playfx(boostEffect, startPos)

    -- Model
    local tire = game:spawn("script_model", startPos + vector:new(0, 0, 2))
    tire:setmodel("afr_junktire")
    tire.angles = vector:new(0, 0, 90)
    tire:show()

    -- Add and check booster
    local boost = {}
    boost.height = height
    boost.startPos = startPos
    table.insert(boosters, boost)

    -- Make sure there is only one oninterval for the boosters
    if #boosters == 1 then
        CheckPlayersByBoosters()
    end
end

-- [[ Loop event to check players that are near by boosters ]] --
function CheckPlayersByBoosters()
    game:oninterval(function()
        for player_boost_index, player_boost in ipairs(players) do
            local max_distance = 20
            for booster_index, booster in ipairs(boosters) do
                local player_distance = game:distance(player_boost.origin, boosters[booster_index].startPos)
                if (player_distance <= max_distance and player_boost.use_of_booster == 0) then
                    -- Set player settings
                    player_boost:playlocalsound("weap_harrier_missile_fire")
                    player_boost.health = 9999
                    player_boost.use_of_booster = 1
                    
                    -- Calculate the the TP steps
                    posa = player_boost.origin
                    fpos = math.floor(boosters[booster_index].height / 2)
                    h = player_boost.origin.z

                    -- Create loop through TP steps
                    for j = 1, fpos, 1 
                    do 
                        h = h + fpos
                        game:ontimeout(function()
                            player_boost:setorigin(boosters[booster_index].startPos + vector:new(0,0,h))
                        end, ms(0.1))
                    end
                   
                    -- Reset health and enable boost
                    game:ontimeout(function()
                        player_boost.health = 100
                        player_boost.use_of_booster = 0
                    end, ((fpos * ms(0.1)) + math.floor(boosters[booster_index].height / 10)))                 
                end
            end
        end
    end, 100)
end