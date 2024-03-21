extends Node
class_name  Cls_Misiones_DB
var CLog:Cls_LogLine=Cls_LogLine.new("ClsMisionesDB");


# Clase de Datos para la cabecera de los datos del player
# Se usa tanto para PJs como PNJs
# Se carga en Cls_Globals_Player y para los Saves en GLOBALS
# No responde a eventos solo es una clase de datos

func _init():
	pass
#END _init()

enum eTipos{}
var V_TItems:Array[Cls_Misiones_Item];









# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
