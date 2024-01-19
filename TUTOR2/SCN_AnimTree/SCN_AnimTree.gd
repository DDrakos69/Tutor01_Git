extends Node2D

@onready var V_PlayBack:AnimationNodeStateMachinePlayback=$Sprite2D/AnimationTree.get("parameters/playback");

func _ready():
	V_PlayBack.travel("RUN");
#end func _ready
	
func F_GetAnimTr_GetPlayBack():
	var M_Node=V_PlayBack.get_current_node();
	if(M_Node=="Run_I"):print("RUN");
	elif(M_Node=="Hidle_L"):print("Hidle");
	elif(M_Node=="Step_L"):print("Step");
	elif(M_Node=="GunA_L"):print("Gun");
	else:
	# EndIf
#End func F_GetStMach_GetEstado



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
