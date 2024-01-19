extends AudioStreamPlayer2D
var V_SND_Grito;

# Called when the node enters the scene tree for the first time.
func _ready():
	V_SND_Grito=preload("res://SCN_AnimPlayer/male-scream-in-fear-123079.mp3");
#END func _ready()


func F_PlayGrito():
	self.stream=V_SND_Grito;	
	self.play();
#END func F_PlayCorte

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
