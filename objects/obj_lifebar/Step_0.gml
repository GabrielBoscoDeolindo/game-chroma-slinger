if (instance_exists(obj_player)) {
    
    switch (obj_player.hp) {
        case 3: 
            sprite_index = spr_lifebar_3; 
            break;
            
        case 2: 
            sprite_index = spr_lifebar_2; 
            break;
            
        case 1: 
            sprite_index = spr_lifebar_1; 
            break;
            
        case 0: 
        default:
            sprite_index = spr_lifebar_0; 
            break;
    }
}