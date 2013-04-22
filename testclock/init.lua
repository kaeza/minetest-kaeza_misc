
local player_hud = { };

local timer = 0;

local function floormod ( x, y )
    return (math.floor(x) % y);
end

local function get_time ( )
    local secs = (60*60*24*minetest.env:get_timeofday());
    local s = floormod(secs, 60);
    local m = floormod(secs/60, 60);
    local h = floormod(secs/3600, 60);
    return ("%02d:%02d:%02d"):format(h, m, s);
end

minetest.register_globalstep(function ( dtime )
    timer = timer + dtime;
    if (timer >= 1.0) then
        timer = 0;
        for _,p in ipairs(minetest.get_connected_players()) do
            local name = p:get_player_name();
            local h = p:hud_add({
                hud_elem_type = "text";
                position = {x=0.35, y=0.900};
                text = get_time();
                number = 0xFFFF00;
            });
            if (player_hud[name]) then
                p:hud_remove(player_hud[name]);
            end
            player_hud[name] = h;
        end
    end
end);
