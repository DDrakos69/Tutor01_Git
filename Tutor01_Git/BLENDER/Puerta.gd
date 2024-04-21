extends Node3D

var V_Stdo:int=0;
var V_Salto:float=0;
@onready var V_Puerta = $Puerta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#0 Cerrado
	#1 0 ->90
	#2 90
	#3 90 ->0
	#0
	#4 0 ->-90
	#5 -90
	#6 -90 ->0	
	#0
	if(V_Stdo==1 || V_Stdo==3 || V_Stdo==4 || V_Stdo==6):F_OpenClose(delta);
	pass

func F_OpenClose(M_Delta:float):
	#0 Cerrado
	#1 0 ->90
	#2 90
	#3 90 ->0
	#0
	#4 0 ->-90
	#5 -90
	#6 -90 ->0	
	#0
	
	V_Salto=4.0 * M_Delta;
	if(V_Stdo==1):# 0 -> 90
		if(V_Puerta.rotation_degrees.y<90):
			V_Puerta.rotate_y(V_Salto);
			print(str(V_Puerta.rotation_degrees.y));
		else:V_Stdo=2;
	if(V_Stdo==3):# 90 -> 0
		if(V_Puerta.rotation_degrees.y>0):
			V_Puerta.rotate_y(-V_Salto);
			print(str(V_Puerta.rotation_degrees.y));
		else:V_Stdo=0;
		
	if(V_Stdo==4):# 0 -> -90
		if(V_Puerta.rotation_degrees.y>-90):
			V_Puerta.rotate_y(-V_Salto);
			print(str(V_Puerta.rotation_degrees.y));
		else:V_Stdo=5;
	if(V_Stdo==6):# -90 -> 0
		if(V_Puerta.rotation_degrees.y<0):
			V_Puerta.rotate_y(V_Salto);
			print(str(V_Puerta.rotation_degrees.y));
		else:V_Stdo=0;



func _on_area_3d_area_entered(area):
	
	print("-In");
	pass # Replace with function body.


func _on_area_3d_area_exited(area):
	print("-Out");
	pass # Replace with function body.


func _on_area_3d_body_entered(body):

	pass # Replace with function body.


func _on_area_3d_body_exited(body):
	print("-Bex");
	pass # Replace with function body.


func _on_area_3d_in_body_entered(body):
	if(V_Stdo==2):V_Stdo=3;
	if(V_Stdo==0):V_Stdo=4;
	print("-Ben");
	pass # Replace with function body.



func _on_area_3d_out_body_entered(body):
	if(V_Stdo==0):V_Stdo=1;
	if(V_Stdo==5):V_Stdo=6;
	print("-Ben");
	pass # Replace with function body.


