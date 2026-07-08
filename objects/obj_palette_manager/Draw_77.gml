shader_set(shd_palette);


shader_set_uniform_f_array(u_col1, current_palette[0]);
shader_set_uniform_f_array(u_col2, current_palette[1]);
shader_set_uniform_f_array(u_col3, current_palette[2]);
shader_set_uniform_f_array(u_col4, current_palette[3]);


var _sx = 0;
var _sy = 0;

if (shake_timer > 0) {
    _sx = irandom_range(-shake_intensity, shake_intensity);
    _sy = irandom_range(-shake_intensity, shake_intensity);
}

draw_surface(application_surface, _sx, _sy);

shader_reset();