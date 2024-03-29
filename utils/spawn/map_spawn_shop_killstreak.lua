-- [[ Local settings ]]
killstreak_cost = 4000

killstreak_refreshPosition = nil

-- [[ Spawn a killstreak shop model with UI shader ]] --
function SpawnShopKillStreak(position, angle)
    -- Set data
    killstreak_refreshPosition = position

    -- Set icon location
    SetShaderLocationKillStreak()

    -- Set shop location
    local box = game:spawn("script_model", position)
    box:setmodel("com_plasticcase_beige_big")
    box.angles = box.angles + angle
    box:show()

    local laptop = game:spawn("script_model", position + vector:new(0, 0, 30))
    laptop:setmodel("laptop_toughbook_01_open")
    laptop.angles = laptop.angles + vector:new(0, 90, 0) + angle
    laptop:show()
    laptop:makeusable()
    laptop:sethintstring("Press ^3[{+activate}]^7 to buy Air Support ^7[COST: ^2" .. killstreak_cost .. "^7]")

    -- Wait for players trigger
    laptop:onnotify("trigger", function(player)
        if player.type == "zombie" then
            player:iprintlnbold("This shop is not for zombies!");
            return
        end

        if player.money >= killstreak_cost then
            player:giveweapon("airstrike_mp")
            player:setactionslot(4, "weapon", "airstrike_mp")
            player:PlayerMessage("^2You bought an airstrike!");
            player:UpdateMoneyHUDBuy(killstreak_cost)
        else
            player:iprintlnbold("^1You don't have enough money!");
        end
    end)
end

-- [[ Set UI shader ]] --
function SetShaderLocationKillStreak()
    if killstreak_refreshPosition == nil then
        return
    end

    if iconhud2 ~= nil then
        iconhud2:destroy()
    end

    local iconhud2 = game:newhudelem()
    iconhud2:setshader("compass_objpoint_airstrike", 10, 10)
    iconhud2.x = killstreak_refreshPosition.x
    iconhud2.y = killstreak_refreshPosition.y
    iconhud2.z = killstreak_refreshPosition.z + 40
    iconhud2.hidewhendead = true
    iconhud2.hidewheninmenu = true
    iconhud2:setwaypoint(false, true)
    iconhud2.alpha = 1
end