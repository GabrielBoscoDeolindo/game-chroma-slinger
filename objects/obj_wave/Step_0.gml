if (instance_exists(obj_game_manager)) {
    
    switch (obj_game_manager.current_wave) {
        case 1:
            sprite_index = spr_wave_1;
            break;

        case 2:
            sprite_index = spr_wave_2;
            break;

        case 3:
            sprite_index = spr_wave_3;
            break;

        case 4:
            sprite_index = spr_wave_4;
            break;

        case 5:
            sprite_index = spr_wave_5;
            break;

        case 6:
            sprite_index = spr_wave_6;
            break;

        case 7:
            sprite_index = spr_wave_7;
            break;

        case 8:
            sprite_index = spr_wave_8;
            break;

        case 9:
            sprite_index = spr_wave_9;
            break;

        case 10:
            sprite_index = spr_wave_10;
            break;

        case 11:
            sprite_index = spr_wave_11;
            break;

        case 12:
        default:
            sprite_index = spr_wave_12;
            break;
    }
}