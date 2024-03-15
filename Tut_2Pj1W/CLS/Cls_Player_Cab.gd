extends Node
class_name  Cls_Player_Cab

# Clase de Datos para la cabecera de los datos del player
# Se usa tanto para PJs como PNJs
# Se carga en Cls_Globals_Player y para los Saves en GLOBALS
# No responde a eventos solo es una clase de datos

var CLog:Cls_LogLine=Cls_LogLine.new("ClsPlayerCab");











enum eTipoPlayer {NoDefinido=0,Capitan=1,Armero=2,Ordenadores=3,Mecanica=4};

var V_Nombre:String;# Nombre
var V_Tipo:eTipoPlayer;
var V_NV:int;# Nivel
var V_Monedas:int;# Monedas
var V_PX:Cls_Player_Habilidad;



func _init():
	V_Nombre="";# Nombre
	V_Tipo=eTipoPlayer.NoDefinido;
	V_NV=0;# Nivel
	V_Monedas=0;# Monedas
	V_PX=Cls_Player_Habilidad.new();
#END _init()














# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	M_T.append(V_Nombre);
	M_T.append(V_Tipo);
	M_T.append(V_NV);
	M_T.append(V_Monedas);
	M_T.append(V_PX.F_GetArray());
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()















# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==5):
		V_Nombre=ArrayCfg[Mq];Mq=Mq+1;
		V_Tipo=ArrayCfg[Mq];Mq=Mq+1;
		V_NV=ArrayCfg[Mq];Mq=Mq+1;
		V_Monedas=ArrayCfg[Mq];Mq=Mq+1;
		V_PX.F_SetArray(ArrayCfg[Mq]);Mq=Mq+1;
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray

