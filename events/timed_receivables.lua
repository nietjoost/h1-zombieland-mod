-- [[ TIMED RECEIVALES ]] --
function TimedReceivables()
    game:oninterval(function()
        for _, player in ipairs(players) do

            if game:scriptcall("maps/mp/_utility", "isreallyalive", player) == false then
                return
            end

            if config.started == true and player.type == "survivor" then
                GivePlayerTimedMoney(player)
            end
            
            if config.started == true and player.type == "zombie" then
                GiveZombieTimed(player)
            end
        end
    end, 60000)
end

function GivePlayerTimedMoney(player)
    player:UpdateMoneyHUDKill()
    player:iprintln("You received ^2$500 ^7for staying alive!")
end

function GiveZombieTimed(player)
    player:UpdateMoneyHUDKill()
    player:iprintln("You received ^2$50^7!")
end

-- [[ START THE INTERVAL RECEIVABLES - event ]]--
TimedReceivables()