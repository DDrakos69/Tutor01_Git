extends Node3D

# Indica si esta abierta o cerrada la puerta
@onready var v_is_open:bool=false;
# indica esta animando
@onready var v_in_anim:bool=false;
@onready var v_anim_pl = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func f_open():
	if (!v_in_anim):
		if (!v_is_open):
			v_anim_pl.play("ascen0_open_anim");

func f_close():
	if (!v_in_anim):
		if (v_is_open):
			v_anim_pl.play("ascen0_close_anim");


func f_is_open():
	v_is_open=true;
	
	
func f_is_close():
	v_is_open=false;
