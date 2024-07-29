/// @description Insert description here
// You can write your code in this editor
#region Control

	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	up = keyboard_check(vk_space);
	dash = keyboard_check_pressed(ord("Z"));

	if ( right ){
		facing = 1;
	}else if ( left ){
		facing = -1;	
	}
	
#endregion

#region Switch 

	switch( state ){
		#region Idle
			case "idle":
				
			
				if ( right || left ){
					state = "move";	
				}
			
				if ( up && place_meeting(x,y+1,obj_block)){
					state="jump";	
				}
			
				if ( !place_meeting(x,y+1,obj_block)){
					state="fall";	
				}
				
				if( dash ){
					state="dash";
					dash_timer=dash_duration;
				}
			
			break;
		#endregion
		
		#region Move
		case "move":
		
			hspd = ( right - left ) * spd;
			
			if (!right && ! left ){
				state = "idle";	
				hspd = 0;
			}
			
			if ( up && place_meeting(x,y+1,obj_block)){
				state="jump";	
			}
			
			if ( !place_meeting(x,y+1,obj_block)){
				state="fall";	
			}
			
			if( dash ){
				state="dash";
				dash_timer=dash_duration;
			}
		
		break;
		#endregion
		
		#region Jump
		case "jump":
			
			vspd = -jump_spd;
			state= "fall";
			
		break;
		#endregion
		
		#region Fall
		case "fall":
		
			if (!place_meeting(x,y+1,obj_block)){
				vspd += grv;
				
				if right{
					hspd = spd;
				}else if left{
					hspd = -spd;	
				}else{
					hspd = 0;	
				}
				
			}else{
				vspd = 0;
				hspd = 0;
				state="idle";
			}
			
			if( dash ){
				state="dash";
				dash_timer=dash_duration;
			}
			
		break;
		#endregion
	
		#region Dash
		case "dash":
			
			hspd = facing * dash_spd;
			
			dash_timer--;
			if ( dash_timer <= 0 ){
				hspd = 0;
				state = "fall";
			}
			
		break;
		#endregion
	}

	check_collision()
	
#endregion
