extends Node
class_name  Cls_LogLine
# Esta clase solo tiene las funciones y variables para generar una lina de log
# Se llama en la cabecera de todos los nodos que necesiten log.


func Add(MTxt:String,V_Visible:bool=true):Log_(MTxt,V_Visible,1);
func Del(MTxt:String,V_Visible:bool=true):Log_(MTxt,V_Visible,0);
func Com(MTxt:String,V_Visible:bool=true):Log_(MTxt,V_Visible,2);
func Log_(MTxt:String,MVisible:bool=true,MAcc:int=2):
	if(V_Visible):V.F_log(V_NameCls,MTxt,MAcc);
	
var V_Visible:bool=false;
var V_NameCls:String="";

func _init(NameCls:String):
	V_NameCls=NameCls;
