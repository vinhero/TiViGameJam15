shader_type canvas_item;

uniform float value : hint_range(0, 1);
uniform vec4 DEFAULT_COLOR : source_color;
uniform vec4 COLOR1 : source_color;
uniform vec4 COLOR2 : source_color;
uniform sampler2D mix_tecture;

void vertex() {
	//COLOR = vec4(1.0, 1.0, 1.0, 1.0);
}

void fragment() {
	
	vec4 current_pixel = texture(TEXTURE, UV);
	if (current_pixel.a == 1.0)
	{
		vec4 mix_pixel = texture(mix_tecture, UV);
		
		if (mix_pixel.r > value && current_pixel.r > 0.6) {
			//COLOR = vec4(current_pixel.r - 0.0, current_pixel.g - 0.0, current_pixel.b - 1.0, current_pixel.a);
			if (COLOR1 != vec4(0.0, 0.0, 0.0, 1.0)){
				//COLOR = vec4(COLOR1.r, COLOR1.g, COLOR1.b, current_pixel.a);
				COLOR = vec4(
					current_pixel.r - (1.0 - COLOR1.r), 
					current_pixel.g - (1.0 - COLOR1.g), 
					current_pixel.b - (1.0 - COLOR1.b), 
					current_pixel.a);
			}
			else {
				COLOR = vec4(
					current_pixel.r - (1.0 - DEFAULT_COLOR.r), 
					current_pixel.g - (1.0 - DEFAULT_COLOR.g), 
					current_pixel.b - (1.0 - DEFAULT_COLOR.b), 
					current_pixel.a);
			}
		}
		else if (current_pixel.r > 0.6){
			//COLOR = vec4(current_pixel.r - 0.0, current_pixel.g - 0.5, current_pixel.b - 1.0, current_pixel.a);
			if (COLOR2 != vec4(0.0, 0.0, 0.0, 1.0)){
				COLOR = vec4(
					current_pixel.r - (1.0 - COLOR2.r), 
					current_pixel.g - (1.0 - COLOR2.g), 
					current_pixel.b - (1.0 - COLOR2.b), 
					current_pixel.a);
			}
			else {
				COLOR = vec4(
					current_pixel.r - (1.0 - DEFAULT_COLOR.r), 
					current_pixel.g - (1.0 - DEFAULT_COLOR.g), 
					current_pixel.b - (1.0 - DEFAULT_COLOR.b), 
					current_pixel.a);
			}
			
		}
		else {
			COLOR = current_pixel;
		}
	//if (current_pixel.r > 0.6) {
		//COLOR = vec4(current_pixel.r - 0.0, current_pixel.g - 0.0, current_pixel.b - 1.0, current_pixel.a);
	//}
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
