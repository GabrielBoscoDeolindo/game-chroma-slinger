// Escolhe um tamanho aleatório para dar variação
image_xscale = random_range(0.5, 1.5);
image_yscale = image_xscale;

// Velocidade e atrito (friction faz ela frear sozinha, estilo fumaça)
speed = random_range(3, 6);
friction = 0.3; 

// Velocidade com que ela desaparece
fade_speed = random_range(0.05, 0.1);

// Cores do clarão da shotgun
image_blend = choose(c_yellow, c_white, c_orange);