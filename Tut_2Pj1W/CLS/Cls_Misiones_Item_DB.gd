extends Node
class_name Cls_Misiones_Item

#- CLS_MISIONES_ITEM
# Para completar una mision tienes que tener una serie 
# de items.
# Esta clase gestiona los datos del item necesario para la mision.
# No necesita guardarse en la DB ya que si la mision esta 
# VIVA se Revisa si esta fallida, completa o no se ha cogido no se revisa.


var ItemID:String="";
var ItemCant:int=0;

func _init():
	pass
#END _init

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
