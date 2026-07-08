if (is_dead) {
    if (image_index >= image_number - 1) {
        image_speed = 0; 
        image_index = image_number - 1; 
    }
    exit;
}

if (hp <= 0) {
    is_dead = true;
    sprite_index = spr_death;
    image_index = 0;
    image_speed = 1;
    
    if (!instance_exists(obj_gameover)) {
        instance_create_layer(0, 0, "Instances", obj_gameover);
    }
    
    exit;
}

if (cooldown_timer > 0) {
    cooldown_timer--;
}

if (invincible_timer > 0) {
    invincible_timer--;
    is_invincible = true;
    
    image_alpha = (invincible_timer % 10 < 5) ? 0 : 1;
} else {
    is_invincible = false;
    image_alpha = 1;
}

var is_moving = (point_distance(x, y, target_x, target_y) > 1);

var aim_angle = point_direction(x, y, mouse_x, mouse_y);


var snapped_angle = round(aim_angle / 90) * 90;
if (snapped_angle == 360) snapped_angle = 0;


switch (snapped_angle) {
    case 0:   facing = "right"; break;
    case 90:  facing = "up";    break;
    case 180: facing = "left";  break;
    case 270: facing = "down";  break;
}


if (!is_moving) {
    x = target_x; 
    y = target_y;

    if (keyboard_check_pressed(vk_space) && cooldown_timer == 0) {
        
        cooldown_timer = shoot_cooldown;

        var knockback_x = 0;
        var knockback_y = 0;

        switch (facing) {
            case "right": knockback_x = -grid_size; break;
            case "left":  knockback_x = grid_size;  break;
            case "up":    knockback_y = grid_size;  break;
            case "down":  knockback_y = -grid_size; break;
        }

        var next_x = target_x + knockback_x;
        var next_y = target_y + knockback_y;

        if (!place_meeting(next_x, next_y, obj_colision)) {
            if (next_x >= bound_left && next_x <= bound_right && 
                next_y >= bound_top && next_y <= bound_bottom) {
                
                target_x = next_x;
                target_y = next_y;
                audio_play_sound(snd_gun, 10, 0);
				obj_player.muzzle_flash_timer = 3;
				
var _shoot_dir = 0;
switch (facing) {
    case "right": _shoot_dir = 0;   break;
    case "up":    _shoot_dir = 90;  break;
    case "left":  _shoot_dir = 180; break;
    case "down":  _shoot_dir = 270; break;
}


for (var i = 0; i < 8; i++) {
    var _part = instance_create_layer(x, y, "Instances", obj_particle);
    _part.direction = _shoot_dir + random_range(-8, 8); 
}
                

                if (instance_exists(obj_palette_manager)) {
                    with (obj_palette_manager) {
                        shake_intensity = 4;
                        shake_timer = 12; 
                    }
                }
            }
        }
    }
}

x = lerp(x, target_x, move_speed);
y = lerp(y, target_y, move_speed);

is_moving = (point_distance(x, y, target_x, target_y) > 1);

switch (facing) {
    case "right": sprite_index = spr_idle_right; break;
    case "left":  sprite_index = spr_idle_left;  break;
    case "up":    sprite_index = spr_idle_top;   break;
    case "down":  sprite_index = spr_idle_down;  break;
}

if (is_moving) {
    image_speed = 0;
    image_index = 0; 
} else {
    image_speed = 1; 
}

if (has_shield) {
    image_blend = c_aqua;
} else {
    image_blend = c_white;
}