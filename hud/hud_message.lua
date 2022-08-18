-- HUD Welcome message function
function entity:notify_message(message, color)
    self.huddamage = game:newclienthudelem(self)
    self.huddamage.horzalign = "center"
    self.huddamage.alignx = "center"
    self.huddamage.y = 280
    self.huddamage.font = "bigfixed"
    self.huddamage.fontscale = 1.2
    self.huddamage.hidewhendead = true
    self.huddamage.hidewheninmenu = true
    self.huddamage.glowalpha = 0.3
    self.huddamage.glowcolor = color
    self.huddamage:settext(message)
    self.huddamage:setpulsefx(40, 8000, 600)
end

-- HUD Welcome message function
function entity:welcome_message(message, color)
    self.huddamage = game:newclienthudelem(self)
    self.huddamage.horzalign = "center"
    self.huddamage.alignx = "center"
    self.huddamage.y = 15
    self.huddamage.font = "bigfixed"
    self.huddamage.fontscale = 1.2
    self.huddamage.hidewhendead = true
    self.huddamage.hidewheninmenu = true
    self.huddamage.glowalpha = 0.3
    self.huddamage.glowcolor = color
    self.huddamage:settext(message)
    self.huddamage:setpulsefx(40, 8000, 600)
end