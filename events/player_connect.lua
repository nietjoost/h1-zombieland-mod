-- [[ PLAYER CONNECTED ONCE ]] --
function PlayerConnectedOnce(player)
    -- INSERT player to player lists
    table.insert(players, player)
    player.use_of_booster = 0
    player.use_of_zipline = 0
    player.spawned = 0
    player.money = 0

    -- MENU
    HandleMenu(player)

    -- FIRST time spawn logic
    player:onnotify("spawned_player", function()
        if player.spawned == 0 then
            -- ONE time message
            player:PlayerMessage("^4Welcome to ^1RooieRonnie's ^6Zombieland!")
            player:PlayerMessage("^5Creaded by ^2Joost de Niet!")

            -- If the game has started, set the type of player to zombie
            game:ontimeout(function()
                if config.started == true then
                    table.insert(zombies, player)
                    player:CreateTopMessage("You are now a zombie!", vector:new(1, 0, 0))
                    ZombieSpawnLogic(player)
                    player:ChangeTeam("axis")
                else

                    table.insert(survivors, player)
                    player:CreateTopMessage("Welcome to RooieRonnie's ZombieLand", vector:new(0, 1, 0))
                    SurvivorSpawnLogic(player)
                    
                    game:ontimeout(function()
                        player:CreateTopMessage("Survive as long as possible to win!", vector:new(0, 0, 1))
                        game:ontimeout(function()
                            player:CreateTopMessage("Press [{+actionslot 2}] to open the shop!", vector:new(0.86, 0.81, 0.34))
                        end, 9000)
                    end, 10000)   
                end
            end, 500)

            -- Set spawned player to YES
            player.spawned = 1
        end
    end)
end


-- [[ PLAYER CONNECTED ]] --
function PlayerConnected(player)
    -- Check if the game can start
    if config.started == false and config.enough_people == false then
        start_zombieland()
    end

    -- HANDLE spawn after DEAD
    player:onnotify("spawned_player", function()
        if player.type == "zombie" then
            ZombieSpawnLogic(player)
            if player.savedPosistion ~= nil then
                player:setplayerangles(player.savedAngle)
                player:setorigin(player.savedPosistion)
                player:iprintlnbold("^2You spawned at your tactical insertion")
                player.savedAngle = nil
                player.savedPosistion = nil
                player.tactical:delete()
            end
        elseif player.type == nil then
            SurvivorSpawnLogic(player)
        end
    end)
end