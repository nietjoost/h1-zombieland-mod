-- [[ TOP UI message ]] --
function entity:CreateTopMessage(msg, color)
    if self.top_message ~= nil then
        self.top_message:destroy()
    end

    self.top_message = game:newclienthudelem(self)
    self.top_message.horzalign = "center"
    self.top_message.alignx = "center"
    self.top_message.y = 15
    self.top_message.font = "bigfixed"
    self.top_message.fontscale = 1.2
    self.top_message.hidewhendead = true
    self.top_message.hidewheninmenu = true
    self.top_message.glowalpha = 0.3
    self.top_message.glowcolor = color
    self.top_message:settext(msg)
    self.top_message:setpulsefx(40, 8000, 600)
end


-- [[ TOP UI message fast ]] --
function entity:CreateTopMessageFast(msg, color)
    if self.top_message_fast ~= nil then
        self.top_message_fast:destroy()
    end

    self.top_message_fast = game:newclienthudelem(self)
    self.top_message_fast.horzalign = "center"
    self.top_message_fast.alignx = "center"
    self.top_message_fast.y = 15
    self.top_message_fast.font = "bigfixed"
    self.top_message_fast.fontscale = 1.2
    self.top_message_fast.hidewhendead = true
    self.top_message_fast.hidewheninmenu = true
    self.top_message_fast.glowalpha = 0.3
    self.top_message_fast.glowcolor = color
    self.top_message_fast:settext(msg)
    self.bottom_message_fast:setpulsefx(40, 4000, 300)
end


-- [[ BOTTOM UI message ]] --
function entity:CreateBottomMessage(msg, color)
    if self.bottom_message ~= nil then
        self.bottom_message:destroy()
    end

    self.bottom_message = game:newclienthudelem(self)
    self.bottom_message.horzalign = "center"
    self.bottom_message.alignx = "center"
    self.bottom_message.y = 280
    self.bottom_message.font = "bigfixed"
    self.bottom_message.fontscale = 1.2
    self.bottom_message.hidewhendead = true
    self.bottom_message.hidewheninmenu = true
    self.bottom_message.glowalpha = 0.3
    self.bottom_message.glowcolor = color
    self.bottom_message:settext(msg)
    self.bottom_message:setpulsefx(40, 8000, 600)
end


-- [[ BOTTOM UI message fast ]] --
function entity:CreateBottomMessageFast(msg, color)
    if self.bottom_message_fast ~= nil then
        self.bottom_message_fast:destroy()
    end

    self.bottom_message_fast = game:newclienthudelem(self)
    self.bottom_message_fast.horzalign = "center"
    self.bottom_message_fast.alignx = "center"
    self.bottom_message_fast.y = 280
    self.bottom_message_fast.font = "bigfixed"
    self.bottom_message_fast.fontscale = 1.2
    self.bottom_message_fast.hidewhendead = true
    self.bottom_message_fast.hidewheninmenu = true
    self.bottom_message_fast.glowalpha = 0.3
    self.bottom_message_fast.glowcolor = color
    self.bottom_message_fast:settext(msg)
    self.bottom_message_fast:setpulsefx(40, 1000, 600)
end