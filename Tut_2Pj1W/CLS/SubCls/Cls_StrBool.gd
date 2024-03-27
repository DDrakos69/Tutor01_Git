extends Node
class_name  Cls_StrBool
var CLog:Cls_LogLine=Cls_LogLine.new("ClsStrBool");

# - - - - Cls Str Bool - - - 
# Estructura de datos con Clave Bool
# Usado para Habilidades del usuario 
# Indica que Habilidad esta Activada o no

var V_Str:String;
var V_Bool:bool;





func _init(M_Str:String="",M_Bool:bool=false):
	V_Str=M_Str;
	V_Bool=M_Bool;
	pass
#END _init()








# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	M_T.append(V_Str);
	M_T.append(F.Bool2Int(V_Bool));
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()







# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==2):
		V_Str=ArrayCfg[Mq];Mq=Mq+1;
		V_Bool=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray

