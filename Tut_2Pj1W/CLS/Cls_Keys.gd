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
@onready var V_Keys:Array=[];

func _init(MPredef:int):
	if(MPredef==0):F_SetDefP1();
	if(MPredef==1):F_SetDefP2();
	if(MPredef==2):F_SetDefP3();
	if(MPredef==3):F_SetDefP4();
#END _init():


func F_GetKey(Tipo:ClsKey.E_Tipos,key:int,val:float,IsOn:bool)->ClsKey:
	var MK:ClsKey=ClsKey.new(Tipo,key,val,IsOn);
	return MK;
#ENDfunc F_GetKey

func F_SetDefP1():
	#V_Front=0,
	V_Keys.append(F_GetKey(ClsKey.E_Tipos.V_Teclado,10,1,true));
	#V_Back=1,
	V_Keys.append(F_GetKey(ClsKey.E_Tipos.V_Teclado,11,1,true));
	#V_Left=2,
	V_Keys.append(F_GetKey(ClsKey.E_Tipos.V_Teclado,12,1,true));
	#V_Right=3,
	V_Keys.append(F_GetKey(ClsKey.E_Tipos.V_Teclado,13,1,true));
	#V_Jump=4,
	V_Keys.append(F_GetKey(ClsKey.E_Tipos.V_Teclado,14,1,true));
	#V_Down=5
	V_Keys.append(F_GetKey(ClsKey.E_Tipos.V_Teclado,15,1,true));
	
#END F_SetDefP1

func F_SetDefP2():
	pass
#END F_SetDefP2

func F_SetDefP3():
	pass
#END F_SetDefP3

func F_SetDefP4():
	pass
#END F_SetDefP4
















func _input(event):
	pass







# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
