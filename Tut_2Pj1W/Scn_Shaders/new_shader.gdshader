//-Tipo de Shader
shader_type canvas_item;

//- Publica variables 
// para permitir su modificacion fuera
uniform float V_Brillo=0.1;
uniform float V_Contrate=0.1;
uniform float V_Saturacion=0.1;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	//- Obtengo el color de TEXTURE de la cord UV y bias 0.0
	vec3 M_Color=texture(TEXTURE,UV,0.0).rgb;
	//- Obtengo la interpolacion entre negro
	// y COLOR en V_Brillo%
	M_Color.rgb=mix(vec3(0.0),M_Color.rgb,V_Brillo);
	//- Obtengo la interpolacion entre el medio de los colores 
	// y COLOR en V_Contraste%
	M_Color.rgb=mix(vec3(0.5),M_Color.rgb,V_Contrate);
	
	//- Paso mi color a escala de grises
	float M_Gris=((M_Color.r+M_Color.g+M_Color.b)/3.0);
	//- Ahora interpolo entre el color gris y
	// mi color en Saturacion%
	M_Color.rgb=mix(vec3(M_Gris),M_Color.rgb,V_Saturacion);
	
	//-Modifico el color del pixel
	COLOR.rgb=M_Color;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
