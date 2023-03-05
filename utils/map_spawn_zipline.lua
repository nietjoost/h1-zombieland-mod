-- Set shop location
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