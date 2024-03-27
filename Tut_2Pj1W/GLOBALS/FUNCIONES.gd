extends Node
# - - - FUNCIONES.gd (F)







# Esta funcion Pasa de Bool a int True=1 False=0 (Usado para ficheros)
func Bool2Int(MBool:bool)->int:
	if(MBool):
		return 1;
	else:
		return 0;
#END func Bool2Int






# Esta funcion pasa de int a Bool 1=true 0=false (Usado para ficheros)
func Int2Bool(MInt:int)->bool:
	if(MInt!=0):
		return true;
	else:
		return false;
#END func Int2Bool




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
