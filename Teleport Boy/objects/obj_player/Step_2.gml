#region Collision Horizontal
    // Colisão horizontal
    if (place_meeting(x + hspd, y, obj_block)) {
        while (!place_meeting(x + sign(hspd), y, obj_block)) {
            x += sign(hspd);
        }
        hspd = 0;
    }

    x += hspd;
	#endregion

	#region Collision Vertical
    // Colisão vertical
    if (place_meeting(x, y + vspd, obj_block)) {
        while (!place_meeting(x, y + sign(vspd), obj_block)) {
            y += sign(vspd);
        }
        vspd = 0;
    }

    y += vspd;
	#endregion
	