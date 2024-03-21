extends Node3D
var CLog:Cls_LogLine;

@onready var V_ScnMapA01 = $".";


func _init():
	CLog=Cls_LogLine.new("ScnMapA01");
	CLog.V_Visible=true;


# Called when the node enters the scene tree for the first time.
func _ready():
	CLog.Com(str(V_ScnMapA01.name));
#END _ready






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
