-- [[ Spawn a shop model with UI shader ]] --
function SpawnShop(position, angle, shader)
    -- Set icon location
    local iconhud = game:newhudelem()
    iconhud:setshader(shader, 10, 10)
    iconhud.x = position.x
    iconhud.y = position.y
    iconhud.z = position.z + 40
    iconhud.hidewhendead = true
    iconhud.hidewheninmenu = true
    iconhud:setwaypoint(false, true)
    iconhud.alpha = 1

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
    laptop:sethintstring("Press ^3[{+activate}]^7 to buy Air Support ^7[COST: ^29000^7]")

    -- Wait for players trigger
    laptop:onnotify("trigger", function(player)
        if player.type == "zombie" then
            player:iprintlnbold("This shop is not for zombies!");
            return
        end

        if player.money >= 9000 then
        else
            player:iprintlnbold("^9You don't have enough money!");
        end
    end)
end