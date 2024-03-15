extends Control
#ScnUcSaveGameRow
# User Control Save game Row
# Es solo un Row de una partida guardada.
# En la pantalla de guardar o cargar partida
# Se muestran estos rows como tabla de Rows

var CLog:Cls_LogLine=Cls_LogLine.new("UcCtrl");


@onready var V_Player1:Cls_Player;
@onready var V_Player2:Cls_Player;
@onready var V_GameCab:Cls_Player_Cab;


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
