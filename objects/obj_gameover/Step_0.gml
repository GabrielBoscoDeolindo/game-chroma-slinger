if (can_restart) {
    alpha_text = min(alpha_text + 0.05, 1);
    
    if (keyboard_check_pressed(vk_space)) {
        if (!instance_exists(obj_transition)) {
            var _tran = instance_create_layer(0, 0, "Instances", obj_transition);
            _tran.target_room = rm_game;
        }
    }
    
    if (keyboard_check_pressed(vk_escape)) {
        if (!instance_exists(obj_transition)) {
            var _tran = instance_create_layer(0, 0, "Instances", obj_transition);
            _tran.target_room = rm_start;
        }
    }
}