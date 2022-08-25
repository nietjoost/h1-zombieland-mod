-- [[ MENU require's ]] --
require("shop/shop_hud")
require("shop/shop_functions")
require("shop/shop_player")
require("shop/shop_weapons_config")


-- [[ MENU settings ]] --
-- Customize color, alpha, and title. (Color uses RGB values divided by 255 iirc)
selected_color        = vector:new(0.0, 0.0, 0.0)
not_selected_color    = vector:new(1.0, 1.0, 1.0) 
background_color      = vector:new(0.0, 1.0, 1.0)
background_alpha      = 0.3                    
outline_box_color     = vector:new(0.0, 1.0, 1.0)
menu_text_color       = vector:new(0.0, 0.0, 1.0)
menu_title            = "ZombieLand Shop"
menu_status_color     = vector:new(1.0, 0.0, 0.0)


-- [[ MAIN menu options ]] --
main_menu_options = {"General shop", "Weapon shop", "Perk shop"}


-- [[ MAIN MENU event ]] --
function ShopConnected(player)
    player:notifyonplayercommand("toggle_menu", "+actionslot 2")
    initPlayer(player)

    player:onnotify("toggle_menu", function()
        if player.menus == 1 then
            player:notify("close_menu")
            return
        elseif player.menu_open == 1 then
            return
        end

        LoadMainMenu(player)
        player.menus = player.menus + 1
        player.menu_open = true
    end)
end

function LoadMainMenu(player)
    CreateMenu(player, main_menu_options,
    {
        function() 
            GeneralMenu(player)
            player.menus = player.menus + 1
        end,
        function()
            WeaponMenu(player)
            player.menus = player.menus + 1
        end,
        function() 
            PerkMenu(player) 
            player.menus = player.menus + 1
        end,
    }, function() 
        player:notify("destroy_menu")
        player.menus = player.menus - 1
        player.menu_open = false
    end)
end


-- [[ Create MAIN menu ]] --
function CreateMenu(player, options, actions, backaction)
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


-- [[ Create SUB MENU ]] --
function WeaponMenu(player)
    CreateMenu(player, { GetBuyString(player, "SMG", buy_weapons.weapon1cost), GetBuyString(player, "Assault", buy_weapons.weapon2cost),
    GetBuyString(player, "LMG", buy_weapons.weapon3cost), GetBuyString(player, "Sniper", buy_weapons.weapon4cost),
    GetBuyString(player, "Shotgun", buy_weapons.weapon4cost)}, {
        function() GiveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
        function() GiveWeapon(player, buy_weapons.weapon2, buy_weapons.weapon2cost) end,
        function() GiveWeapon(player, buy_weapons.weapon3, buy_weapons.weapon3cost) end,
        function() GiveWeapon(player, buy_weapons.weapon4, buy_weapons.weapon4cost) end,
        function() GiveWeapon(player, buy_weapons.weapon5, buy_weapons.weapon5cost) end,
    }, function() 
        player.menus = player.menus - 1
        LoadMainMenu(player)
    end)
end

function PerkMenu(player)
CreateMenu(player, {"Perk 1", "Perk 2"}, {
        function() GiveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
        function() GiveWeapon(player, buy_weapons.weapon1, buy_weapons.weapon1cost) end,
    }, function() 
        player.menus = player.menus - 1
        LoadMainMenu(player)
    end)
end

function GeneralMenu(player)
CreateMenu(player, { GetBuyString(player, "Max ammo", 2000),  GetBuyString(player, "Unlimited ammo", 4000), GetBuyString(player, "Wallhack", 5000)}, {
        function() GiveMaxAmmo(player, 2) end,
        function() GiveUnlimitedAmmo(player, 4) end,
        function() GiveWallHack(player, 5) end,
    }, function() 
        player.menus = player.menus - 1
        LoadMainMenu(player)
    end)
end


-- [[ Extra menu functions ]] --
function GetBuyString(player, type, cost)
    if player.money < cost then
        return (type .. "  ^1$" .. cost)
    else
        return (type .. "  ^2$" .. cost)
    end
end