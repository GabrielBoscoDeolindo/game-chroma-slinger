if (can_restart) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    draw_set_alpha(alpha_text * 0.75); 
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    
    draw_set_alpha(alpha_text);
    draw_set_color(c_white);
    draw_set_font(fnt_gui); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _center_x = _gui_w / 2;
    var _center_y = _gui_h / 2;
    var _line_sep = 180; 
    draw_text(_center_x, _center_y - _line_sep, "GAME OVER");
    draw_text(_center_x, _center_y, "WAVES: " + string(final_wave));
    draw_text(_center_x, _center_y + _line_sep, "press spacebar to restart");
	
    draw_set_alpha(alpha_text * 0.7); 
    draw_text(_center_x, _center_y + (_line_sep * 1.8), "press ESC for menu");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    
}