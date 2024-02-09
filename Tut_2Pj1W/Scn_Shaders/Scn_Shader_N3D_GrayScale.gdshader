//- Le indico que sera un shader para canvas.
shader_type canvas_item;

//- Genero un vector de color negro.
const vec3 V_ColorB=vec3(0.0,0.0,0.0);

// Called for every vertex the material is visible on.
void vertex() {
}

// Called for every pixel the material is visible on.
void fragment() {
	// - Obtengo el color de la textura
	vec3 M_ColorA=texture(TEXTURE,UV).rgb;
	// - Creo un color
	vec3 M_Color=vec3(0.0);
	// - obtengo un % (un arco)
	float M_Pc=abs(sin(TIME));
	//- Mezclo el color del pixel objenido con mi color base.
	M_Color=mix(M_ColorA,V_ColorB,M_Pc);
	//-modifico el color del pixel analizado.
	COLOR=vec4(M_Color,1.0);
}

// Called for every pixel for every light affecting the CanvasItem.
void light() {
}

