shader_type canvas_item;
// Creamos la importacion de una imagen y
// la pongo en negro por def
uniform sampler2D V_Image:hint_default_black;

vec4 F_Multiply(vec4 Base,vec4 Blend){
	return Base * Blend;
}

	// Called for every pixel the material is visible on.
void fragment() {
	vec4 M_Clr=texture(TEXTURE,UV);
	vec4 M_Clr1=texture(V_Image,vec2(UV.x,UV.y));
	COLOR=F_Multiply(M_Clr,M_Clr1);
}


