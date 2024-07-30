/// @description Insert description here
// You can write your code in this editor
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);

switch(state){
	case "idle":
		if ( right || left ){
			state = "walk";
		}
	break;
	
	case "walk":
		hspd = (right-left)*spd;
		
		if (!right && !left ){
			state = "idle";	
		}
	break;
}

