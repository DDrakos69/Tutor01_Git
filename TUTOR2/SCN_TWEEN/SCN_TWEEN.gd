extends Node2D
func _ready():
	var V_Tween:Tween=self.create_tween();
	V_Tween.set_loops(2);#Numero de repeticiones
	V_Tween.set_parallel(true);#Indica para todo o se ejecuta paralelamente al resto.
	V_Tween.set_trans(Tween.TRANS_QUAD);
	V_Tween.set_ease(Tween.EASE_IN_OUT);#Tipo de final de la transacion.
	V_Tween.set_pause_mode(Tween.TWEEN_PAUSE_STOP);# Tipo de pausa al pausar la animacion.
	V_Tween.set_speed_scale(20);#Multiplicador de tiempo.
	V_Tween.tween_property($Label,"rotation",360,1000).set_delay(50);
	V_Tween.tween_property($Label,"scale",Vector2(200,200),1000);
	V_Tween.tween_property($Label,"position",Vector2(1000,500),50);
	V_Tween.tween_method(F_TweenStep,1,500,400);
	V_Tween.tween_callback(F_TweenEnd);
#END _ready
func F_TweenEnd():
	print("Tween Termino.");
#END F_TweenEnd():
func F_TweenStep(PASO:int):
	print(str(PASO));
#END F_TweenStep():
func _process(delta):
	pass
