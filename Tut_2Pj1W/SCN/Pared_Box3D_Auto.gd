extends CSGBox3D

var CLog:Cls_LogLine=Cls_LogLine.new("ParedBox3D");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V.V_Player.global_position.x>global_position.x):
		F_Send2Back();
	else:
		F_Send2Front();
#END _process(delta):


func F_Send2Back():
	if(get_layer_mask_value(2)):
		set_layer_mask_value(1,true);
		set_layer_mask_value(2,false);
#END F_Send2Back():


func F_Send2Front():
	if(get_layer_mask_value(1)):
		set_layer_mask_value(2,true);
		set_layer_mask_value(1,false);
#END F_Send2Front():
	
