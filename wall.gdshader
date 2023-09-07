shader_type canvas_item;

uniform sampler2D player_viewport;
uniform vec4 tint : source_color;

void fragment() {
	vec4 player = texture(player_viewport, SCREEN_UV);
	vec4 self_color = texture(TEXTURE, UV);
	
	// If the viewport sprite isn't transparent (make sure the viewport is set to transparent bg and has the same size as the normal viewport)
	if (player.a != 0.0) {
		// This is just to make sure the player doesn't render on transparent parts of the wall
		player.a = self_color.a;
		
//		COLOR = player * tint; If you want to tint the sprite on xray
		COLOR = tint;
	} else {
		COLOR = self_color;
	}
}
