/// @description Insert description here
// You can write your code in this editor
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

jump = keyboard_check(vk_space);
ground = place_meeting(x,y+1,obj_block);
on_ladder = place_meeting(x,y,obj_ladder);

hspd = (right-left)*spd;

switch(state){
	case "idle":
		if ( right || left ){
			state = "walk";
		}else if ( !ground ){
			state = "fall";
		}else if ( jump && ground ){
			state = "jump";	
		}else if (on_ladder && up) {
            state = "climb";
			// Alinhar o personagem com a escada
            var _ladder_instance = instance_place(x, y, obj_ladder);
            if (_ladder_instance != noone) {
                x = _ladder_instance.x+sprite_width/2;
            }
        }
	break;
	
	case "walk":
		
		if (!right && !left ){
			state = "idle";	
		}else if ( !ground ){
			state = "fall";
		}else if ( jump && ground ){
			state = "jump";	
		}else if (on_ladder && up) {
            state = "climb";
			// Alinhar o personagem com a escada
            var _ladder_instance = instance_place(x, y, obj_ladder);
            if (_ladder_instance != noone) {
                x = _ladder_instance.x+sprite_width/2;
            }
        }
	break;
	
	case "fall":
		vspd += grv;
		if( ground ){
			state="idle";	
		}else if (on_ladder && up) {
            state = "climb";
			// Alinhar o personagem com a escada
            var _ladder_instance = instance_place(x, y, obj_ladder);
            if (_ladder_instance != noone) {
                x = _ladder_instance.x+sprite_width/2;
            }
        }
	break;
	
	case "jump":
		vspd = -jump_spd;
		if( ground ){
			state="idle";	
		}else if ( !ground ){
			state = "fall";	
		}else if (on_ladder && up) {
            state = "climb";
			// Alinhar o personagem com a escada
            var _ladder_instance = instance_place(x, y, obj_ladder);
            if (_ladder_instance != noone) {
                x = _ladder_instance.x+sprite_width/2;
            }
        }
	break;
	
	case "climb":
		vspd = 0; // Desativar a gravidade enquanto estiver na escada
        hspd = 0; // Desativar a velocidade horizontal enquanto estiver na escada
        
		if (up) {
            vspd = -spd; // Subir a escada
        } else if (down) {
            vspd = spd; // Descer a escada
        }
        
		if(ground && !up && !down){
			state = "idle";
		}else if (!on_ladder) {
            state = "idle";
        } else if (jump) {
            state = "jump";
        }
	break;
}

