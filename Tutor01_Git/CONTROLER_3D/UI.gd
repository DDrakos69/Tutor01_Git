extends Control

var V_CamCont:Node3D;


func F_Log(M_Acc:int,M_Txt:String=""):
	V.F_Log(M_Acc,M_Txt,self.name);
#END F_log



# Indica si ya se ha cargado ESTE Ready
var V_ReadyOk=false;
#- Lo cargo a parte ya que aqui el ready aun no tienen todos los controles.
func F_Ready():
	V_ReadyOk=true;
	F_Log(1,"F_Ready()");
	V_CamCont=V.F_Group01_Find("CamCont_N3D");
	F_Log(2,"F_Ready()");
#END F_Ready




# Called when the node enters the scene tree for the first time.
func _ready():
	F_Log(1,"_ready()");
	F_Log(2,"_ready()");
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V.V_Init_Ok):
		if(!V_ReadyOk):F_Ready();
#END _process()

