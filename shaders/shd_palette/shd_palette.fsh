varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_color1; 
uniform vec3 u_color2;
uniform vec3 u_color3;
uniform vec3 u_color4; 

void main() {
    vec4 base_col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);

    if (base_col.a == 0.0) {
        gl_FragColor = base_col;
        return;
    }

    vec3 final_color;
    float r = base_col.r;

    if (r < 0.15) {
        final_color = u_color1; 
    } else if (r < 0.40) {
        final_color = u_color2; 
    } else if (r < 0.65) {
        final_color = u_color3; 
    } else {
        final_color = u_color4; 
    }

    gl_FragColor = vec4(final_color, base_col.a);
}