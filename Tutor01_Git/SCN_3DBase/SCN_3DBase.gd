extends Node3D

var V_IsOpen=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("Key_Space_release")):
		
		if(V_IsOpen==0 || V_IsOpen==2):
			print("Key Release:"+str(V_IsOpen));
			if(V_IsOpen==0):
				$Mueble/Cube/AnimP_Doors.play("doors_oppen");
				V_IsOpen=1;
				
			if(V_IsOpen==2):
				$Mueble/Cube/AnimP_Doors.play("doors_close");			
				V_IsOpen=1;
	
func _on_anim_p_doors_animation_finished(anim_name):
	match (anim_name):
		"doors_oppen":
			print("open complet");
			$Mueble/Cube/AnimP_Doors.pause();
			V_IsOpen=2;
		"doors_close":
			print("close complet");
			$Mueble/Cube/AnimP_Doors.pause();
			V_IsOpen=0;

