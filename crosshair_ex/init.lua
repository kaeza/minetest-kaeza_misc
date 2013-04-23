
minetest.register_on_joinplayer(function ( player )

    minetest.after(0.5, function ( )
        player:hud_add({
            hud_elem_type = "image";
            text = "crosshair_ex_ch.png";
            position = {x=0.5, y=0.5};
            scale = {x=1, y=1};
        });
    end);

end);
