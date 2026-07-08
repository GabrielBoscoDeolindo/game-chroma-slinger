// Reduz o tempo de vida
lifetime--;

// Efeito Arcade: Pisca o item quando estiver quase sumindo
if (lifetime < 90) {
    // Faz o alpha oscilar rapidamente entre 0 e 1 baseado no tempo restante
    image_alpha = (lifetime % 10 < 5) ? 0 : 1;
}

// Se o tempo acabar, destrói o item
if (lifetime <= 0) {
    instance_destroy();
}

// Lógica de coleta que você já tinha
if (place_meeting(x, y, obj_player)) {
    obj_player.hp = min(3, obj_player.hp + 1);
    audio_play_sound(snd_heal, 10, false); 
    instance_destroy(); 
}