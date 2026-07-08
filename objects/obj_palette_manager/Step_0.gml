if (shake_timer > 0) {
    shake_timer--;
} else {
    shake_intensity = 0; 
}

if (instance_exists(obj_game_manager)) {
    current_wave = obj_game_manager.current_wave;
}

current_palette_index = current_wave - 1;
current_palette_index = clamp(current_palette_index, 0, 11);
current_palette = palette_list[current_palette_index];