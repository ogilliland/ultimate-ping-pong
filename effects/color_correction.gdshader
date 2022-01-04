shader_type canvas_item;

uniform sampler2D palette: hint_albedo;

void fragment() {
	vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 palette_color = texture(palette, vec2(screen_color.r, 0.5));
	COLOR = palette_color;
}