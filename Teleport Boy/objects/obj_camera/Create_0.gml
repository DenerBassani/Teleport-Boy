/// @description Insert description here
// You can write your code in this editor
//Config Buffer Render
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);

var _x1 = 400;
var _y1 = 400;
var _x2 = 600;
var _y2 = 600;

vertex_add_point(vbuffer,_x1,_y1,100,0,0,1,0,0,c_white,1);
vertex_add_point(vbuffer,_x2,_y1,100,0,0,1,0,0,c_white,1);
vertex_add_point(vbuffer,_x2,_y2,100,0,0,1,0,0,c_white,1);

vertex_add_point(vbuffer,_x2,_y2,100,0,0,1,0,0,c_blue,1);
vertex_add_point(vbuffer,_x1,_y2,100,0,0,1,0,0,c_blue,1);
vertex_add_point(vbuffer,_x1,_y1,100,0,0,1,0,0,c_blue,1);

vertex_end(vbuffer)