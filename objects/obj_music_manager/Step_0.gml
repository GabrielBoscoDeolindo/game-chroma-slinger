if (instance_exists(obj_game_manager)) {
    
    var _target_track = snd_music_1;
    
    if (obj_game_manager.current_wave > 6) {
        _target_track = snd_music_2;
    }
    
    if (current_track != _target_track) {
        audio_stop_sound(current_track);
        current_track = _target_track;
        audio_play_sound(current_track, 100, true);
    }
}