-- [[ PLAYER CONNECTED ONCE ]] --
function PlayerConnectedOnce(player)
    -- Insert player to player lists
    table.insert(players, player)
    player.use_of_booster = 0
    player.use_of_zipline = 0

    -- If the game has started, set the type of player to zombie
    if config.started == true then
        table.insert(zombies, player)
        player.type = "zombie"
        player.money = 50
        player:ChangeTeam("axis")
    end

    -- First time player message
    player:onnotify("spawned_player", function()
        player:PlayerMessage("^4Welcome to ^1RooieRonnie's ^6Zombieland!")
        player:PlayerMessage("^5Creaded by ^2Joost de Niet!")
    end)
end

-- [[ PLAYER CONNECTED ]] --
function PlayerConnected(player)
    -- Default money if there is a error.
    player.money = 50

    HandleMenu(player)

    -- Check if the game can start
    if config.started == false and config.enough_people == false then
        start_zombieland()
        config.enough_people = true
    end

    -- Handle spawn player
    player:onnotify("spawned_player", function()
        if player.type == "zombie" then
            player:CreateTopMessage("You are now a zombie!", vector:new(1, 0, 0))
            player:GiveZombieClass()
            if player.savedPosistion ~= nil then
                player:setplayerangles(player.savedAngle)
                player:setorigin(player.savedPosistion)
                player:iprintlnbold("^2You spawned at your tactical insertion")
            end
            return
        elseif player.type == nil then
            table.insert(survivors, player)
            player:CreateTopMessage("Welcome to RooieRonnie's ZombieLand", vector:new(0, 1, 0))
            player.type = "survivor"
            player.money = 500   
            
            -- Survivor spawn message
            game:ontimeout(function()
                player:CreateTopMessage("Survive as long as possible to win!", vector:new(0, 0, 1))
                game:ontimeout(function()
                    player:CreateTopMessage("Press [{+actionslot 2}] to open the shop!", vector:new(0.86, 0.81, 0.34))
                end, 9000)
            end, 10000)   
        end

        -- standard surivivor script
        player:freezecontrols(false)
        player:GivePlayerClass()
        
        -- Temporary fix for tables
        if player.team == "allies" then
            player:RemovePlayerFromTable(zombies)
            table.insert(survivors, player)
        else
            player:RemovePlayerFromTable(survivors)
            table.insert(zombies, player)
        end
    end)
end

-- [[ HANDLE MENU ]] --
function HandleMenu(player)
    if config.started then
        player:scriptcall("maps/mp/gametypes/_menus", "setteam", "axis")
    else
        player:scriptcall("maps/mp/gametypes/_menus", "setteam", "allies")
    end
end

-- [[ PLAYER DISCONNECT ]] --
function PlyerDisconnected(player)  
    player:onnotifyonce("disconnect", function ()
        CheckForPlayers()
        player:RemovePlayerFromTable(players)
        player:RemovePlayerFromTable(survivors)
        player:RemovePlayerFromTable(zombies)
    end)
end