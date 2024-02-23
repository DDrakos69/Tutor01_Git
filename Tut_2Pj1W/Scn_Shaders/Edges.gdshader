// Shader tipo Canvas
shader_type canvas_item;
// Distancia de busqueda de pixels.
uniform float V_Distancia=0.7;
// Called for every pixel the material is visible on.
void fragment() {
	//Obtengo el color del pixel
	vec3 M_Clr = texture(TEXTURE,UV).rgb;
	//Obtengo el color del pixel X+1
	vec3 M_ClrR = texture(TEXTURE,UV+vec2(SCREEN_PIXEL_SIZE.x,0)).rgb;
	//Obtengo el color del pixel Y-1 (Abajo)
	vec3 M_ClrD = texture(TEXTURE,UV-vec2(0,SCREEN_PIXEL_SIZE.y)).rgb;
	// Obtengo la hipotenusa en 3D desde 0,0,0 hasta Color Right.
	float M_DistR=length(M_ClrR-M_Clr);
	// Obtengo la hipotenusa en 3D desde 0,0,0 hasta Color Down.
	float M_DistD=length(M_ClrD-M_Clr);
	//Si la hipotenusa3D es mayor de VDistancia pongo blanco
	// Si no pongo negro.
	if(M_DistD >V_Distancia || M_DistR>V_Distancia){
		COLOR.rgb=M_Clr+vec3(1,1,1);
	}else{
		COLOR.rgb=M_Clr-vec3(0,0,0);
	}
	
}
// Called for every vertex the material is visible on.
void vertex() {}
// Called for every pixel for every light affecting the CanvasItem.
void light() {}
