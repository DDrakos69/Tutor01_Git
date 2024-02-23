shader_type canvas_item;
// Called for every pixel the material is visible on.
void fragment() {
	// Obtengo el color del pixel
	vec3 M_Clr=texture(TEXTURE,UV).rgb;
	//el color esta entre 0.0 Negro y 1.0 Blanco al restar 
	//a mi color el blanco Obtengo la inversion de la gama.
	M_Clr=vec3(1.0)-M_Clr.rgb;
	//Modifico el color de salida.
	COLOR.rgb=M_Clr;
}
// Called for every vertex the material is visible on.
void vertex() {
	
}
// Called for every pixel for every light affecting the CanvasItem.
void light() {
	
}
