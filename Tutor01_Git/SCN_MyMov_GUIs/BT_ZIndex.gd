extends Button


func F_Tron(Txt):
	V.F_Tron(Txt,self);
#End F_Tron

# Called when the node enters the scene tree for the first time.
func _ready():
	self.button_up.connect(F_Evt_BtZIndex_up);
	pass # Replace with function body.
#end fnc _ready

func F_Evt_BtZIndex_up()->void:
	F_Tron("F_Evt_BtZIndex_up");
	$"../../PAN_CfgVideo".set_z_index(1);
#end fnc F_Evt_BtZIndex_up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
