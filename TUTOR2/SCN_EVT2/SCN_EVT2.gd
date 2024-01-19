extends Control

func _ready():
	#Enlazo a mi Evento
	$ColorRect/Button.connect("EVT_CLICK",
	Callable(self,"EVT_Clik"));
	
	#Enlazo a un evento base
	$ColorRect/Button.connect("button_up",
	Callable(self,"EVT_Up"));	
#END _ready
func EVT_Clik(SELF):
	if (SELF is Button):
		print("SCN.EVT_Clic");
	#EndIF
#END EVT
func EVT_Up(SELF):
	if (SELF is Button):
		print("SCN.EVT_Up");
	#EndIF
#END EVT

func _process(delta):
	pass
