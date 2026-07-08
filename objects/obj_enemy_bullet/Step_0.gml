if (x < 0 || x > 160 || y < 0 || y > 160) {
    instance_destroy();
}

if (place_meeting(x, y, obj_player)) {
    if (!obj_player.is_dead) {
        
        if (!obj_player.is_invincible) {
            
            if (obj_player.has_shield) {
                obj_player.has_shield = false;
                
                obj_player.invincible_timer = obj_player.invincible_duration;
                
                if (instance_exists(obj_palette_manager)) {
                    obj_palette_manager.shake_intensity = 2;
                    obj_palette_manager.shake_timer = 8;
                }
            } 
            else {
                obj_player.hp -= 1;
				audio_play_sound(snd_damage, 10, 0);
                
                obj_player.invincible_timer = obj_player.invincible_duration;
                
                if (instance_exists(obj_palette_manager)) {
                    obj_palette_manager.shake_intensity = 4;
                    obj_palette_manager.shake_timer = 15;
                }
            }
            
            instance_destroy();
        }
    }
}