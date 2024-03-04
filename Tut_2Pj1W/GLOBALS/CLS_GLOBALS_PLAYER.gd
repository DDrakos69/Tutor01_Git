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



@onready var V_Vida:int=-1;# Vida
@onready var V_PX:int=-1;# Experiencia
@onready var V_LV:int=-1;# Nivel


