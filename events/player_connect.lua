-- [[ PLAYER CONNECTED ONCE ]] --
function PlayerConnectedOnce(player)
    table.insert(players, player)

    -- If the game has started, set the type of player to zombie
    if config.started == true then
        player.type = "zombie"
    end

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

    if config.started == false and config.enough_people == false then
        start_zombieland()
        config.enough_people = true
    end

    player:onnotify("spawned_player", function()
        if player.type == "zombie" then
            player:CreateTopMessage("You are now a zombie!", vector:new(1, 0, 0))
            player:GiveZombieClass()
            
        elseif player.type == nil then
            table.insert(survivors, player)
            player:CreateTopMessage("Welcome to RooieRonnie's ZombieLand", vector:new(0, 1, 0))
            player:GivePlayerClass()

            game:ontimeout(function()

                player:CreateTopMessage("Survive as long as possible to win!", vector:new(1, 0, 0))

                game:ontimeout(function()
                    player:CreateTopMessage("Press [{+actionslot 2}] to open the shop!", vector:new(0, 0, 1))
                end, 9000)
            end, 10000)

            player.type = "survivor"
            player:freezecontrols(false)
        else
            player:GivePlayerClass()
        end
    end)
end

-- [[ HANDLE MENU ]] --
function HandleMenu(player)
    if config.started then
        player:scriptcall("maps/mp/gametypes/_menus", "setteam", "axis")
        player.money = 50
    else
        player:scriptcall("maps/mp/gametypes/_menus", "setteam", "allies")
        player.money = 500
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