/// @description Insert description here
// You can write your code in this editor
//Variáveis de controle
up = 0;
down = 0;
right = 0;
left = 0;
nitro = 0;


// Variáveis de movimento
_max_speed = 10; // Velocidade máxima
_acceleration = 0.2; // Taxa de aceleração

_friction = 0.1; // Taxa de desaceleração
_turn_speed = 3; // Velocidade de rotação
_current_speed = 0; // Velocidade atual
_direction = 0; // Direção inicial

_original_max_speed = _max_speed;
_original_acceleration = _acceleration;

_nitro_active = false;
_nitro_speed_bonus = 6;
_nitro_acceleration_bonus = 0.5;