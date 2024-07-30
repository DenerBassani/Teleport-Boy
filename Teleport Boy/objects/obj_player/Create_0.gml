// Control Variables
right = 0;
left = 0;
up = 0;
dash = 0;
facing = 1; // 1 = Right, -1 = Left

// Movement Variables
grv = 0.5; // Gravidade
hspd = 0; // Velocidade horizontal
vspd = 0; // Velocidade vertical
jump_spd = 15; // Velocidade de pulo
spd = 5; // Velocidade de movimento

dash_spd = 15; // Velocidade do dash
dash_duration = 15; // Duração do dash
dash_timer = 0; // Temporizador do dash

slide_spd = 2; // Velocidade de deslizar
can_wall_jump = false; // Se é possível pular da parede

// Estado do jogo
state = "idle"; // Estado inicial
