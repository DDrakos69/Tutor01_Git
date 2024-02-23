shader_type canvas_item;

// Called for every pixel the material is visible on.
void fragment() {
	//Obtenemos el color del pixel.
	vec3 M_Clr=texture(TEXTURE,UV).rgb;
	// Pasamos el color a tonos de grises.
	float M_BW=((M_Clr.r + M_Clr.g +M_Clr.b)/3.0);
	// Pasamos el gris a 0 o a 1 si esta por encima o debajo de 0.4
	M_BW=step(0.4,M_BW);
	// Modificamos el color de salida del pixel
	COLOR.rgb=vec3(M_BW);
}


// Called for every vertex the material is visible on.
void vertex() {
}



// Called for every pixel for every light affecting the CanvasItem.
void light() {
}
