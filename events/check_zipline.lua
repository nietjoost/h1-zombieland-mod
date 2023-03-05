-- [[ Link a player to a ZipLine ]] --
function entity:StartZipLine(startPos, endPos)
    -- Prepare player for the zipline
    self:disableweapons()
    self:disableoffhandweapons()
    self:freezecontrols(true)

    local delay = 1.75
    local zoomheight = 3500
    local origin = startPos
    local ent = game:spawn("script_model", vector:new(69, 69, 69))
    ent:setmodel("tag_origin")
    ent.origin = self.origin
    self:playerlinkto(ent, nil, 1, 0, 0, 0, 0)
    ent:moveto(endPos, delay, 0, delay)

    -- Reset player after finish zipline
    game:ontimeout(function()
        self:unlink()
        self:enableweapons()
        self:enableoffhandweapons()
        self:freezecontrols(false)
    end, ms(delay))
end