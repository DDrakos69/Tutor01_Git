extends Node3D


var V_ClsActor:Cls_Actor;

## Ejecuta modificaciones sobre otros
## objetos al entrar dentro
## [["Mapa","Actor","Comando",Valor],[..],[..
## PX+,PX-,PY+,PY-,VIS,ANI,
@export_multiline var V_CMD_In:String="";

## Ejecuta modificaciones sobre otros
## objetos al entrar dentro
## [["Mapa","Actor","Comando",Valor],[..],[..
## PX+,PX-,PY+,PY-,VIS,ANI,
@export_multiline var V_CMD_Out:String="";

## Ejecuta modificaciones sobre otros
## objetos al entrar dentro
## [["Mapa","Actor","Comando",Valor],[..],[..
## PX+,PX-,PY+,PY-,VIS,ANI,
@export_multiline var V_CMD_Clik:String="";



## Cadena sin mas.
var V_Str="";
var V_Tb:Array;

func _init():
	pass
#END _ini





# Called when the node enters the scene tree for the first time.
func _ready():
	var M_t:Array;
	V_Str=V_CMD_In;
	print("3"+V_Str);
	V_Tb=JSON.parse_string(V_Str);
	print("4"+str(V_Tb));
	pass # Replace with function body.
#END _Ready





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
