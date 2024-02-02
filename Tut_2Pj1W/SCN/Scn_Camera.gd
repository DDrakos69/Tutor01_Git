extends Node3D

@onready var V_BackG_SubViewPort =$Base_Cam3D/BackGC1_SubViewPortCont/BackGC1_SubViewPort;
@onready var V_Front_SubViewPort = $Base_Cam3D/FrontC2_SubViewPortCont/FrontC2_SubViewPort;

@onready var V_BackG_Cam3d = $Base_Cam3D/BackGC1_SubViewPortCont/BackGC1_SubViewPort/BackGC1_Cam3D;
@onready var V_Front_Cam3d = $Base_Cam3D/FrontC2_SubViewPortCont/FrontC2_SubViewPort/FrontC2_Cam3D;


# Called when the node enters the scene tree for the first time.
func _ready():
	F_Resize();
	V.V_CamFront=$Base_Cam3D/FrontC2_SubViewPortCont/FrontC2_SubViewPort/FrontC2_Cam3D
	V.V_CamBack=$Base_Cam3D/BackGC1_SubViewPortCont/BackGC1_SubViewPort/BackGC1_Cam3D
	
	
#END _Ready

func F_Resize():
	#- Reescalamos a pelo para hacerlo dinamico , por parametro es estatico.
	var M_Size:Vector2=DisplayServer.window_get_size();
	M_Size.x=(M_Size.x/2);
	V_BackG_SubViewPort.size=M_Size;
	V_Front_SubViewPort.size=M_Size;
	$Base_Cam3D/BackGC1_SubViewPortCont.size=M_Size;
	$Base_Cam3D/FrontC2_SubViewPortCont.size=M_Size;
	$Base_Cam3D/FrontC2_SubViewPortCont.position.x=M_Size.x-250;
	
	
#END F_Resize

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Test para indicar que dibuje la doble cara o cara invisble de los objetos.
	#if(Input.is_key_pressed(KEY_CTRL)):
		#$Base_Cam3D/Front_SubViewPortCont/Front_SubViewPort.transparent_bg=!$Base_Cam3D/Front_SubViewPortCont/Front_SubViewPort.transparent_bg;
		#$Base_Cam3D/BackG_SubViewPortCont/BackG_SubViewPort.transparent_bg=!$Base_Cam3D/BackG_SubViewPortCont/BackG_SubViewPort.transparent_bg;
		#print("KEY PRESS");
		
		
	V_BackG_Cam3d.global_transform=V.V_PlayerCamPoint.global_transform;
	#V_BackG_Cam3d.position.x +=1;
	V_Front_Cam3d.global_transform=V.V_PlayerCamPoint.global_transform;
#END _Process
