shader_type canvas_item;

uniform bool shader_enabled = true;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec4 darkest : source_color;
uniform vec4 dark : source_color;
uniform vec4 light : source_color;
uniform vec4 lightest : source_color;

void fragment() {
	if (shader_enabled) {
		COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
		float rgb_average = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
		if (rgb_average < 0.25) {
			COLOR = darkest;
		} else if (rgb_average < 0.5) {
			COLOR = dark;
		} else if (rgb_average < 0.75) {
			COLOR = light;
		} else {
			COLOR = lightest;
		}
	} else {
		COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
	}
}
