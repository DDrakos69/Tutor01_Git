extends Button

signal MI_Evt_MouseUp(SELF);


func F_Tron(TXT):
	V.F_Tron(TXT,self);
#end Func F_TRON

func _init():
	F_Tron("REPO_BTBase._init");
#End _init

func _enter_tree():
	F_Tron("_enter_tree");
#End _enter_tree

func _exit_tree():
	F_Tron("_exit_tree");
#End _exit_tree

# Called when the node enters the scene tree for the first time.
func _ready()->void:
	F_Tron("_ready");
	
	self.button_up.connect(Evt_Button_Up)
	
#	self.connect("button_down", 
#	Callable(self, "Evt_Button_Up"))
	
#	self.connect(button_down,
#	Callable(self, Evt_Button_Up));
	
	#pass # Replace with function body.
#end Func _Ready

func Evt_Button_Up():
	F_Tron(self.name+".Evt_Button_Up");
	F_Tron(self.name+".Emit Evt_MouseUp");
	#self.Evt_MouseUp.emit();
	self.emit_signal("MI_Evt_MouseUp",self)
	F_Tron(self.name+".Emit Evt_MouseUp..OK");
	
#END Fnc _pressed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
