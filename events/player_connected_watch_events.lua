-- [[ PLAYER WATCH EVENTS ]] --

-- CHECK FOR WEAPON PICK-UP ZOMBIES
function PlayerConnectedWatchEvents(player)
    player:onnotify("weapon_change", function()
        if player.type == "zombie" then
            local weapons = player:getweaponslistall()
            for i = 1, #weapons do
                if weapons[i] ~= "h1_meleejun4_mp_a#none_f#base" then
                    player:GiveZombieClass()
                    player:PlayerMessage("^1You cannot pick-up weapons as a zombie!")
                end
            end
        end
    end)
end