extends Button

signal EVT_CLICK(SELF);

func _ready():
	self.connect("button_up",
	Callable(self,"EVT_Click"),
	CONNECT_PERSIST);
#END _READY

func EVT_Click():
	self.emit_signal("EVT_CLICK",self);
	self.text="Click";
#END EVT

func _process(delta):
	pass
