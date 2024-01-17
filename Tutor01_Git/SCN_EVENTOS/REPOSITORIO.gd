extends Node


func F_Tron(Txt):
	print(str(Time.get_ticks_msec())," >",
	self.name," ",
	Txt);
#End F_Tron

func _init():
	F_Tron("_init");
#End _init

func _enter_tree():
	F_Tron("_enter_tree");
#End _enter_tree

func _exit_tree():
	F_Tron("_exit_tree");
#End _exit_tree

# Called when the node enters the scene tree for the first time.
func _ready():
	F_Tron("_ready");
	#pass # Replace with function body.
#End Func _ready

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
