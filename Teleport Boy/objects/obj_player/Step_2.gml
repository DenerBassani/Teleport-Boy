/// @description Insert description here
// You can write your code in this editor
//Collision Horizontal
repeat ( abs (hspd) )
{
	if (place_meeting(x+hspd,y,obj_block))
	{
		hspd = 0;
		break;
	}
	x+=hspd;
}

//Collision Vertical
repeat ( abs (vspd) )
{
	if (place_meeting(x,y+vspd,obj_block))
	{
		vspd = 0;
		break;
	}
	y+=vspd;
}