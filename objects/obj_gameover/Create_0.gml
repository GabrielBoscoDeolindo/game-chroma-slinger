alpha_text = 0;      
can_restart = false; 
alarm[0] = 60;
final_wave = 1;
audio_stop_all();

if (instance_exists(obj_game_manager)) {
    final_wave = obj_game_manager.current_wave;
    instance_destroy(obj_game_manager); 
}

