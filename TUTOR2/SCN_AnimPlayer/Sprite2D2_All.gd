extends Sprite2D

var V_Seg:int=0;
var V_Step:int=-1;

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x=-10;
#EndFunc _ready

func F_Inicia():
	$AnimationPlayer.play("STEP_D");	
	V_Step=0;
#END F_Inicia():


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(V_Seg<Time.get_ticks_msec()):
		if(V_Step==0):
			self.position.x += 2;
			if(self.position.x>=100):V_Step=1;
			V_Seg=Time.get_ticks_msec()+50;
		elif(V_Step==1):
			$AnimationPlayer.play("ZAS");
			V_Seg=Time.get_ticks_msec()+3;
			V_Step==2
		elif(V_Step==2):
			$AnimationPlayer.play("STEP_R");
			V_Step==3
		elif(V_Step==3):
			self.position.x -= 2;
			if(self.position.x<=-10):V_Step=-1;
			V_Seg=Time.get_ticks_msec()+50;
		#END If	
		
	#ENDIF
#END func _process(delta):

func F_AnimPlay_Pisada():
	var M_Anim=$AnimationPlayer.get_animation("StepLeftX2");	
	if(int($AnimationPlayer.current_animation_position*10)==3):
		$"AudStrP2D_EFECTOS".F_PlaySteap(0);
		print("PISADA_A");
	else:
		$"AudStrP2D_EFECTOS".F_PlaySteap(1);
		print("PISADA_B");
	#ENDIF
#End F_AnimPlay_Pisada

func F_AnimPlay_Corte():
	$AudStrP2D_EFECTOS.F_PlayCorte();
	print("Corte");
#End F_AnimPlay_Corte():
