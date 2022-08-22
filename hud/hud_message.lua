-- HUD Welcome message function
function entity:notify_message(message, color)
    if self.notify_message_hud ~= nil then
        self.notify_message_hud:destroy()
    end

    self.notify_message_hud = game:newclienthudelem(self)
    self.notify_message_hud.horzalign = "center"
    self.notify_message_hud.alignx = "center"
    self.notify_message_hud.y = 280
    self.notify_message_hud.font = "bigfixed"
    self.notify_message_hud.fontscale = 1.2
    self.notify_message_hud.hidewhendead = true
    self.notify_message_hud.hidewheninmenu = true
    self.notify_message_hud.glowalpha = 0.3
    self.notify_message_hud.glowcolor = color
    self.notify_message_hud:settext(message)
    self.notify_message_hud:setpulsefx(40, 8000, 600)
end

function entity:notify_message_fast(message, color)
    if self.notify_message_fast_hud ~= nil then
        self.notify_message_fast_hud:destroy()
    end

    self.notify_message_fast_hud = game:newclienthudelem(self)
    self.notify_message_fast_hud.horzalign = "center"
    self.notify_message_fast_hud.alignx = "center"
    self.notify_message_fast_hud.y = 280
    self.notify_message_fast_hud.font = "bigfixed"
    self.notify_message_fast_hud.fontscale = 1.2
    self.notify_message_fast_hud.hidewhendead = true
    self.notify_message_fast_hud.hidewheninmenu = true
    self.notify_message_fast_hud.glowalpha = 0.3
    self.notify_message_fast_hud.glowcolor = color
    self.notify_message_fast_hud:settext(message)
    self.notify_message_fast_hud:setpulsefx(40, 1000, 600)
end

-- HUD Welcome message function
function entity:welcome_message(message, color)
    if self.welcome_message_hud ~= nil then
        self.welcome_message_hud:destroy()
    end

    self.welcome_message_hud = game:newclienthudelem(self)
    self.welcome_message_hud.horzalign = "center"
    self.welcome_message_hud.alignx = "center"
    self.welcome_message_hud.y = 15
    self.welcome_message_hud.font = "bigfixed"
    self.welcome_message_hud.fontscale = 1.2
    self.welcome_message_hud.hidewhendead = true
    self.welcome_message_hud.hidewheninmenu = true
    self.welcome_message_hud.glowalpha = 0.3
    self.welcome_message_hud.glowcolor = color
    self.welcome_message_hud:settext(message)
    self.welcome_message_hud:setpulsefx(40, 8000, 600)
end