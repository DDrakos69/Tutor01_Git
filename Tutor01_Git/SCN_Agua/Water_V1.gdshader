shader_type spatial;
//-- Base
uniform vec3 V_BaseColor:source_color = vec3(0.0 ,0.0 , 0.75);
uniform float V_Metalic:hint_range(0.0, 1.0)=0.0;
uniform float V_Roughness:hint_range(0.0, 1.0)=2.0;
uniform sampler2D V_TextNormal1;
uniform sampler2D V_TextNormal2;

//-- Movimiento.
uniform vec2 V_Direction1=vec2(2.0,0.0);
uniform vec2 V_Direction2=vec2(0.0,1.0);
uniform float V_TimeScale:hint_range(0.0, 0.5, 0.005)=0.025;

//-- Fresnel (Mezcla de luz segun angulo de normales y camara)
uniform vec3 V_FresnelColor:source_color;
uniform float V_FresnelForze:hint_range(0.0, 10.0, 0.1)=5.0;

// - - Olas (Deformacion de vertices segun mapa.)
uniform sampler2D V_OlasText;
uniform float V_OlasRuidoEscala=10.0;
uniform float V_OlasAlturaEscala=5.0;
//- - Olas Variables inter procesos de Traspaso
varying float V_OlasAlturaTras;
varying vec3 V_OlasPosMundoTras;

//- - Profundidad
uniform vec4 V_ProfColor : source_color ;// Color_deep
uniform vec4 V_ProfColorSuperficie : source_color ; //Color_Shallow
uniform float V_ProfAtenuacion = 2.0 ;//beers_law=Atenuacion de la luz
uniform float V_ProfFinal = -0.75 ;//Depth_offSets
// - Profundidad Importacion de DEPTH_TEXTURE y SCREEN_TEXTURE V2 de Shaders
uniform sampler2D V_DepthTexture:hint_depth_texture, filter_linear_mipmap;
uniform sampler2D V_ScreenTexture:hint_screen_texture,filter_linear_mipmap;


//Colision de Bordes.
uniform float V_BordeEscala = 0.1; // edge_scale
uniform float V_BordeCerca=1.0;//near
uniform float V_BordeLejos=100.0;//far
uniform vec3 V_BordeColor:source_color;//edge_color




//- Funcion Para calcular el Color Fresnel.
float F_Fresnel(float M_Fuerza , vec3 M_Normal , vec3 M_View){
	vec3 M_Normalize1 = normalize( M_Normal );
	vec3 M_Normalize2 = normalize( M_View );
	float M_Opuestos = dot( M_Normalize1 , M_Normalize2 );
	float M_Limit = clamp( M_Opuestos , 0.0 , 1.0 );
	float M_Potencia = pow( ( 1.0 - M_Limit) , M_Fuerza );
	return M_Potencia;
}

//- Funcion para calcular que tan fondo esta
float F_Edge(float MFondo ){
	float M_Fondo = 2.0 * MFondo - 1.0;
	return V_BordeCerca  * V_BordeLejos / (  V_BordeLejos + M_Fondo * ( V_BordeCerca - V_BordeLejos ));
}


void vertex() {
	V_OlasPosMundoTras = ( MODEL_MATRIX * vec4( VERTEX , 1.0 ) ).xyz;
	V_OlasAlturaTras = texture( 
		V_OlasText , 
		(V_OlasPosMundoTras.xz / V_OlasRuidoEscala) + (TIME * V_TimeScale)
	).r;
	VERTEX.y += V_OlasAlturaTras * V_OlasAlturaEscala;
}




void fragment() {
	//--depth Calc (Degradado por profundidad)
	float M_ProfText = texture( V_DepthTexture ,SCREEN_UV ).r *2.0 -1.0;//depthTexture
	float M_ProfFondo = PROJECTION_MATRIX[3][2] / ( M_ProfText  + PROJECTION_MATRIX[2][2]);//depth
	float M_ProfMezcla = exp( ( M_ProfFondo + VERTEX.z + V_ProfFinal ) * -V_ProfAtenuacion );//depth_blend 
	M_ProfMezcla = clamp ( 1.0 - M_ProfMezcla , 0.0 , 1.0);
	
	float M_ProfMezclaFuerza = clamp(
		pow ( M_ProfMezcla , 2.5) , 0.0 , 1.0
		);//depth_blend_power 
		
	vec3 M_ProfPantallaColor = textureLod(
		V_ScreenTexture, 
		SCREEN_UV, 
		M_ProfMezclaFuerza * 2.5).rgb;//screen_color 
		
	vec3 M_ProfFondoColor = mix(
		 V_ProfColorSuperficie.rgb,
		V_ProfColor.rgb, 
		M_ProfMezclaFuerza
		);//depth_color 
		
	vec3 M_ProfColor = mix(
		M_ProfPantallaColor * M_ProfFondoColor,
		M_ProfFondoColor * 0.25,
		M_ProfMezclaFuerza * 0.5
		);//color 
		
	//-- Calculo de Borde profundidaz 
	float M_BordeZ = F_Edge( texture( V_DepthTexture, SCREEN_UV).x ); //z_depth
	float M_BordeZPos = F_Edge(FRAGCOORD.z); // z_pos
	float M_BordeDif = M_BordeZ - M_BordeZPos; // z_dif	
	

		
		
		
		
		
	//-- Base + normal map
	//vec3 M_Normal=texture(V_TextNormal1,UV).rgb;
	//-- Base + normal map + MixBlends
	//vec3 M_NormalBlend=mix(
		//texture(V_TextNormal1,UV).rgb, 
		//texture(V_TextNormal2,UV).rgb,
		//0.5
		//);
	//-- Base + normal map + MixBlends + DespTime
	vec2 M_Time1=(TIME*V_Direction1)*V_TimeScale;
	vec2 M_Time2=(TIME*V_Direction2)*V_TimeScale;
	vec3 M_NormalBlendTime=mix(
		texture(V_TextNormal1,UV+M_Time1).rgb, 
		texture(V_TextNormal2,UV+M_Time2).rgb,
		0.5
		);
	// Fresnel
	float M_Fresnel = F_Fresnel( V_FresnelForze , NORMAL , VIEW ); 
	
	
	//-  Mezclas -
	// Fresnel Mezcla de BaseColor + Fresnel
	vec3 M_FresnelColor= mix ( V_BaseColor , V_FresnelColor , M_Fresnel );
	// Fonco Mezcla de FresnelColor + Fondo
	vec3 M_FondoColor= mix ( M_FresnelColor , M_ProfColor , 0.75);
	// Borde Mezclo el FondoColor + Borde
	vec3 M_BordeColor= mix ( V_BordeColor , M_FondoColor , step ( V_BordeEscala , M_BordeDif ));//depth_color_adj 
	
	
	// - SALIDAS
	ALBEDO = clamp(M_BordeColor,vec3(0.0),vec3(500.0));
	//ALBEDO = M_FondoColor;// Con Degradado de profundidad
	//ALBEDO = M_FresnelColor; // Con Fresnel
	//ALBEDO=V_BaseColor;
	//ALBEDO=vec3(0.0 , 0.0 , 0.0);
	METALLIC=V_Metalic;
	ROUGHNESS=V_Roughness;
	NORMAL_MAP=M_NormalBlendTime;
	
}	





void light() {
	// Called for every pixel for every light affecting the material.
}
