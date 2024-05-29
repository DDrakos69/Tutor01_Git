extends Node3D

func F_Log(M_Acc:int,M_Txt:String=""):
	V.F_Log(M_Acc,M_Txt,self.name);
#END F_log





# Called when the node enters the scene tree for the first time.
func _ready():
	F_Log(1,"_ready");
	#-Borramos 
	V.V_Group01.clear();
	V.V_Group01.append($CamCont_N3D);
	#V.V_Group01.append($CamCont_N3D/SpringArm3D/Cam_Cam3D);
	V.V_Group01.append($CamCont_N3D/SpringArm3D/Cam_Cam3D);
	V.V_Group01.append($CamCont_N3D/LoockAt_N3D);
	V.V_Group01.append($PJ_ChB3D);
	V.V_Group01.append($PJ_ChB3D/SpotLight3D);
	V.V_Group01.append($PJ_ChB3D/Cuerpo_Msh3D/Brazo_Msh3D);
	
	if(V.F_Group01_Test()==false):
		F_Log(0,str(V.V_Group01));
		#get_tree().quit();
	
	
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED;
	
	V.V_Init_Ok=true;
	F_Log(2,"_ready");
#END _ready



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
