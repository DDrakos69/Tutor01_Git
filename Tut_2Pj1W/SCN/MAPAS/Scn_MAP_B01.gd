extends Node3D
var CLog:Cls_LogLine;

@onready var V_ScnMapB01 = $".";


func _init():
	CLog=Cls_LogLine.new("ScnMapB01");
	CLog.V_Visible=true;
#END _init

# Called when the node enters the scene tree for the first time.
func _ready():
	CLog.V_Visible=true;
	#F_get_all_children(V_ScnMapB01);
#END _ready

func F_get_all_children(M_Node:Node):
	var M_Lst:Array[Node]=M_Node.get_children();
	for M_q in M_Lst.size():
		CLog.Com(str(M_Lst[M_q].get_path()));
		F_get_all_children(M_Lst[M_q]);
#END F_get_all_Childern




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
