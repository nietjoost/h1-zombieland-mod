-- [[ PLAYER WATCH EVENTS ]] --
function PlayerConnectedWatchEvents(player)
    -- CHECK FOR WEAPON PICK-UP ZOMBIES
    player:onnotify("weapon_change", function()
        if player.type == "zombie" then
            local weapons = player:getweaponslistall()
            for i = 1, #weapons do
                if (weapons[i] ~= "h1_meleejun4_mp_a#none_f#base" and weapons[i] ~= "h1_concussiongrenade_mp")  then
                    player:GiveZombieClass()
                    player:PlayerMessage("^1You cannot pick-up weapons as a zombie!")
                end
            end
        end
    end)

    -- CHECK FOR CLAYMORE placing
    player:notifyonplayercommand("cancel_claymore", "+actionslot 3")
    player:onnotify("cancel_claymore", function()
        if player.type == "zombies" then   
            player:takeallweapons()
            player.savedPosistion = player.origin
            player.savedAngle = player.angles
            player:iprintlnbold("^2Tactical insertion is set")

            game:ontimeout(function()
                player:GiveZombieClass()
            end, 300)
        end
    end)
end