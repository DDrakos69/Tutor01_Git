extends Node
class_name ClsKey


var CLog:Cls_LogLine=Cls_LogLine.new("ClsKey");





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
func _init(MTipo:E_Tipos,MKey:int,MValue:float,MIsOn:bool):
	V_IsOn=MIsOn;
	V_Tipo=MTipo;
	V_Value=MValue;
	V_Key=MKey;
#End _init():

#Cargo de una cadena esta key
func FTxtSet(MTxt:String):
	#if(MTxt.len()==5):
	#	if(MTx.substr(0.5)=="[KEY]")
	pass

# llamado siempre y obtiene los eventos de entrada.
func _input(event):
	if(V_IsOn):
		var M_Log:bool=false;
		CLog.Com("_input("+str(V_Tipo)+").IsOn",M_Log);
		
		if(V_Tipo==E_Tipos.V_MouseBt && (event is InputEventMouseButton)):
			CLog.Com(str(V_Tipo)+str(event.position),M_Log);
		#END if Tipo MouseBt
		
		if(V_Tipo==E_Tipos.V_MouseAxis && (event is InputEventMouseMotion)):
			CLog.Com(str(V_Tipo)+str(event.position),M_Log);
		#END if Tipo MouseBt
	#END If IsOn
	
	
	## Mouse in viewport coordinates.
	#if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
	#elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
	## Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
	#print(str(event));
#End _input(event):



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
