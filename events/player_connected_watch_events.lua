-- [[ PLAYER WATCH EVENTS ]] --
function PlayerConnectedWatchEvents(player)

    -- CHECK FOR CLAYMORE placing
    player:notifyonplayercommand("cancel_claymore", "+actionslot 3")
    player:onnotify("cancel_claymore", function()
        if player.type == "zombie" then

            local weapons = player:getweaponslistall()
            for i = 1, #weapons do
                if weapons[i] == "h1_claymore_mp" then
                    player:takeallweapons()
                    player.savedPosistion = player.origin
                    player.savedAngle = player.angles
                    player:iprintlnbold("^2Tactical insertion is set")

                    game:ontimeout(function()
                        player:GiveZombieClassClaymore()
                    end, 300)
                end
            end
        end
    end)
end