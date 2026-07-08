switch (state) {
    case "SPAWNING":
        
        item_timer--;
        if (item_timer <= 0) {
            item_timer = 720;
            if (random(100) <= 60) {
                if (instance_number(obj_item_place) > 0) {
            
                    var _dest = instance_find(obj_item_place, irandom(instance_number(obj_item_place) - 1));
                    var _item_pool = choose(obj_item_heart, obj_item_shield);
            
                    instance_create_layer(_dest.x, _dest.y, "Instances", _item_pool);
                }
            }
        }

        if (enemies_spawned < enemies_per_wave) {
            spawn_timer--;
            
            if (spawn_timer <= 0) {
                spawn_timer = spawn_timer_max;
                
                enemies_spawned++; 
                
                if (instance_number(obj_enemy_place) > 0) {
                    
                    var _spawners = [];
                    var _priority_spawners = []; 
                    
                    for (var i = 0; i < instance_number(obj_enemy_place); i++) {
                        var _inst = instance_find(obj_enemy_place, i);
                        array_push(_spawners, _inst); 
                        
                        if (instance_exists(obj_player)) {
                            var _is_priority = false;
                            
                            if (_inst.image_angle == 0 || _inst.image_angle == 180) {
                                if (abs(_inst.y - obj_player.y) < 8) _is_priority = true; 
                            } else {
                                if (abs(_inst.x - obj_player.x) < 8) _is_priority = true;
                            }
                            
                            if (_is_priority) {
                                array_push(_priority_spawners, _inst);
                            }
                        }
                    }
                    
                    _spawners = array_shuffle(_spawners);
                    
                    if (array_length(_priority_spawners) > 0 && random(100) <= 65) {
                        _priority_spawners = array_shuffle(_priority_spawners);
                        var _chosen_spawner = _priority_spawners[0];
                        
                        for (var i = 0; i < array_length(_spawners); i++) {
                            if (_spawners[i] == _chosen_spawner) {
                                array_delete(_spawners, i, 1);
                                break;
                            }
                        }
                        
                        array_insert(_spawners, 0, _chosen_spawner);
                    }
                    
                    var _pattern = 0;
                    
                    if (current_wave >= 4 && current_wave <= 6) _pattern = choose(0, 1);
                    else if (current_wave >= 7) _pattern = choose(0, 1, 2);
                    
                    var _targets = [];
                    
                    switch (_pattern) {
                        case 0: // SINGLE
                            array_push(_targets, _spawners[0]);
                            break;
                            
                        case 1: // DOUBLE
                            array_push(_targets, _spawners[0]);
                            if (array_length(_spawners) > 1) array_push(_targets, _spawners[1]);
                            break;
                            
                        case 2: // TRIPLE
                            array_push(_targets, _spawners[0]);
                            if (array_length(_spawners) > 1) array_push(_targets, _spawners[1]);
                            if (array_length(_spawners) > 2) array_push(_targets, _spawners[2]);
                            break;
                    }
                    
                    for (var i = 0; i < array_length(_targets); i++) {
                        var _dest = _targets[i];
                        var _facing = _dest.image_angle;
                        var _spawn_x = _dest.x - lengthdir_x(32, _facing);
                        var _spawn_y = _dest.y - lengthdir_y(32, _facing);
                        
                        var _enemy = instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_enemy);
                        _enemy.target_x = _dest.x;
                        _enemy.target_y = _dest.y;
                        _enemy.facing = _facing;
                        
                        switch (_facing) {
                            case 0:   _enemy.sprite_index = spr_enemy_left;  break;
                            case 90:  _enemy.sprite_index = spr_enemy_down;  break;
                            case 180: _enemy.sprite_index = spr_enemy_right; break;
                            case 270: _enemy.sprite_index = spr_enemy_top;   break;
                        }
                    }
                }
            }
        } 
        else {
            if (instance_number(obj_enemy) == 0) {
                state = "TRANSITION";
                transition_timer = 120;
                
                if (instance_exists(obj_palette_manager)) {
                    with (obj_palette_manager) {
                        current_palette_index++;
                        if (current_palette_index >= array_length(palette_list)) {
                            current_palette_index = 0; 
                        }
                        current_palette = palette_list[current_palette_index];
                        shake_intensity = 6;
                        shake_timer = 20; 
                    }
                }
            }
        }
        break;

    case "TRANSITION":
        transition_timer--;
        
        if (transition_timer <= 0) {
            current_wave++;
            enemies_spawned = 0;
            state = "SPAWNING";
            
            switch (current_wave) {
                case 2:  enemies_per_wave = 8;  spawn_timer_max = 100; break;
                case 3:  enemies_per_wave = 12; spawn_timer_max = 80;  break;
                case 4:  enemies_per_wave = 10; spawn_timer_max = 90;  break; // Começam os Duplos
                case 5:  enemies_per_wave = 15; spawn_timer_max = 70;  break;
                case 6:  enemies_per_wave = 18; spawn_timer_max = 60;  break;
                case 7:  enemies_per_wave = 15; spawn_timer_max = 80;  break; // Começam os Triplos
                case 8:  enemies_per_wave = 20; spawn_timer_max = 55;  break;
                case 9:  enemies_per_wave = 25; spawn_timer_max = 45;  break;
                case 10: enemies_per_wave = 20; spawn_timer_max = 50;  break;
                case 11: enemies_per_wave = 30; spawn_timer_max = 40;  break;
                default: 
                    enemies_per_wave = 999999; 
                    spawn_timer_max = 30; // Tiros incansáveis
                    break;
            }
        }
        break;
}