// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vertex_add_point(){
	var _vbuffer = argument0;
	var _xx = argument1;
	var _yy = argument2;
	var _zz = argument3;
	var _nx = argument4;
	var _ny = argument5;
	var _nz = argument6;
	var _utex = argument7;
	var _vtex = argument8;
	var _color = argument9;
	var _alpha = argument10;
	
	vertex_position_3d(_vbuffer,_xx,_yy,_zz);
	vertex_normal(_vbuffer,_nx,_ny,_nz);
	vertex_texcoord(_vbuffer,_utex,_vtex);
	vertex_color(_vbuffer,_color,_alpha);
}