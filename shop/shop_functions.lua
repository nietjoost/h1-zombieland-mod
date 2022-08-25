-- [[ PLAYER SHOP functions ]] --
function GiveWeapon(player, weaponName, weaponCost)
    local weapons = player:getweaponslistall()
    for i = 1, #weapons do
        if weapons[i] == weaponName then
            player:PlayerMessage("^1You already have this weapon!")
            return
        end
    end

    local money = CheckPlayerMoney(player, weaponCost)
    if money == false then
        return
    end

    player:giveweapon(weaponName)
    player:switchtoweapon(weaponName)
    player:givemaxammo(weaponName)

    player:PlayerMessage("You bought a ^2weapon!")

    GoToMainMenu(player)
end

function GiveMaxAmmo(player, cost)
    local money = CheckPlayerMoney(player, cost)
    if money == false then
        return
    end

    player:PlayerMessage("^2 You bought max ammo!")

    local weapons = player:getweaponslistall()
    for i = 1, #weapons do
        player:givemaxammo(weapons[i])
        player:setweaponammoclip(weapons[i], 1000)
    end

    GoToMainMenu(player)
end

function GiveUnlimitedAmmo(player, cost)
    local money = CheckPlayerMoney(player, cost)
    if money == false then
        return
    end

    local timer = game:oninterval(function ()
        local weapon = player:getcurrentweapon()
        player:givestartammo(weapon)
        player:givemaxammo(weapon)
        player.infiniteAmmoActive = true
    end, 50)

    player:PlayerMessage("^2 You bought unlimited ammo for 1 minute!")

    GoToMainMenu(player)
    
    game:ontimeout(function()
        timer:clear()
        player:PlayerMessage("^1 Your unlimited ammo expired!")
    end, 5000 * 10)
end

function GiveWallHack(player, cost)
    local money = CheckPlayerMoney(player, cost)
    if money == false then
        return
    end

    player:thermalvisionfofoverlayon()
    player:PlayerMessage("^2 You bought wallhack for 5 minutes!")

    GoToMainMenu(player)
    
    game:ontimeout(function()
        player:thermalvisionfofoverlayoff()
        player:PlayerMessage("^1 Your wallhack expired!")
    end, 5000 * 60)
end


-- [[ Abstract function ]] --
function CheckPlayerMoney(player, cost)
    if player.money < cost then
        player:PlayerMessage("^1 You have not enough money!")
        return false
    end

    player:UpdateMoneyHUDBuy(player, cost)

    return true
end


function GoToMainMenu(player)
    player:notify("close_menu")
    player.menus = 1
    LoadMainMenu(player)
end