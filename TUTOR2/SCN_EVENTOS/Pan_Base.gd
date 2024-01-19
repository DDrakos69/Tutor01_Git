extends Panel

var V_TBt=[];


func F_Tron(TXT):
	V.F_Tron(TXT,self);
#end Func F_TRON

#func F_Tron(Txt,SELF=self):
#	print(str(Time.get_ticks_msec())," >",
#	"[",SELF.name,"].",
#	Txt);
#End F_Tron


func _init():
	F_Tron("Pan_Base._init");
#End _init

func _enter_tree():
	F_Tron("_enter_tree");
#End _enter_tree

func _exit_tree():
	F_Tron("_exit_tree");
#End _exit_tree


func F_EVT_Bt_MouseUp(SENDER):
	F_Tron("EVT_Bt_MouseUp("+SENDER.name+")");
	if SENDER is Button:
		#var botonHijo = cast_to(sender, Button);		
		F_Tron(SENDER.name+".EVT_Bt_MouseUp_HIJO");
#End Evt_Bt_MouseUp

func F_Evt_EndReady():
	print("EVT_EndReady----------------------");
#End F_Evt_EndReady

# Called when the node enters the scene tree for the first time.
func _ready():
	F_Tron("_ready");
	#Modifico el texto de un label creado
	var MLb:Label=$Lb_BtPulsado;
	MLb.text="Hola";
	
	$MButton.connect("Del_EndReady",
	Callable(self,"F_Evt_EndReady")
	);
	
	#- Carga todo lo necesario de la escena.
	#var M_SCN_REPO=load("res://SCN_REPO/SCN_REPO.tscn");
	#print("LOAD");
	
	#-- Añadimos la escena instanciada a la escena actual.
	#get_tree().root.add_child(M_SCN_REPO)
	#F_Tron("ADDChild");
	#self.add_child(M_SCN_REPO);
	#F_Tron("ADDChild.. OK");
	
	#F_Tron("CLON BUTTON Instance");
	#M_BtClon.reparent(self);
	#self.add_child(M_BtClon);
	#F_Tron("CLON BUTTON Instance .. OK");
	
	#- Precarga de forma rapida una escena.
	F_Tron("PRE-LOAD");
	var M_SCN_REPO=preload("res://SCN_EVENTOS_REPO/SCN_REPO.tscn").instantiate();
	F_Tron("PRE-LOAD.. OK");
	
	F_Tron("CLON BUTTON");
	var M_BtClon=M_SCN_REPO.get_node("REPO_BTBase");
	F_Tron("CLON BUTTON.. OK");
	
	F_Tron("Botones MAKE,ADD2TABLE,ADD2PARENT,CFGBT ");
	V_TBt.clear();
	var M_q:int=0;
	var M_Pos:Vector2;
	var M_Size:Vector2;
	M_Size.x=40;M_Size.y=20;M_q=0;
	while (M_q<20):
		var M_Bt:Button=M_BtClon.duplicate();
		M_Bt.name="BT"+str(M_q);
		M_Bt.text=M_Bt.name;
		V_TBt.append(M_Bt);
		#
		self.add_child(M_Bt);
		M_Bt.set_size(M_Size,false);
		M_Bt.visible=true;
		M_Pos.x=M_q*50;
		M_Bt.set_position(M_Pos);

		M_q+=1;
	#EndWhile
	F_Tron("Botones MAKE,ADD2TABLE,ADD2PARENT,CFGBT ..OK");
	
	F_Tron("Botones Eventos");
	M_q=0;
	while (M_q<20):
		var M_Bt:Button=V_TBt[M_q];
		V_TBt[M_q].connect("MI_Evt_MouseUp",
		Callable(self, "F_EVT_Bt_MouseUp"));
		M_q+=1;
	#EndWhile
	F_Tron("Botones Eventos.. OK");
	#pass # Replace with function body.
#End Func _ready

func Evt_Button_MouseUp(SELF):
	F_Tron(SELF.name+".Evt_Button_MouseUp");
#end Func Evt_Button_MouseUp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
