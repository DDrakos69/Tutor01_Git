extends Node3D

class ClsELista:
	var Rojo=0;
	var Verde=1;
	var Azul=2;
#END Class
var Elista:ClsELista;





# Called when the node enters the scene tree for the first time.
func _ready():
	print (Elista.Azul);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
