/// @description Insert description here
// You can write your code in this editor
#region Control

	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	up = keyboard_check(ord("W"));

	hspd = (right - left ) * spd;

#endregion

#region Gravity and Jump
	
	if !place_meeting(x,y+1,obj_wall){
		vspd += grv;	
	}
	else{
		if up {
			vspd = -jump_spd;	
		}
	}
	
#endregion

#region Collision Horizontal

	if place_meeting(x+hspd,y,obj_wall){
		while !place_meeting(x+sign(hspd),y,obj_wall){
			x+=sign(hspd);	
		}
		hspd = 0;
	}

#endregion

#region Collision Vertical

	if place_meeting(x,y+vspd,obj_wall){
		while !place_meeting(x,y+sign(vspd),obj_wall){
			y+=sign(vspd);	
		}
		vspd = 0;
	}

#endregion

x+= hspd;
y+= vspd;