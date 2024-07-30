/// @description Insert description here
// You can write your code in this editor
if ( !surface_exists(surf)){
	
	surf = surface_create(room_width,room_height);
	
}else{
	
	surface_set_target(surf);
	draw_clear_alpha(c_black,0.8);
	
	gpu_set_blendmode(bm_subtract);
	
	with(obj_light)
	{
		
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);
		
	}
	
	with(obj_player){
		
		var _valor = random_range(-.2,.2);
		draw_sprite_ext(spr_light_player,0,x,y-sprite_height/2,2.5+_valor,2.5+_valor,0,c_white,.5);
		
	}
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target()
	
	draw_surface(surf,0,0);
}