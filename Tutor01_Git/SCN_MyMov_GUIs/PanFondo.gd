extends Panel



func F_Tron(Txt):
	V.F_Tron(Txt,self);
#End F_Tron





# Called when the node enters the scene tree for the first time.
func _ready():
	$LB_Status.set_position(Vector2(1,1));
	$LB_Status.set_size(Vector2(30,30));
	
	$BT_SHOW.set_position(Vector2(50,1));
	$BT_SHOW.set_size(Vector2(50,20));
	
	$ChBd2D_Keko/Sprite2D.set_position(Vector2(200,200));
	
	$Lab_Pos.set_position(Vector2(50,20));
	$Lab_Pos.set_size(Vector2(100,20));
	
	
	
	$BT_ZIndex.set_position(Vector2(300,1));
	$BT_ZIndex.set_size(Vector2(50,20));	
	
	$BT_HIDE.set_position(Vector2(200,1));
	$BT_HIDE.set_size(Vector2(50,20));
	
#	pass # Replace with function body.
#END func _ready






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../PanFondo/LB_Status".text="";	
	$Lab_Pos.text=str($ChBd2D_Keko/Sprite2D.get_position());
#	#pass
#end fnc _process
