shader_type canvas_item;

const vec3 V_ColorA=vec3(0.1,0.1,1.0);
const vec3 V_ColorB=vec3(1.0,0.5,0.3);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 M_Color= vec3(0.0);
	float M_Pct= abs(sin(TIME));
	M_Color=mix(V_ColorA,V_ColorB,M_Pct);
	COLOR=vec4(M_Color, 0.5);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
