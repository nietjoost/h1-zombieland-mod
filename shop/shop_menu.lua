require("shop/shop_hud")
require("shop/shop_functions")
require("shop/shop_player")
require("shop/shop_weapons_config")

-- Customize color, alpha, and title. (Color uses RGB values divided by 255 iirc)
selected_color        = vector:new(0.0, 0.0, 0.0) 
not_selected_color    = vector:new(1.0, 1.0, 1.0) 
background_color      = vector:new(0.0, 0.0, 0.0)
background_alpha      = 0.3                    
outline_box_color     = vector:new(0.0, 0.0, 0.0) 
menu_text_color       = vector:new(255, 0, 17) 
menu_title            = "ZombieLand Shop"

main_menu_options = {"Weapon shop", "Perk shop"}

function shop_connected(player)
    player:notifyonplayercommand("toggle_menu", "+actionslot 2")
    initPlayer(player)

    player:onnotify("toggle_menu", function()
        if player.menus == 1 then
            player:notify("close_menu")
            return
        elseif player.menu_open == 1 then
            return
        end

        main_menu(player)
        player.menus = player.menus + 1
        player.menu_open = true
    end)
end

function main_menu(player)
    new_menu(player, main_menu_options,
    {
        function() 
            weaponMenu(player)
            player.menus = player.menus + 1
        end,
        function()
            perkMenu(player)
            player.menus = player.menus + 1
        end,
        function() 
            killstreakMenu(player) 
            player.menus = player.menus + 1
        end,
    }, function() 
        player:notify("destroy_menu")
        player.menus = player.menus - 1
        player.menu_open = false
    end)
end

function new_menu(player, options, actions, backaction)
    player:notify("destroy_menu")

    -- setup controls & notifies
    player:notifyonplayercommand("scroll_up", "+actionslot 3")
    player:notifyonplayercommand("scroll_down", "+activate")
    player:notifyonplayercommand("do_option", "+gostand")

    -- draw boxes
    local boxes = {}
    boxes[1] = drawbox(player, "icon", 200, -20, "center", "middle", "center", "middle", background_color, background_alpha, "white", 200, 330) -- background box
    boxes[2] = drawbox(player, "icon", 200, -180, "center", "middle", "center", "middle", outline_box_color, 1, "white", 200, 10) -- top box
    boxes[3] = drawbox(player, "icon", 200, 149, "center", "middle", "center", "middle", outline_box_color, 1, "white", 200, 10) -- bottom box 

    -- menu array & menu title at top
    local menu = {}
    local title = drawtext(player, "font", "default", 1.7, 200, -200, "center", "middle", "center", "middle", menu_text_color, 1, menu_title)

    local text_index = 1

    -- draw every option
    for option = 1, #options do
        if option > 10 then
            break
        end
        menu[option] = drawtext(player, "font", "default", 1.5, 200, -150 + (30 * (option - 1)), "center", "middle", "center", "middle", not_selected_color, 1, options[option])
    end
    menu[1].color = selected_color

    local scroll_up = player:onnotify("scroll_up", function()
        menu[text_index].color = not_selected_color
        text_index = ((text_index - 2) % #options) + 1;
        menu[text_index].color = selected_color
        end
    )

    local scroll_down = player:onnotify("scroll_down", function()
        menu[text_index].color = not_selected_color
        text_index = (text_index % #options) + 1;
        menu[text_index].color = selected_color
        end
    )

    local do_option = player:onnotify("do_option", function() actions[text_index]() end)
    local close_menu = player:onnotify("toggle_menu", function() backaction() end)
    local destroymenu = player:onnotifyonce("destroy_menu", function()
        for elem = 1, #menu do
            menu[elem]:reset()
            menu[elem]:destroy()
        end

        for elem = 1, #boxes do
            boxes[elem]:reset()
            boxes[elem]:destroy()
        end

        title:clearalltextafterhudelem()
        title:destroy()
    end)

    scroll_up:endon(player, "destroy_menu")
    scroll_down:endon(player, "destroy_menu")
    do_option:endon(player, "destroy_menu")
    close_menu:endon(player, "destroy_menu")
end

function GetWeaponString(player, type, cost)
    if player.money < cost then
        return (type .. "  ^1$" .. cost)
    else
        return (type .. "  ^2$" .. cost)
    end
end


function weaponMenu(player)
    new_menu(player, { GetWeaponString(player, "SMG", buy_weapons.weapon1cost), GetWeaponString(player, "LMG", buy_weapons.weapon1cost)}, {
        function() giveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
        function() giveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
    }, function() 
        player.menus = player.menus - 1
        main_menu(player)
    end)
end

function perkMenu(player)
new_menu(player, {"Perk 1", "Perk 2"}, {
        function() giveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
        function() giveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
    }, function() 
        player.menus = player.menus - 1
        main_menu(player)
    end)
end