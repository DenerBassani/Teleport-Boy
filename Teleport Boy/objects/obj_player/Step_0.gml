/// @description Insert description here
// You can write your code in this editor
#region Control

	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));

#endregion

#region Move Horizontal

	hspd = ( right - left ) * spd;
	
	x+=hspd;

#endregion