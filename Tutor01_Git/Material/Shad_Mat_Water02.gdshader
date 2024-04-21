shader_type spatial;


//shader_type canvas_item;

uniform float time_scale : hint_range(0.1, 5.0) = 1.0;
uniform float distortion_amount : hint_range(0.0, 1.0) = 0.5;


void vertex() {
	// Called for every vertex the material is visible on.
}



void fragment() {
    // Obtener las coordenadas de textura
    vec3 M_uv = FRAGCOORD.xyz / SCREEN_UV
	 //FRAGCOORD.xy / SCREEN_PIXEL_SIZE.xy;

    // Calcula la distorsión animada usando funciones sinusoidales
    vec2 distortion = vec2(
        sin(uv.y * 10.0 + TIME * time_scale),
        cos(uv.x * 10.0 + TIME * time_scale)
    ) * distortion_amount;

    // Aplica la distorsión a las coordenadas de textura
    uv += distortion;

    // Obtén el color final de la textura de agua
    vec4 water_color = texture(TEXTURE, uv);

    // Mezcla con blanco para simular espuma en las olas
    water_color.rgb += vec3(0.5) * smoothstep(0.4, 0.6, distortion_amount);

    // Envía el color final al renderizador
    COLOR = water_color;
}





void light() {
	// Called for every pixel for every light affecting the material.
}
