-- [[ PLAYER DISCONNECT ]] --
function PlyerDisconnected(player)  
    player:onnotifyonce("disconnect", function ()
        CheckForPlayers()
        player:RemovePlayerFromTable(players)
        player:RemovePlayerFromTable(survivors)
        player:RemovePlayerFromTable(zombies)
    end)
end