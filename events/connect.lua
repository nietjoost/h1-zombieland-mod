function player_connected(player)
    table.insert(players, player)
    
    if config.started then
        player:scriptcall("maps/mp/gametypes/_menus", "_id_8027", "axis")
    else
        player:scriptcall("maps/mp/gametypes/_menus", "_id_8027", "allies")
    end

    if config.started == false and config.enough_people == false then
        start_zombieland()
        config.enough_people = true
    end

    player.money = 500

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
        end

        player:PlayerMessage("^4Welcome to ^1RooieRonnie's ^6Zombieland!")
        player:PlayerMessage("^5Creaded by ^2Joost de Niet!")
    end)

    AllPlayerSound("at_5_semtex_incoming")
end

function player_disconnected(player)  
    player:onnotifyonce("disconnect", function ()
        for i, p in ipairs(players) do
            if p == player then
                table.remove(players, i)
            end
        end

        for sur_index_dis, loop_sur_dis in ipairs(survivors) do
            if loop_sur_dis == player then
                table.remove(survivors, sur_index_dis)
            end
        end

        for zomb_index_dis, loop_zomb_dis in ipairs(zombies) do
            if loop_zomb_dis == player then
                table.remove(zombies, zomb_index_dis)
            end
        end
    end)
end