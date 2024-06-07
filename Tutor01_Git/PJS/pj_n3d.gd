extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	V.V_Group01.append($PJ_ChB3D);
	V.V_Group01.append($PJ_ChB3D/SpotLight3D);
	V.V_Group01.append($PJ_ChB3D/Cuerpo_Msh3D/Brazo_Msh3D);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
