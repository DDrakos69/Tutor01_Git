extends Node
class_name  Cls_Player_Habilidad

# Clase de Datos para una habilidad.
# Se usa tanto para PJs como PNJs
# Se carga en Cls_Globals_Player
# No responde a eventos solo es una clase de datos

var CLog:Cls_LogLine=Cls_LogLine.new("ClsPlayerHabilidad");






# Basicas
enum eHabBasic{Vida=0,Belleza=1,Fuerza=2,Agilidad=3,Ego=4,Inteligencia=5,Carisma=6,Relaciones=7};
#Secundarias segun cada Basica 2=Fuerza
enum eHabSecun{
	Seduccion=10,B2=11,B3=12,B4=13,B5=14,B6=15,B7=16,B8=17,B9=18,B0=19,
	Espadas=20,Dagas=21,Latigos=22,Palos=23,F5=24,F6=25,F7=26,F8=27,F9=28,F0=29,
	Pistol=30,Fusil=31,Granadas=32,Minas=33,A5=34,A6=35,A7=36,A8=37,A9=38,A0=39,
	Persuasion=40,E2=41,E3=42,E4=43,E5=44,E6=45,E7=46,E8=47,E9=48,E0=49,
	Informatica=50,Seguridad=51,Documentacion=52,Lenguas=53,I5=54,I6=55,I7=56,I8=57,I9=58,I0=59,
	C1=60,C2=61,C3=62,C4=63,C5=64,C6=65,C7=66,C8=67,C9=68,C0=69,
	Terricolas=70,Droides=71,Blatodeos=72,Mercenarios=73,Marcianos=74,Miomorfos=75,R7=76,R8=77,R9=78,R0=79}




var V_Val:int=0;
var V_Max:int=0;
var V_Mod:int=0;#Si existe un modificador a la habilidad.
var V_ModSeg:int=0;#El tiempo en segundo que dura el modificador.
var V_ModGradual:bool=false;#Indica si el modificador se entra y sale a saco o es gradual









func _init():
	V_Val=0;
	V_Max=0;
	V_Mod=0;#Si existe un modificador a la habilidad.
	V_ModSeg=0;#El tiempo en segundo que dura el modificador.
	V_ModGradual=false;#Indica si el modificador se entra y sale a saco o es gradual
#END _init():










# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array=[];
	M_T.append(V_Val);
	M_T.append(V_Max);
	M_T.append(V_Mod);
	M_T.append(V_ModSeg);
	M_T.append(V_ModGradual);
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()












# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==5):
		V_Val=ArrayCfg[Mq];Mq=Mq+1;
		V_Max=ArrayCfg[Mq];Mq=Mq+1;
		V_Mod=ArrayCfg[Mq];Mq=Mq+1;
		V_ModSeg=ArrayCfg[Mq];Mq=Mq+1;
		V_ModGradual=ArrayCfg[Mq];Mq=Mq+1;
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray
