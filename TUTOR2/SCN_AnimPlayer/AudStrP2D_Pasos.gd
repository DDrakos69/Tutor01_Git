extends AudioStreamPlayer2D

var V_SND_Steap1;
var V_SND_Steap2;
var V_SND_Corte;

# Called when the node enters the scene tree for the first time.
func _ready():
	V_SND_Steap1=preload("res://SCN_AnimPlayer/wood-step-sample-1-47664.mp3");
	V_SND_Steap2=preload("res://SCN_AnimPlayer/step-7-93057.mp3");
	V_SND_Corte=preload("res://SCN_AnimPlayer/knife-slice-41231.mp3");
#END func _ready()


func F_PlayCorte():
	self.stream=V_SND_Corte;
	self.play();
#END func F_PlayCorte

func F_PlaySteap(NUM:int=0):
	if(NUM==0):
		self.stream=V_SND_Steap1;
		self.play();
	#ENDIF
	if(NUM==1):
		self.stream=V_SND_Steap2;
		self.play();
	#ENDIF
#END func F_PlaySteap

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
