extends Node
class_name  Cls_IntInt
var CLog:Cls_LogLine=Cls_LogLine.new("ClsIntInt");

# - - - - Cls Valor Valor - - - 
# Estructura de datos con Valor Valor
# Usado para crear o reciclar items.
# Indica que item se necesita o da y cuantos.
# De momento no guarda ni carga de fichero pero esta preparado.

var V_Int0:int=0;
var V_Int1:int=0;

func _init(M_Int0:int=0,M_Int1:int=0):
	V_Int0=M_Int0;
	V_Int1=M_Int1;
	pass
#END _init()







# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	M_T.append(V_Int0);
	M_T.append(V_Int1);
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()






# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==2):
		V_Int0=ArrayCfg[Mq];Mq=Mq+1;
		V_Int1=ArrayCfg[Mq];Mq=Mq+1;
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray

