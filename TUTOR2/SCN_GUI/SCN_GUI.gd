extends Control

var V_Pos:Vector2;
var V_RecPos:Vector2;
var V_seg:int=0;
var V_Sy:int=0;

var V_Score:int=0;
var V_InPlay:bool=false;

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	
	#pass # Replace with function body.
#END_Ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V_seg+30<Time.get_ticks_msec()):
		V_seg=Time.get_ticks_msec();
		print(str(V_seg));		
		
		V_RecPos=$RecColor.get_screen_position();
		$RecColor/Label.text=str(V_RecPos);
	
		$RecColor/Label2.text=str($RecColor/Bt_Resume.get_screen_position());
		V_Sy=50;
		if (V_InPlay):
			$RecColor/Bt_Resume.show();
			F_Mueve($RecColor/Bt_Resume,
			1,10,V_Sy,V_Sy+10);
		else:
			$RecColor/Bt_Resume.hide();
		#END If
				
		V_Sy+=50;
		F_Mueve($RecColor/Bt_New,
		1,10,V_Sy,V_Sy+10);
		
		V_Sy+=60;
		F_Mueve($RecColor/Bt_Exit,
		1,10,V_Sy,V_Sy+10);
		#pass
	#endIF
#End _Process

func F_Mueve(OBJ,XMin:int,XMax:int,YMin:int,YMax:int):
	if(OBJ is Button):
		V_Pos=OBJ.position;
		print(OBJ.name);
		
		print(str(V_Pos));
		var M_Sx=int(randf()*4);
		if((randf()*4)>2):
			V_Pos.x=(V_Pos.x+M_Sx);
			print("SX:",str(M_Sx));
		else:
			V_Pos.x=V_Pos.x-M_Sx;
			print("sx:",str(M_Sx));
		#endif
		
		M_Sx=int(randf()*4);
		if((randf()*4)>2):
			V_Pos.y=V_Pos.y+int(M_Sx);
			print("SY:",str(M_Sx));
		else:
			V_Pos.y=V_Pos.y-int(M_Sx);
			print("sy:",str(M_Sx));
		#endif
		if(V_Pos.x<XMin):V_Pos.x=XMin;
		if(V_Pos.x>XMax):V_Pos.x=XMax;
		if(V_Pos.y<YMin):V_Pos.y=YMin;
		if(V_Pos.y>YMax):V_Pos.y=YMax;
		
		print(str(V_Pos));
		OBJ.set_position(V_Pos);
		
	#END If
	
#END Fnc F_Mueve
