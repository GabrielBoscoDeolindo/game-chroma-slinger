if (instance_exists(obj_btn_start)) {
    obj_btn_start.image_blend = c_white;
}

// 2. Execução da Ação com o Espaço (Inicia o Jogo)
if (keyboard_check_pressed(vk_space)) {
    audio_play_sound(snd_start, 10, false);
    
    if (!instance_exists(obj_transition)) {
        audio_stop_sound(snd_music_1); 
        
        var _tran = instance_create_layer(0, 0, "Instances", obj_transition);
        _tran.target_room = rm_game;
    }
}

// 3. Efeito Chroma (Ciclo de Paletas a cada 75 frames)
palette_timer--;

if (palette_timer <= 0) {
    palette_timer = 75;
    demo_wave++;
    
    if (demo_wave > 12) { 
        demo_wave = 1;
    }
}

// Atualiza o gerenciador de paleta
if (instance_exists(obj_palette_manager)) {
    obj_palette_manager.current_wave = demo_wave; 
}