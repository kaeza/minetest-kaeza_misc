
local hud_abbrevs = {
    o = "hotbar";
    h = "healthbar";
    c = "crosshair";
    w = "wielditem";
};

local function hud_set ( name, params, flag )

    local p = minetest.env:get_player_by_name(name);
    if (not p) then
        print("hud_set: wut");
        return;
    end

    for i = 1, params:len() do
        local elem = hud_abbrevs[params:sub(i, i)];
        if (elem) then
            p:hud_builtin_enable(elem, flag);
        end
    end

end

minetest.register_chatcommand("hudset", {
    params = "<hudstring>";
    description = "h'o'tbar,'h'ealthbar,'c'rosshair,'w'ielditem";
    func = function ( name, params )
        hud_set(name, params, true);
    end;
});

minetest.register_chatcommand("hudunset", {
    params = "<hudstring>";
    description = "h'o'tbar,'h'ealthbar,'c'rosshair,'w'ielditem";
    func = function ( name, params )
        hud_set(name, params, false);
    end;
});
