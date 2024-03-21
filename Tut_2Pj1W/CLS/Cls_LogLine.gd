extends Node
class_name  Cls_LogLine
# Esta clase solo tiene las funciones y variables para generar una lina de log
# Se llama en la cabecera de todos los nodos que necesiten log.


func Add(MTxt:String,MVisible:bool=V_Visible):Log_(MTxt,MVisible,1);
func Del(MTxt:String,MVisible:bool=V_Visible):Log_(MTxt,MVisible,0);
func Com(MTxt:String,MVisible:bool=V_Visible):Log_(MTxt,MVisible,2);
func Log_(MTxt:String,MVisible:bool=V_Visible,MAcc:int=2):
	if(MVisible):V.F_log(V_NameCls,MTxt,MAcc);
	
var V_Visible:bool=false;
var V_NameCls:String="";

func _init(NameCls:String):
	V_Visible=false;
	V_NameCls=NameCls;
