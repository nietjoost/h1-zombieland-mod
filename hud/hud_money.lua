-- [[ HUD: money create function ]]--
function entity:CreateMoneyHUD()
    if self:is_bot() == true then
        return
    end

    if self.hud_money ~= nil then
        self.hud_money:destroy()
    end

    self.hud_money = game:newclienthudelem(self)
    self.hud_money.horzalign = "left"
    self.hud_money.alignx = "left"
    self.hud_money.y = 115
    self.hud_money.x = 150
    self.hud_money.font = "bigfixed"
    self.hud_money.fontscale = 1.2
    self.hud_money.hidewhendead = true
    self.hud_money.hidewheninmenu = true
    self.hud_money.glowalpha = 0.3
    self.hud_money.glowcolor = vector:new(0, 1, 0)
    if self.type == "zombie" then
        self.hud_money.glowcolor = vector:new(1, 0, 0)
    end
    self.hud_money:settext("$" .. self.money)
end


-- [[ HUD: animate money function ]]--
function entity:AnimateMoneyHUDKill(local_money)   
    if self:is_bot() == true then
        return
    end

    if self.hud_money_extra ~= nil then
        self.hud_money_extra:destroy()
    end

    self.hud_money_extra = game:newclienthudelem(self)
    self.hud_money_extra.horzalign = "left"
    self.hud_money_extra.alignx = "left"
    self.hud_money_extra.y = 115
    self.hud_money_extra.x = 150
    self.hud_money_extra.font = "bigfixed"
    self.hud_money_extra.fontscale = 1.2
    self.hud_money_extra.glowalpha = 0.3
    self.hud_money_extra.glowcolor = vector:new(0, 1, 0)
    if self.type == "zombie" then
        self.hud_money_extra.glowcolor = vector:new(1, 0, 0)
    end
    self.hud_money_extra:settext("$" .. local_money)
    self.hud_money_extra:moveovertime(2)
    self.hud_money_extra:fadeovertime(2)
    self.hud_money_extra.alpha = 0
    self.hud_money_extra.x = 56
    self.hud_money_extra.y = 187

    game:ontimeout(function()
        if self.hud_money_extra ~= nil then
            self.hud_money_extra:destroy()
        end
    end, 2000)
end

function entity:AnimateMoneyHUDBuy(local_money)
    if self:is_bot() == true then
        return
    end

    if self.hud_money_buy ~= nil then
        self.hud_money_buy:destroy()
    end

    self.hud_money_buy = game:newclienthudelem(self)
    self.hud_money_buy.horzalign = "left"
    self.hud_money_buy.alignx = "left"
    self.hud_money_buy.y = 115
    self.hud_money_buy.x = 150
    self.hud_money_buy.font = "bigfixed"
    self.hud_money_buy.fontscale = 1.2
    self.hud_money_buy.glowalpha = 0.3
    self.hud_money_buy.glowcolor = vector:new(1, 0, 0)
    self.hud_money_buy:settext("-$" .. local_money)
    self.hud_money_buy:moveovertime(2)
    self.hud_money_buy:fadeovertime(2)
    self.hud_money_buy.alpha = 0
    self.hud_money_buy.x = 54
    self.hud_money_buy.y = 167

    game:ontimeout(function()
        if self.hud_money_buy ~= nil then
            self.hud_money_buy:destroy()
        end
    end, 2000)
end

-- [[ HUD: update money function ]]--
function entity:UpdateMoneyHUDKill()
    if self:is_bot() == true then
        return
    end

    if self.type == "zombie" then
        self.money = self.money + 50
        self:AnimateMoneyHUDKill(50)
    else
        self.money = self.money + 500
        self:AnimateMoneyHUDKill(500)
    end

    if self.hud_money == nil then
        self:CreateMoneyHUD()
    end

    self.hud_money:settext("$" .. self.money)
end

function entity:UpdateMoneyHUDBuy(cost)
    self.money = self.money - cost

    self:AnimateMoneyHUDBuy(cost)

    self.hud_money:settext("$" .. self.money)
end


-- [[ EVENT: set money HUD ]]--
function MoneyConnected(player)
    player:onnotify("spawned_player", function()
        player:CreateMoneyHUD()
    end)
end