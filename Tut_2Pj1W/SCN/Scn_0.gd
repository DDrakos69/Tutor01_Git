extends Node3D
var CLog:Cls_LogLine;

# - Para mejor acceso apunto los mapas a variables
@onready var V_ScnMapA01 = $ScnMapA01
@onready var V_ScnMapB01 = $ScnMapB01




func _init():	
	CLog=Cls_LogLine.new("ScnMapB01");
	CLog.V_Visible=true;
#END _init











# Called when the node enters the scene tree for the first time.
func _ready():
	#- Guardamos los Objetos de los mapas
	F_get_all_children(V_ScnMapA01);
	F_get_all_children(V_ScnMapB01);
	#- Mostramos la pantalla actual y ocultamos el resto.
	#V_ScnMapB01.free();
	
	V.F_TEST_SaveGame();
	
#END _ready











func F_get_all_children(M_Node3D:Node3D):
	#var M_Lst:Array[Node]=M_Node.get_children();
	var M_Lst:Array[Node]=M_Node3D.get_children();
	
	for M_q in M_Lst.size():
		if(V.V_ClsObjs.F_ADD_ByNode(M_Lst[M_q],Cls_Obj.eTipos.Suelo,true,1,"Desc")!=null):
			CLog.Com("ADD:"+str(M_Lst[M_q].name));
		#END If Add Ok
		F_get_all_children(M_Lst[M_q]);
#END F_get_all_Childern


















# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
