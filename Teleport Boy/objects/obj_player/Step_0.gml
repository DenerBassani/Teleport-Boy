/// @description Insert description here
// You can write your code in this editor
#region Control

	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	up = keyboard_check(vk_space);

#endregion

#region Move Horizontal

	hspd = ( right - left ) * spd;

#endregion

#region Collision Horizontal

	if place_meeting(x+hspd, y, obj_block){
		while !place_meeting( x+sign(hspd), y, obj_block ){
			x+=sign( hspd );	
		}
		hspd = 0;
	}

	x+= hspd;
	
#endregion

#region Collision Vertical

	if place_meeting(x, y+vspd, obj_block){
		while !place_meeting( x, y+sign(vspd), obj_block ){
			y+=sign( vspd );	
		}
		vspd = 0;
	}

	y+= vspd;
	
#endregion

#region Gravity and Jump

	if !place_meeting(x, y+1, obj_block){
		
		vspd += grv;
		
	}else if up {
		
		vspd = -jump_spd;		
	
	}

#endregion