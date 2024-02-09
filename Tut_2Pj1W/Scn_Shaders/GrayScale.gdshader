//- Le indico que sera un shader para canvas.
shader_type canvas_item;

//- Genero un vector de color negro.
const vec3 V_ColorB=vec3(0.0,0.0,0.0);

// Called for every vertex the material is visible on.
void vertex() {
}
// Called for every pixel the material is visible on.
void fragment() {
	//- Obtengo el color en RGB de la TEXTURA y la posicion UV
	vec3 M_PixRgb=texture(TEXTURE,UV).rgb;
	//- Calculo el promedio del RGB (R+G+B/3)
	float M_Mid=((M_PixRgb.r + M_PixRgb.g + M_PixRgb.b ) / 3.0);
	//- Creo un color en gris.
	vec3 M_Color=vec3(M_Mid);
	//- Aplico el color al pixel
	COLOR=vec4(M_Color,1.0);
}
// Called for every pixel for every light affecting the CanvasItem.
void light() {
}

