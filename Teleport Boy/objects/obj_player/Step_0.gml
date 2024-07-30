#region Control

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_space);
dash = keyboard_check_pressed(ord("Z"));

if (right) {
    facing = 1;
} else if (left) {
    facing = -1;
}

#endregion

#region Switch

switch (state) {

    #region Idle
    case "idle":
        if (right || left) {
            state = "move";
        } else if (up && place_meeting(x, y + 1, obj_block)) {
            state = "jump";
        } else if (!place_meeting(x, y + 1, obj_block)) {
            state = "fall";
        } else if (dash) {
            state = "dash";
            dash_timer = dash_duration;
        }
        break;
    #endregion

    #region Move
    case "move":
        hspd = (right - left) * spd;
        if (!right && !left) {
            state = "idle";
            hspd = 0;
        } else if (up && place_meeting(x, y + 1, obj_block)) {
            state = "jump";
        } else if (!place_meeting(x, y + 1, obj_block)) {
            state = "fall";
        } else if (dash) {
            state = "dash";
            dash_timer = dash_duration;
        }
        break;
    #endregion

    #region Jump
    case "jump":
        vspd = -jump_spd;
        state = "fall";
        break;
    #endregion

    #region Fall
    case "fall":
	
        if (!place_meeting(x, y + 1, obj_block)) {
            vspd += grv;
        } else {
            vspd = 0;
            hspd = 0;
            state = "idle";
        }

        if (dash) {
            state = "dash";
            dash_timer = dash_duration;
        }
        break;
    #endregion

    #region Dash
    case "dash":
        hspd = facing * dash_spd;
        dash_timer--;
        if (dash_timer <= 0) {
            hspd = 0;
            state = "fall";
        }
        break;
    #endregion

    #region Wall Slide
    case "wall_slide":
        vspd = slide_spd; // Define a velocidade de deslizar

        // Permitir movimento horizontal enquanto desliza na parede
        if (right || left) {
            state = "move"
        } else {
            hspd = 0; // Parar movimento horizontal se não estiver pressionando as teclas
        }

        if (up && can_wall_jump) {
            vspd = -jump_spd * 0.5; // Pulo mais sutil
            hspd = -facing * jump_spd * 0.5; // Pulo mais sutil na direção oposta
            can_wall_jump = false; // Impede múltiplos pulos na mesma parede
            state = "fall";
        }
        break;
    #endregion

}

check_collision();

#endregion
