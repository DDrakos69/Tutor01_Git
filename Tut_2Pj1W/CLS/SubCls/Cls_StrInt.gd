extends Node
class_name  Cls_StrInt
var CLog:Cls_LogLine=Cls_LogLine.new("ClsStrInt");

# - - - - Cls Objeto Valor - - - 
# Estructura de datos con Clave Valor
# Usado para crear o reciclar items.
# Indica que item se necesita o da y cuantos.
# De momento no guarda ni carga de fichero pero esta preparado.

var V_Str:String="";
var V_Int:int=0;

func _init(M_Str:String="",M_Int:int=0):
	V_Str=M_Str;
	V_Int=M_Int;
	pass
#END _init()







# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	M_T.append(V_Str);
	M_T.append(V_Int);
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
		V_Int=ArrayCfg[Mq];Mq=Mq+1;
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray

