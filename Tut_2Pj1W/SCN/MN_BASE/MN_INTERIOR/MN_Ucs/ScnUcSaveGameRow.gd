extends Control

@onready var V_Player1:CLS_GLOBALS_PLAYER;
@onready var V_Player2:CLS_GLOBALS_PLAYER;
@onready var V_GameCab:CLS_GLOBALS_CAB;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func F_ShowPlayer1():
	if(V_GameCab!=null):
		if(V_Player1!=null):
			$LbNivel.text=str(V_GameCab.V_IdNivel);
			$LbNivel.text=str(V_GameCab.V_IdNivel);
			
		#END If V_Play1
	#END If GameCab
	
#END F_ShowPlayer1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
