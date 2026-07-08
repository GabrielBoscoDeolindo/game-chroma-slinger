menu_index = 0;
max_options = 2;

palette_timer = 120;
demo_wave = 1;

if (!audio_is_playing(snd_music_1)) {
    audio_play_sound(snd_music_1, 5, true);
}


window_set_cursor(cr_none);