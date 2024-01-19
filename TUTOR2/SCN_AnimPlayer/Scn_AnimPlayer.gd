extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudStrPly2D_Bosque.play();
	$Sprite2D2_All.F_Inicia();
#END func _ready():


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
