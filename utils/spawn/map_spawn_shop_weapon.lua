-- [[ Local settings ]]
weapon_cost = 2000

weapon_refreshPosition = nil

-- [[ Spawn a weapon shop model with UI shader ]] --
function SpawnShopWeapon(position, angle)
    -- Set data
    weapon_refreshPosition = position + vector:new(0, 0, 15)

    -- Set icon location
    SetShaderLocationWeapon()

    -- Set shop location
    local bomb = game:spawn("script_model", position)
    bomb:setmodel("com_bomb_objective")
    bomb.angles = bomb.angles + vector:new(0, 90, 0) + angle
    bomb:show()
    bomb:makeusable()
    bomb:sethintstring("Press ^3[{+activate}]^7 to buy your next weapon upgrade ^7[COST: ^2" .. weapon_cost .. "^7]")

    -- Wait for players trigger
    bomb:onnotify("trigger", function(player)
        if player.type == "zombie" then
            player:iprintlnbold("This shop is not for zombies!");
            return
        end

        if player.money >= weapon_cost then

            if player.weapon_upgrade > #upgrade_weapons then
                player:iprintlnbold("^6There is no weapon upgrade left!");
                return
            end

            player:giveweapon(upgrade_weapons[player.weapon_upgrade])
            player:switchtoweapon(upgrade_weapons[player.weapon_upgrade])
            player:UpdateMoneyHUDBuy(weapon_cost)
            player.weapon_upgrade = player.weapon_upgrade + 1
        else
            player:iprintlnbold("^1You don't have enough money!");
        end
    end)
end

-- [[ Set UI shader ]] --
function SetShaderLocationWeapon()
    if weapon_refreshPosition == nil then
        return
    end

    if iconhud ~= nil then
        iconhud:destroy()
    end

    local iconhud = game:newhudelem()
    iconhud:setshader("hud_icon_m9beretta", 10, 10)
    iconhud.x = weapon_refreshPosition.x
    iconhud.y = weapon_refreshPosition.y
    iconhud.z = weapon_refreshPosition.z + 40
    iconhud.hidewhendead = true
    iconhud.hidewheninmenu = true
    iconhud:setwaypoint(false, true)
    iconhud.alpha = 1
end