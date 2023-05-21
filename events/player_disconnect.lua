-- [[ PLAYER DISCONNECT ]] --
function PlyerDisconnected(player)  
    player:onnotifyonce("disconnect", function ()
        player:RemovePlayerFromTable(players)
        player:RemovePlayerFromTable(survivors)
        player:RemovePlayerFromTable(zombies)

        -- LOG to server console
        if player:is_bot() == false then
            print("Player " .. player.name .. " LEFT the server!")
        end

        CheckForPlayers()
    end)
end