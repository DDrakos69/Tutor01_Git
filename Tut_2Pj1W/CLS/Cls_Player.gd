extends Node

class_name  Cls_Player

# Cls_Globals_Player
# Se carga en GLOBALS
# Gestiona los datos de un jugador
# Los de las misiones y objetos se gestionan a parte.
# Aqui solo los propios del jugador.

var CLog:Cls_LogLine=Cls_LogLine.new("ClsPlayer");


#NT: El Player Bab esta en el Game Cab ya que se usa para los ficheros Save
# Como se usa para la cabecera de los ficheros sabe y para no duplicar esan en GameCab
# Pendiente de meter aqui una referencia pero no se "puede ser confuso."

@onready var V_TabClsHabilBas:Array[Cls_Player_Habilidad];#Habilidades Basicas
@onready var V_TabClsHabilSec:Array[Cls_Player_Habilidad];#Habilidades Secundarias









func _init():
	var V_Log:bool=false;
	CLog.F_Add("_init()");
	
	#Creo tantas rows en la tabla como habilidades basicas tengo en Enum (8)
	CLog.Com(" BasSize:"+str(Cls_Player_Habilidad.eHabBasic.size()));
	for M_q in Cls_Player_Habilidad.eHabBasic.size():
		V_TabClsHabilBas.append(Cls_Player_Habilidad.new());
		CLog.Com(str(M_q)+
		" K:"+str(Cls_Player_Habilidad.eHabSecun.keys()[M_q])+
		" V:"+str(Cls_Player_Habilidad.eHabSecun.values()[M_q]),V_Log);
	#END For Basicas
	
	#Creo tantas rows en la tabla como habilidades Secundarias tengo en Enum (70)
	CLog.Com(" SecSize:"+str(Cls_Player_Habilidad.eHabSecun.size()));
	for M_q in Cls_Player_Habilidad.eHabSecun.size():
		V_TabClsHabilSec.append(Cls_Player_Habilidad.new());
		CLog.Com(str(M_q)+
		" K:"+str(Cls_Player_Habilidad.eHabSecun.keys()[M_q])+
		" V:"+str(Cls_Player_Habilidad.eHabSecun.values()[M_q]),V_Log);
	#END For Basicas
	CLog.Del("_init()");
#END _Init













# Generamos un array con la confiracion del teclado para guardar en fichero.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray()>",M_LogVis);
	var M_T:Array;
	
	#Creo tantas rows en la tabla como habilidades basicas tengo en Enum
	for M_q in Cls_Player_Habilidad.eHabBasic:
		M_T.append(V_TabClsHabilBas[M_q].F_GetArray() );
		CLog.Com(str(M_q)+" B:"+str(M_T[M_q]));
	#END For Basicas
	
	#Creo tantas rows en la tabla como habilidades Secundarias tengo en Enum
	for M_q in Cls_Player_Habilidad.eHabSecun:
		M_T.append(V_TabClsHabilSec[M_q].F_GetArray() );
		CLog.Com(str(M_q)+" S:"+str(M_T[M_q]));
	#END For Basicas
	
	CLog.Del("F_GetArray()>",M_LogVis);
	return M_T;
#END F_KeysGetArray()











#Analizamos el Array pasado de Keys y configuro las Acciones y sus eventos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray()>",M_LogVis);
	var M_ClsHabil:Cls_Player_Habilidad;
	var M_Row=0;
	
	# Limpiamos las tablas
	V_TabClsHabilBas.clear();
	V_TabClsHabilSec.clear();

	#Reviso que el tamaño del array pasado sea igual a las habilidades del juego
	if(ArrayCfg.size()==(Cls_Player_Habilidad.eHabBasic.size()+Cls_Player_Habilidad.eHabSecun.size())):
		
		#Cargo las Basicas
		for M_q in Cls_Player_Habilidad.eHabBasic:
			M_ClsHabil=Cls_Player_Habilidad.new();
			M_ClsHabil.F_SetArray(ArrayCfg[M_Row]);
			M_Row+=1;
			V_TabClsHabilBas.append(M_ClsHabil);
			CLog.Com(str(M_Row)+" B:"+str(M_ClsHabil));
		#END For Basicas
	
		#Cargo las Secundarias
		for M_q in Cls_Player_Habilidad.eHabBasic:
			M_ClsHabil=Cls_Player_Habilidad.new();
			M_ClsHabil.F_SetArray(ArrayCfg[M_Row]);
			M_Row+=1;
			V_TabClsHabilSec.append(M_ClsHabil);
			CLog.Com(str(M_Row)+" S:"+str(M_ClsHabil));
		#END For Basicas
	
	CLog.Del("F_SetArray()>",M_LogVis);
	#END F_SetArray




