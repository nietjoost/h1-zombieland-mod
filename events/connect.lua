function entity:player_spawned()

end

function player_connected(player)
    table.insert(players, player)
    
    player:scriptcall("maps/mp/gametypes/_menus", "_id_8027", "allies")

    player.money = 500

    player:onnotify("spawned_player", function()
        if player.type == "zombie" then
            player:welcome_message("You are now a zombie!", vector:new(1, 0, 0))
            player:giveZombieClass()
            
        elseif player.type == nil then
            player:welcome_message("Welcome to RooieRonnie's ZombieLand", vector:new(0, 1, 0))
            player:givePlayerClass()

            game:ontimeout(function()

                player:welcome_message("Survive as long as possible to win!", vector:new(1, 0, 0))

                game:ontimeout(function()
                    player:welcome_message("Press [{+actionslot 2}] to open the shop!", vector:new(0, 0, 1))
                end, 9000)
            end, 10000)
        end

        player:clientMsg("^4Welcome to ^1RooieRonnie's ^6Zombieland!")
        player:clientMsg("^5Creaded by ^2Joost de Niet!")

        local weapons = player:getweaponslistall()
        for i = 1, #weapons do
            print(weapons[i])
        end
    end)

    all_player_sound("at_5_semtex_incoming")
end

function player_disconnected(player)  
    player:onnotifyonce("disconnect", function ()
        for i, p in ipairs(players) do
            if p == player then
                table.remove(players, i);
                break;
            end
        end
    end)
end