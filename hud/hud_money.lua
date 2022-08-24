-- [[ HUD: money create function ]]--
function entity:CreateMoneyHUD()
    self.hud_money = game:newclienthudelem(self)
    self.hud_money.horzalign = "left"
    self.hud_money.alignx = "left"
    self.hud_money.y = 150
    self.hud_money.x = 5
    self.hud_money.font = "bigfixed"
    self.hud_money.fontscale = 1.2
    self.hud_money.hidewhendead = true
    self.hud_money.hidewheninmenu = true
    self.hud_money.glowalpha = 0.3
    self.hud_money.glowcolor = vector:new(0, 0, 1)
    self.hud_money:settext("$" .. self.money)
end


-- [[ HUD: animate money function ]]--
function entity:AnimateMoneyHUD(local_money)   
    if self.hud_money_extra ~= nil then
        self.hud_money_extra:destroy()
    end

    self.hud_money_extra = game:newclienthudelem(self)
    self.hud_money_extra.horzalign = "left"
    self.hud_money_extra.alignx = "left"
    self.hud_money_extra.y = 150
    self.hud_money_extra.x = 5
    self.hud_money_extra.font = "bigfixed"
    self.hud_money_extra.fontscale = 1.2
    self.hud_money_extra.glowalpha = 0.3
    self.hud_money_extra.glowcolor = vector:new(0, 1, 0)
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


-- [[ HUD: update money function ]]--
function entity:UpdateMoneyHUD()
    if self.type == "zombie" then
        self.money = self.money + 50
        self:AnimateMoneyHUD(50)
    else
        self.money = self.money + 500
        self:AnimateMoneyHUD(500)
    end
    self.hud_money:settext("$" .. self.money)
end


-- [[ EVENT: set money HUD ]]--
function MoneyConnected(player)
    player:onnotify("spawned_player", function()
        player:CreateMoneyHUD()
    end)
end