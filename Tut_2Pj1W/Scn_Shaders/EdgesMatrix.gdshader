shader_type canvas_item;

// Called for every pixel the material is visible on.
void fragment() {
	float M_x=SCREEN_PIXEL_SIZE.x;
	float M_y=SCREEN_PIXEL_SIZE.y;
	
	vec3 M_Crl1 =-8.0*texture(TEXTURE,UV).xyz ;
    M_Crl1 += texture(TEXTURE, UV + vec2(0.0, M_y)).xyz;
    M_Crl1 += texture(TEXTURE, UV + vec2(0.0, -M_y)).xyz;
    M_Crl1 += texture(TEXTURE, UV + vec2(M_x, 0.0)).xyz;
    M_Crl1 += texture(TEXTURE, UV + vec2(-M_x,0.0)).xyz;
	M_Crl1 += texture(TEXTURE, UV + SCREEN_PIXEL_SIZE.xy).xyz;
    M_Crl1 += texture(TEXTURE, UV - SCREEN_PIXEL_SIZE.xy).xyz;
    M_Crl1 += texture(TEXTURE, UV + vec2(-M_x,M_y)).xyz;
    M_Crl1 += texture(TEXTURE, UV + vec2(M_x,-M_y)).xyz;
    COLOR.xyz = M_Crl1;
}
// Called for every vertex the material is visible on.
void vertex() {}
// Called for every pixel for every light affecting the CanvasItem.
void light() {}
