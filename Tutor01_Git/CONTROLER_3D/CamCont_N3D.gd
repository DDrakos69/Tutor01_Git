extends Node3D


func F_Log(M_Acc:int,M_Txt:String=""):
	V.F_Log(M_Acc,M_Txt,self.name);
#END F_log


#- Ajusta la sensivilidad de rotacion con el mouse de la camara
# Permite que se exporte a la ui estas variables
@export var V_MouseSensitiveX=0.001;
@export var V_MouseSensitiveY=0.001;


# Indica si ya se ha cargado ESTE Ready
var V_ReadyOk=false;











func _ready():
	F_Log(1,"_ready()");
	F_Log(2,"_ready()");
	

func F_Ready():
	V_ReadyOk=true;





func _process(delta):
	if(V.V_Init_Ok):
		if(!V_ReadyOk):F_Ready();
		
		#if(Input.is_action_pressed("UI1_CAM_LEFT")):
			#rotate_y(-0.01);
		#if(Input.is_action_pressed("UI1_CAM_RIGHT")):
			#rotate_y(0.01);
			
	#END If Init Ok
# END _process


func _input(event):
	
	if(event is InputEventMouseMotion):
		# Ojo el event es el raton D-I=x F-B=y
		#- Limitamos la rotacion en X para que mire al suelo y al cielo solo
		var M_RotX:float=rotation.x-(event.relative.y*V_MouseSensitiveX);
		M_RotX=clamp(M_RotX,-0.7,0.8);
		
		#- Creamos vector de rotacion Y=v X=h Z=f
		var M_Vec3D:Vector3=Vector3(
			M_RotX,
			rotation.y-(event.relative.x*V_MouseSensitiveY),
			rotation.z);
		
		#- Ajustamos la rotacion del este CamControler
		rotation=M_Vec3D;
	#END if EvtMouseMotion
#END _input(event):
