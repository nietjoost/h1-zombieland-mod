function PlayerConnectedMegaZombie(player)
    player:notifyonplayercommand("enable_mega_zombie", "+actionslot 3")

    player:onnotify("enable_mega_zombie", function()
        -- Clear Mega Zombies List
        megazombies = {}

        if #players > 3 then
            player:PlayerMessage("^7Started the mega zombie!")

            megazombie = players[2]
            table.insert(megazombies, player)

            megazombie = players[3]
            table.insert(megazombies, player)

            megazombie = players[4]
            table.insert(megazombies, player)

            player:PlayerMessage("List filled with " .. #megazombies)

            local pos1 = game:spawn("script_model", megazombies[1].origin + vector:new(40, 0, 10))
            pos1:setmodel("tag_origin")
            megazombies[2].origin = pos1
            megazombies[2]:playerlinkto(pos1)

            local pos2 = game:spawn("script_model", megazombies[1].origin + vector:new(-40, 0, 10))
            pos2:setmodel("tag_origin")
            megazombies[3].origin = pos2
            megazombies[3]:playerlinkto(pos2)
        else
            player:PlayerMessage("^2Not enough people to start the mega zombie!")
        end
    end)
end