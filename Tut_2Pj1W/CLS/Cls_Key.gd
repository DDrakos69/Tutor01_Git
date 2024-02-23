extends Node
class_name ClsKey

enum E_Tipos{
	V_Teclado=0,
	V_MouseBt=1,
	V_MouseAxis=2,
	V_PadBt=3,
	V_PadAxis=4
}

# Indica se esta captura esta activa o no
@onready var V_IsOn:bool=false;
# Indica el tipo de entrada asignada a esta key
@onready var V_Tipo:E_Tipos=E_Tipos.V_Teclado;
# Indica la tecla o eje a rastrear.
# key_event.scancode, axis_event.axis, button_event.button_index
@onready var V_Key:int=0;
# Indica que valor pone en on la activacion GetPressed
@onready var V_Value:float=0;

#Si se cumple Key y Value se pone en true
@onready var V_GetPressed:bool=false;
# Aqui guardo el valor real obtenido por si lo necesito.
@onready var V_GetValue:float=0;

# llamado al iniciar el constructor de la clase
func _init():
	pass
#End _init():

#Cargo de una cadena esta key
func FTxtSet(MTxt:String):
	#if(MTxt.len()==5):
	#	if(MTx.substr(0.5)=="[KEY]")
	pass
	

# llamado siempre y obtiene los eventos de entrada.
func _input(event):
	print(str(event));
#End _input(event):

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
