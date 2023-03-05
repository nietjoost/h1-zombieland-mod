-- Set shop location
function SpawnZipLine()
    local zipline = game:spawn("script_model", vector:new(-507.05511474609, 551.47717285156, 192.71659851074))
    zipline:setmodel("h1_flag_mp_domination_spetsnaz_blue")
    zipline:show()
    zipline:makeusable()
    zipline:sethintstring("Press ^3[{+activate}]^7 to use the zipline")

    local zipLineEffect = game:loadfx("vfx/unique/vfx_marker_ctf")
    game:playfx(zipLineEffect, zipline.origin) 

    -- Wait for players trigger
    zipline:onnotify("trigger", function(player)
        player:StartZipLine(zipline.origin, vector:new(172, 220, 408))
    end)
end

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