extends Node3D
# - - pj_n3d.gd

# Called when the node enters the scene tree for the first time.
func _ready():
	V.V_Group01.append($pj_chb3d);
	V.V_Group01.append($pj_chb3d/pj_splight3d);
	V#.V_Group01.append($pj_chb3d/Cuerpo_Msh3D/Brazo_Msh3D);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
