-- [[ HUD: create function ]]--
function entity:money_spawned()
    self.hudMoney = game:newclienthudelem(self)
    self.hudMoney.horzalign = "left"
    self.hudMoney.alignx = "left"
    self.hudMoney.y = 150
    self.hudMoney.x = 5
    self.hudMoney.font = "bigfixed"
    self.hudMoney.fontscale = 1.2
    self.hudMoney.hidewhendead = true
    self.hudMoney.hidewheninmenu = true
    self.hudMoney.glowalpha = 0.3
    self.hudMoney.glowcolor = vector:new(0, 0, 1)
    self.hudMoney:settext("$" .. self.money)
end

function entity:money_annimation(local_money)   
    if self.hudMoneyExtra ~= nil then
        self.hudMoneyExtra:destroy()
    end

    self.hudMoneyExtra = game:newclienthudelem(self)
    self.hudMoneyExtra.horzalign = "left"
    self.hudMoneyExtra.alignx = "left"
    self.hudMoneyExtra.y = 150
    self.hudMoneyExtra.x = 5
    self.hudMoneyExtra.font = "bigfixed"
    self.hudMoneyExtra.fontscale = 1.2
    self.hudMoneyExtra.glowalpha = 0.3
    self.hudMoneyExtra.glowcolor = vector:new(0, 1, 0)
    self.hudMoneyExtra:settext("$" .. local_money)
    self.hudMoneyExtra:moveovertime(1)
    self.hudMoneyExtra:fadeovertime(1)
    self.hudMoneyExtra.alpha = 0
    self.hudMoneyExtra.x = 56
    self.hudMoneyExtra.y = 187

    game:ontimeout(function()
        if self.hudMoneyExtra ~= nil then
            self.hudMoneyExtra:destroy()
        end
    end, 1000)
end

-- [[ HUD: update money function ]]--
function entity:update_money_HUD()
    if self.type == "zombie" then
        self.money = self.money + 50
        self:money_annimation(50)
    else
        self.money = self.money + 500
        self:money_annimation(500)
    end
    self.hudMoney:settext("$" .. self.money)
end

-- [[ EVENT: set money HUD ]]--
function money_connected(player)
    player:onnotify("spawned_player", function()
        player:money_spawned()
    end)
end
