// Reduz o tempo de vida
lifetime--;

// Efeito Arcade: Pisca o item quando estiver quase sumindo
if (lifetime < 90) {
    image_alpha = (lifetime % 10 < 5) ? 0 : 1;
}

// Se o tempo acabar, destrói o item
if (lifetime <= 0) {
    instance_destroy();
}

// Lógica de coleta que você já tinha
if (place_meeting(x, y, obj_player)) {
    obj_player.has_shield = true;
    audio_play_sound(snd_heal, 10, false); 
    instance_destroy(); 
}