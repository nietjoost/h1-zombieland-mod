-- [[ PLAYER DISCONNECT ]] --
function PlyerDisconnected(player)  
    player:onnotifyonce("disconnect", function ()
        player:RemovePlayerFromTable(players)
        player:RemovePlayerFromTable(survivors)
        player:RemovePlayerFromTable(zombies)

        CheckForPlayers()
    end)
end