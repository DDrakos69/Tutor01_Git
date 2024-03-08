extends Node

class_name  CLS_GLOBALS_PLAYER
#Cls Globals CAB
# Se carga en GLOBALS
# No responde a eventos del motor solo son funciones de utilidad.
# Gestiona los datos de un jugador
# Los de las misiones y objetos se gestionan a parte.
# Aqui solo los propios del jugador.

func F_LogAdd(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,1);
func F_LogDel(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,0);
func F_LogCom(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,2);
func F_Log_(MTxt:String,MVisible:bool=true,MAcc:int=2):if(MVisible):V.F_log("ClsGbPlay",MTxt,MAcc);

@onready var V_Nombre:String="";# Nombre
@onready var V_Vida:int=-1;# Vida
@onready var V_PX:int=-1;# Experiencia
@onready var V_LV:int=-1;# Nivel
@onready var V_Monedas:int=-1;# Monedas
@onready var V_Fama1:int=-1;# Fama Enemigos 1
@onready var V_Fama2:int=-1;# Fama Enemigos 2
@onready var V_Fama3:int=-1;# Fama Enemigos 3
@onready var V_Fama4:int=-1;# Fama Enemigos 4
@onready var V_Fama5:int=-1;# Fama Enemigos 5
@onready var V_Fama6:int=-1;# Fama Enemigos 6
@onready var V_Fama7:int=-1;# Fama Enemigos 7
@onready var V_Fama8:int=-1;# Fama Enemigos 8
@onready var V_Fama9:int=-1;# Fama Enemigos 9


# Generamos un array con la confiracion del teclado para guardar en fichero.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	F_LogAdd("F_GetArray()>",M_LogVis);
	var M_T:Array=[];
	
	M_T.append(V_Nombre);
	M_T.append(V_Vida);
	M_T.append(V_PX);
	M_T.append(V_LV);
	M_T.append(V_Monedas);
	M_T.append(V_Fama1);
	M_T.append(V_Fama2);
	M_T.append(V_Fama3);
	M_T.append(V_Fama4);
	M_T.append(V_Fama5);
	M_T.append(V_Fama6);
	M_T.append(V_Fama7);
	M_T.append(V_Fama8);
	M_T.append(V_Fama9);
	
	F_LogCom("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()




#Analizamos el Array pasado de Keys y configuro las Acciones y sus eventos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	F_LogAdd("F_KeysSetArray()",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==6):
		V_Nombre=ArrayCfg[Mq];Mq=Mq+1;
		V_Vida=ArrayCfg[Mq];Mq=Mq+1;
		V_PX=ArrayCfg[Mq];Mq=Mq+1;
		V_LV=ArrayCfg[Mq];Mq=Mq+1;
		V_Monedas=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama1=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama2=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama3=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama4=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama5=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama6=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama7=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama8=ArrayCfg[Mq];Mq=Mq+1;
		V_Fama9=ArrayCfg[Mq];Mq=Mq+1;
		
	#END If Array
	F_LogDel("F_KeysSetArray()",M_LogVis); 
#END F_KeysSetArray




