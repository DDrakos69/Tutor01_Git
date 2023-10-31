extends Button

func F_Tron(Txt):
	V.F_Tron(Txt,self);
#End F_Tron

# Called when the node enters the scene tree for the first time.
func _ready():
	self.button_up.connect(F_Evt_Button_Up);
	#pass # Replace with function body.
#END func _ready()




func F_Evt_Button_Up()->void:
	F_Tron("F_Evt_Button_Up");
	$"../../PAN_CfgVideo".set_process(true);
	$"../../PAN_CfgVideo".visible=true;
#End Func F_Evt_Button_Up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
