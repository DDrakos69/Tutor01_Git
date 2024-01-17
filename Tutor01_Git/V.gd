extends Node


#Movimiento personalizado
var V_Axis:Vector2;
func F_GetAxis()->Vector2:
	V_Axis.x=int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"));
	V_Axis.y=int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up"));
	#print(str(V_Axis.x)+" x "+str(V_Axis.y)+" y");
	return V_Axis.normalized();
#Fin Fnc F_GetAxis


var V_TIME:int;




var V_SCORE:int;

var V_TTxt:String;

func F_Tron(Txt,SELF=self):
	print(str(Time.get_ticks_msec())," >",
	"[",SELF.name,"].",
	Txt);
#End F_Tron

func _init():
	F_Tron("_init");
#End _init

func _enter_tree():
	F_Tron("_enter_tree");
#End _enter_tree

func _exit_tree():
	F_Tron("_exit_tree");
#End _exit_tree



func EVT_BtMouseUp():
	print("EVT_BtMouseUp");
#End Fnc EVT_BtMouseUp;
