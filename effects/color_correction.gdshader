shader_type canvas_item;

uniform sampler2D palette: hint_albedo;

void fragment() {
	vec4 screen_color = texture(TEXTURE, UV);
	vec4 palette_color = texture(palette, vec2(screen_color.r, 0.5));
	COLOR = palette_color;
//	COLOR = screen_color;
}