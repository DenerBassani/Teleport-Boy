/// @description Insert description here
// You can write your code in this editor
// Aceleração
if (keyboard_check(vk_up)) {
    if (_current_speed < _max_speed) {
        _current_speed += _acceleration;
    }
}

// Desaceleração ou ré
if (keyboard_check(vk_down)) {
    if (_current_speed > -_max_speed) {
        _current_speed -= _acceleration;
    }
}

// Desaceleração gradual (fricção)
if (!keyboard_check(vk_up) && !keyboard_check(vk_down)) {
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

// Rotação ao pressionar A e D
if (keyboard_check(vk_right)) {
    _direction -= _turn_speed; // Faz uma curva para a esquerda
}
if (keyboard_check(vk_left)) {
    _direction += _turn_speed; // Faz uma curva para a direita
}

// Ajusta a direção do sprite para a direção do movimento
if (_current_speed != 0) {
    image_angle = _direction;
}