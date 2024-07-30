shader_type canvas_item;

uniform float red : hint_range(0.0, 1.0);
uniform float green : hint_range(0.0, 1.0);
uniform float blue : hint_range(0.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 current_pixel = texture(TEXTURE, UV);
	if (current_pixel.a == 1.0 && current_pixel.g > 0.9)
	{
		COLOR = vec4(red, green, blue, 1.0);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
