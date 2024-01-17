extends Panel


func F_Tron(Txt):
	V.F_Tron(self,Txt);
#End F_Tron

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#End Func _Ready



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../PanFondo/LB_Status".text="V";
	
	#pass
#End Func _process

#
