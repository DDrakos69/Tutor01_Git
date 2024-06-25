extends Node3D

func F_Log(M_Acc:int,M_Txt:String=""):
	V.F_Log(M_Acc,M_Txt,self.name);
#END F_log

@onready var V_obj_ascen_0 = $obj_ascen0;


# Called when the node enters the scene tree for the first time.
func _ready():
	F_Log(1,"_ready");
	#-Borramos 
	V.V_Group01.clear();
	V.V_Group01.append($camcont_n3d);
	V.V_Group01.append($camcont_n3d/spring_arm3d/camera_cam3d);
	V.V_Group01.append($camcont_n3d/loockat_n3d);

	
	
	
	if(V.F_Group01_Test()==false):
		F_Log(0,str(V.V_Group01));
		#get_tree().quit();
	
	
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED;
	
	V.V_Init_Ok=true;
	
	V_obj_ascen_0
	
	
	F_Log(2,"_ready");
#END _ready



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit();
		

