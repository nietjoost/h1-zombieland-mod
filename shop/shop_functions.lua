function infiniteAmmo(player)
    if player.infiniteAmmoActive == 1 then
        player:notify("endInfiniteAmmo")
        player.infiniteAmmoActive = false
        player:clientiprintln("Infinite Ammo ^1Disabled")
        return
    end

    local timer = game:oninterval(function ()
        local weapon = player:getcurrentweapon()
        player:givestartammo(weapon)
        player:givemaxammo(weapon)
        player.infiniteAmmoActive = true
    end, 50)

    player:clientiprintln("Infinite Ammo ^2Enabled")

    timer:endon(player, "disconnect")
    timer:endon(player, "endInfiniteAmmo")
end

function godmode(player)
    if player.godmode == 1 then
        player:notify("endGodmode")
        player.godmode = false
        player:clientiprintln("Godmode ^1Disabled")
        player.maxhealth = 100
        return
    end

    player:setperk( "specialty_falldamage", false );

    local timer = game:oninterval(function ()
        player.maxhealth = 10000 
        player.health = player.maxhealth
    end, 500)
 
    player.godmode = true
    player:clientiprintln("Godmode ^2Enabled")

    timer:endon(player, "disconnect")
    timer:endon(player, "endGodmode")
end

function toggleHighJumping(player)
    if game:getdvarint("jump_height") > 39 then
        game:setdvar("jump_height", 39)
        player:clientiprintln("High Jump ^1Disabled")
    else
        game:setdvar("jump_height", 999)
        player:clientiprintln("High Jump ^2Enabled")
    end
end

function giveWeapon(player, weaponName, weaponCost)
    if player.money < weaponCost then
        player:PlayerMessage("^1 You have not enough money!")
        return
    end

    local weapons = player:getweaponslistall()
    for i = 1, #weapons do
        if weapons[i] == weaponName then
            player:PlayerMessage("^1You already bought this weapon!")
            return
        end
    end

    player.money = player.money - weaponCost
    player:UpdateMoneyHUD()

    player:giveweapon(weaponName)
    player:switchtoweapon(weaponName)
    player:givemaxammo(weaponName)

    player:PlayerMessage("You bought a ^2weapon!")

    player:notify("close_menu")
    player.menus = 1
    main_menu(player)
end

function wallhack(player)
    if player.wallHack == 1 then
        player:thermalvisionfofoverlayoff()
        player.wallHack = false
        player:clientiprintln("Wallhack ^1Disabled")
    else
        player:thermalvisionfofoverlayon()
        player.wallHack = true
        player:clientiprintln("Wallhack ^2Enabled")
    end
end