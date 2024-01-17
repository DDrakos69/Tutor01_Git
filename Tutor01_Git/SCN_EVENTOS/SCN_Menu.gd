extends Node

var V_Button;


func F_Tron(TXT):
	V.F_Tron(TXT,self);
#end Func F_TRON

func _init():
	F_Tron("SCN_Menu._init");
#End _init

func _enter_tree():
	F_Tron("_enter_tree");
#End _enter_tree

func _exit_tree():
	F_Tron("_exit_tree");
#End _exit_tree

# Called when the node enters the scene tree for the first time.
func _ready()->void:
	F_Tron("_ready");
	#var M_Score2=AL_PUNTAJE.V_Score;	
	V_Button=$MButton;
	#V_Button.connect("Del_")
	
	#M_Button.connect("Del_EndReady",self,"Evt_MButton_EndReady");
	
	print(F_Calcula());
	pass # Replace with function body.
#Fin Func _Ready

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(delta);
	pass
	
func F_Calcula()->Array:
	return [3,5,7];
	pass
	#Fin Funcion F_Calcula



func Evt_Button_ButtonUp():
	$ColorRect.color=Color.AQUA;
	pass # Replace with function body.


func Evt_Button_ButtonDown():
	$ColorRect.color=Color.CHARTREUSE;
	pass # Replace with function body.


func Evt_MButton_EndReady():
	$MColorRect.color=Color.MEDIUM_VIOLET_RED;
	pass
