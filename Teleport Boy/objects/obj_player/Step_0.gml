/// @description Insert description here
// You can write your code in this editor
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));

hspd = (right - left ) * spd;

x+= hspd;