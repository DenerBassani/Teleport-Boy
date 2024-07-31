/// @description Insert description here
// You can write your code in this editor
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
nitro = keyboard_check(vk_space);

// Ativa ou desativa o nitro
if (nitro) {
    if (!_nitro_active) {
        _max_speed += _nitro_speed_bonus;
        _acceleration += _nitro_acceleration_bonus;
        _nitro_active = true;
    }
} else {
    if (_nitro_active) {
        _max_speed = _original_max_speed;
        _acceleration = _original_acceleration;
        _nitro_active = false;
    }
}

// Aceleração
if (up) {
    if (_current_speed < _max_speed) {
        _current_speed += _acceleration;
    }
}

// Desaceleração ou ré
if (down) {
    if (_current_speed > -_max_speed) {
        _current_speed -= _acceleration;
    }
}

// Desaceleração gradual (fricção)
if (!up && !down) {
    if (_current_speed > 0) {
        _current_speed -= _friction;
    } else if (_current_speed < 0) {
        _current_speed += _friction;
    }
}

// Limita a velocidade para não passar dos limites
if (_current_speed > _max_speed) {
    _current_speed = _max_speed;
}
if (_current_speed < -_max_speed) {
    _current_speed = -_max_speed;
}

// Movimentação do carro
x += lengthdir_x(_current_speed, _direction);
y += lengthdir_y(_current_speed, _direction);

// Rotação ao pressionar as setas direita e esquerda
if (right) {
    _direction -= _turn_speed; // Faz uma curva para a esquerda
}
if (left) {
    _direction += _turn_speed; // Faz uma curva para a direita
}

// Ajusta a direção do sprite para a direção do movimento
if (_current_speed != 0) {
    image_angle = _direction;
}