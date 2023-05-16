-- [[ Spawn booster logic ]] --
boostersFirstPos = {}
boostersHeight = {}
boosters = {}

function AddBooster(startPos, height)
    table.insert(boostersFirstPos, startPos)
    table.insert(boostersHeight, height)
end

function BuildBoosters()
    delay = 300
    for booster_index, booster in ipairs(boostersFirstPos) do
        game:ontimeout(function()
            SpawnBooster(boostersFirstPos[booster_index], boostersHeight[booster_index])
            SpawnBooster(boostersFirstPos[booster_index], boostersHeight[booster_index])
        end, 300)
        delay = delay + 300
    end
end

-- [[ Spawn boosters FX and model ]] --
function SpawnBooster(startPos, height)
    -- Spawn effect
    local boostEffect = game:loadfx("fx/misc/ui_pickup_available_bright")
    game:playfx(boostEffect, startPos)

    -- Model (DISABLED, NOT ALL MAPS SUPPORT THIS MODEL)
    --local tire = game:spawn("script_model", startPos + vector:new(0, 0, 2))
    --tire:setmodel("afr_junktire")
    --tire.angles = vector:new(0, 0, 90)
    --tire:show()

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
                    player_boost.maxhealth = 999999
                    player_boost.health = 999999
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
                        player_boost.maxhealth = 100
                        player_boost.health = 100
                        player_boost.use_of_booster = 0
                    end, ((fpos * ms(0.1)) + math.floor(boosters[booster_index].height / 10)))                 
                end
            end
        end
    end, 100)
end