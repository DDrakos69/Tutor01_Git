extends Node

class_name ClsKeys

enum E_Acciones{
	V_Front=0,
	V_Back=1,
	V_Left=2,
	V_Right=3,
	V_Jump=4,
	V_Down=5
}
@onready var V_Keys;

func _init():

	#print("tx"+Mfloat. String. .format("%07.2f", Mfloat));
	
	#for Mq in E_Acciones.values().max:
		#var MKey:ClsKey=ClsKey.new();
		#V_Keys.append(MKey);
	##END For
	#print(V_Keys)
#END _init():




func F_SetDefP1():
	pass
#END F_SetDefP1

func _input(event):
	pass







# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
