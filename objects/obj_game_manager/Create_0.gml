state = "SPAWNING";
current_wave = 1;

enemies_per_wave = 5;
enemies_spawned = 0;

spawn_timer_max = 120;
spawn_timer = spawn_timer_max;
transition_timer = 120;

item_timer = 720;


window_set_cursor(cr_none);

global.enemy_sounds_this_frame = 0;