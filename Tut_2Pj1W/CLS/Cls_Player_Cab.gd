extends Node
class_name  Cls_Player_Cab
var CLog:Cls_LogLine=Cls_LogLine.new("ClsPlayerCab");


# Clase de Datos para la cabecera de los datos del player
# Se usa tanto para PJs como PNJs
# Se carga en Cls_Globals_Player y para los Saves en GLOBALS
# No responde a eventos solo es una clase de datos


enum eTipoPlayer {Capitan=0,Artillero=1,Asesino=2,Mecanica=3};

var V_Nombre:String;# Nombre
var V_Tipo:eTipoPlayer;
var V_EsChica:bool;
var V_Nv:int;# Nivel
var V_Monedas:int;# Monedas
var V_Px:int;#Puntos de Experiencia
var V_Vida:int;#Puntos de Vida Actual
var V_Resis:int;#Puntos de Resisencia
var V_Heridas:int;#Las heridas te quitan vida cada X.Se curan a parte

var V_CuerCrit:int;#Posibilidad de critico.
var V_CuerCritDamage:int;#Incremento del daño fisico
var V_CuerChance;#Posibilidad de dar cuerpo a cuerpo

var V_DistCrit:int;#Posibilidad del critico a distancia.
var V_DistCritDamage:int;#Incremento del Daño del critico a distancia
var V_DistChance:int;#Posibilidad de dar a distancia

var V_VidaMax:int;#Puntos de Vida Maxima
var V_ResisMax:int;#Puntos de Resistencia  Maxima



func _init():
	V_Nombre="";# Nombre
	V_Tipo=eTipoPlayer.Capitan;
	V_EsChica=false;
	V_Nv=0;# Nivel
	V_Monedas=0;# Monedas
	V_Px=0;# Cls_Player_Talentos.new();
	V_Vida=100;
	V_Resis=100;
	V_Heridas=0;
	
	V_CuerCrit=10;
	V_CuerCritDamage=10;
	V_CuerChance=60;
	V_DistCrit=10;
	V_DistCritDamage=10;
	V_DistChance=30;
	V_VidaMax=100;
	V_ResisMax=100;
#END _init()














# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=false;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	M_T.append(V_Nombre);
	M_T.append(V_Tipo);
	M_T.append(F.Bool2Int(V_EsChica));
	M_T.append(V_Nv);
	M_T.append(V_Monedas);
	M_T.append(V_Px);# V_PX.F_GetArray());
	M_T.append(V_Vida);
	M_T.append(V_Resis);
	M_T.append(V_Heridas);
	
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()















# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=false;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==5):
		V_Nombre=ArrayCfg[Mq];Mq=Mq+1;
		V_Tipo=ArrayCfg[Mq];Mq=Mq+1;
		V_EsChica=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
		V_Nv=ArrayCfg[Mq];Mq=Mq+1;
		V_Monedas=ArrayCfg[Mq];Mq=Mq+1;
		V_Px=ArrayCfg[Mq];Mq=Mq+1;#.F_SetArray(ArrayCfg[Mq]);Mq=Mq+1;
		V_Vida=ArrayCfg[Mq];Mq=Mq+1;
		V_Resis=ArrayCfg[Mq];Mq=Mq+1;
		V_Heridas=ArrayCfg[Mq];Mq=Mq+1;
		

	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray

