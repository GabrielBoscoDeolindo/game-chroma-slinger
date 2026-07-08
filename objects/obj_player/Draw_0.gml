// 1. Desenha o sprite do Cowboy
draw_self();

// 2. Clarão da Shotgun (Muzzle Flash Ajustável)
if (muzzle_flash_timer > 0) {
    muzzle_flash_timer--; 
    
    var _dir = 0;
    var _flash_x = x;
    var _flash_y = y;
    
    // Configuração manual do cano para cada direção
    switch (facing) {
        case "right": 
            _dir = 0;   
            _flash_x += 12; // Distância para a frente
            _flash_y += 2;  // Mude este valor para subir (-) ou descer (+) o clarão
            break;
            
        case "up":    
            _dir = 90;  
            _flash_x += 0;  // Mude para jogar o clarão pra esquerda (-) ou direita (+)
            _flash_y -= 16; // Distância para cima
            break;
            
        case "left":  
            _dir = 180; 
            _flash_x -= 12; // Distância para a frente (negativa pois é esquerda)
            _flash_y += 2;  // Mude este valor para subir (-) ou descer (+)
            break;
            
        case "down":  
            _dir = 270; 
            _flash_x += 0;  // Mude para jogar o clarão pra esquerda (-) ou direita (+)
            _flash_y += 12; // Distância para baixo
            break;
    }
    
    // Desenha o sprite (com o modo de luz ativado para dar aquele brilho extra)
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(spr_flash, 0, _flash_x, _flash_y, 1, 1, _dir, c_white, 1);
    gpu_set_blendmode(bm_normal);
}