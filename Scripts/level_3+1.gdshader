shader_type canvas_item;

uniform vec2 light_position;
uniform float light_radius = 100.0;
uniform vec4 light_color = vec4(1.0, 1.0, 1.0, 1.0);

void fragment() {
    vec2 uv = FRAGCOORD.xy;
    float dist = distance(uv, light_position);
    
    float visibility = 1.0 - smoothstep(0.0, light_radius, dist);
    
    vec4 tex_color = texture(TEXTURE, UV);
    
    COLOR = tex_color * vec4(light_color.rgb, light_color.a * visibility);
}
