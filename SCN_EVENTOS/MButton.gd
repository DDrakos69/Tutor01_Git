extends Button

signal Del_EndReady(Value);
var V_SegRefres:int=Time.get_ticks_msec();


func F_Tron(TXT):
	V.F_Tron(TXT,self);
#end Func F_TRON

func _init():
	F_Tron("MButton._init");
#End _init

func _enter_tree():
	F_Tron("_enter_tree");
#End _enter_tree

func _exit_tree():
	F_Tron("_exit_tree");
#End _exit_tree

# Called when the node enters the scene tree for the first time.
func _ready():
	F_Tron("_ready");
	#add_user_signal("Del_EndReady",[1]);
	#emit_signal("Del_EndReady");
	
	#Acceso a un nodo por su ruta.
	#var MLb:Label=self.get_node("GUI_Node/Pan_Base/7");
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V_SegRefres<Time.get_ticks_msec()):
		V_SegRefres=Time.get_ticks_msec()+50;
		var M_Pos:Vector2=$".".get_screen_position();
		M_Pos.x=M_Pos.x+(1);
		if(M_Pos.x>200):M_Pos.x=0;
		$".".set_position(M_Pos,false);
		$"../Lb_PosBt".text=str(M_Pos.x);
	#End If Delay
	#pass

### Esta funcion busca el nodo Root 
### y lanza el analisis del arbol de nodos.
func F_GetArbolNodos():
	var M_Final:bool=false;
	var M_Obj=self;
	var M_ObjRoot=self;
	while (!M_Final):
		M_Obj=M_Obj.get_parent()
		if(M_Obj==null):
			M_Final=true;
		else:
			M_ObjRoot=M_Obj;
		#EndIf
	#endWhile
	if(M_ObjRoot!=null):F_PrintNodos(M_ObjRoot,"|-");
		
	#endif
#EndFunc





## Esta Funcion imprime el nombre de los nodos y sus hijos.
func F_PrintNodos(NodoRoot,StrRoot):
	if(NodoRoot!=null):
		var M_ObjLst;
		var Mq:int=0;
		print(StrRoot,NodoRoot.name);
		M_ObjLst=NodoRoot.get_child();
		while (Mq<M_ObjLst.size()):
			F_PrintNodos(M_ObjLst[Mq],StrRoot+"|-");
			Mq=Mq+1;
		#EndWhile
	#del if NodoRoot No Null
#endfunc
