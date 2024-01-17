extends Label

func F_Tron(Txt):
	V.F_Tron(self,Txt);
#End F_Tron


#Botones con las resoluciones X
var V_ResX=[];

# Called when the node enters the scene tree for the first time.
func _ready():
	var Mq:int=0;
	while(Mq<4):
		var MBt=Button.new();
		MBt.name="BT_ResX"+str(Mq);
		MBt.set_size(Vector2(50,30));
		MBt.text=str(((Mq*200)+600));
		self.add_child(MBt);
		MBt.set_position(Vector2((100+(Mq*50)),0));
		var MCall=Callable(self,"F_Evt_MyButton_Up");
		#MBt.connect("button_up",MCall);
		MBt.button_down.connect(F_Evt_MyButton_Up.bind(MBt));
		V_ResX.append(MBt);#Añado Boton a mi tabla.
		Mq+=1;
	#End While Mq
	print("Botones:"+str(V_ResX.size()));
	pass # Replace with function body.

func F_Evt_MyButton_Up(VAL):
		if (VAL is Button):
			print("MyBtPress"+str(VAL.name));
		else:
			print("MyBtPress"+str(VAL));
#End Func F_Evt_MyButton_Up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
