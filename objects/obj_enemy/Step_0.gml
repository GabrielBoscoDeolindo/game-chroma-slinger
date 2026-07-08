switch (state) {
    case "entering":
        x = lerp(x, target_x, move_speed);
        y = lerp(y, target_y, move_speed);
        
        if (point_distance(x, y, target_x, target_y) < 1) {
            x = target_x;
            y = target_y;
            state = "shooting";
        }
        break;
        
	case "shooting":
        shoot_timer--;
        if (shoot_timer <= 0) {
            var _bullet = instance_create_layer(x, y - 2, "Instances", obj_enemy_bullet);
            
            _bullet.direction = facing;
            
            if (global.enemy_sounds_this_frame < 2) {
                audio_play_sound(snd_gun2, 10, 0);
                global.enemy_sounds_this_frame++;
            }
            
            state = "leaving";
            
            if (facing == 0) target_x -= 64;       
            if (facing == 180) target_x += 64;     
            if (facing == 270) target_y -= 64;     
            if (facing == 90) target_y += 64;
        }
        break;
        
    case "leaving":
        x = lerp(x, target_x, move_speed);
        y = lerp(y, target_y, move_speed);
        
        if (point_distance(x, y, target_x, target_y) < 1) {
            instance_destroy();
        }
        break;
}