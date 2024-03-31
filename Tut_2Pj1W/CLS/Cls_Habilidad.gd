extends Node
class_name  Cls_Habilidad
var CLog:Cls_LogLine=Cls_LogLine.new("ClsHabilidad");

# - - - - Cls_Habilidad - - - 
# Contienen los datos propios para una Habilidad
# Controla los datos de una Habilidad
# Nombre , Descripcion, PX necesarios, Si esta activa,
# Si depende de otra, y del nivel de la otra.
# Nivel actual de esta.
# Preparado para cargar y guardar desde fichero pero
# de momento lo cargo todo desde el exe.
# La lista se configura a tiempo real.
# - En el caso de una habilidad con muchos 3 puntos.
#   El nombre de la habilidad seria igual.
#   La descripcion puede o no variar.
#   Se ocultarian las de los puntos 1 y 2 y queda la del 3 
#   Podrian o no ocupar la pisma posicion.
#   Se bloquearian todos los anteriores.
#   Si se Desselecionarlo se DesBloquearian V_Bloquea_Ids
#   Si se Seleciona se Bloqearian V_Bloquea_Ids 









# ROW (Posicion que ocupa en el ARRAY, Auto Generado.)
var V_ROW:int;
# ID (Manual y Unico)
var V_ID:String;
# Activo (Si el jugador ha cogido este punto.)
var V_Activo:bool;
# Si es visible en pantalla o no
var V_Visible_Actual:bool;
# El visible puede variar , Esta es el Visible inicial, para el Reset.
# Unas modifican el Visible Actual pero Este no se toca asi guarda su estado.
var V_Visible_Inicial:bool;
# Si esta bloqueado a modificaciones
var V_Bloqueado_Actual:bool;
# Al igual que en Bloqueado este se guarda y no se toca desde el inicio para el RESET
var V_Bloqueado_Inicial:bool;
# Nombre Corto
var V_Nom:String;
# Descripcion
var V_Desc:String;
# Padre ID
var V_Padre_ID:String;
# Bloquea ID (Si bloquea algun nodo al tener un punto.)
var V_Bloq_Ids:Array[String];
# Bloquea ID (Si bloquea algun nodo al tener un punto.)
var V_DesBloq_Ids:Array[String];
# Visiblea ID (Si esta activo este punto pone en visible estos nodos)
var V_Mostrar_Ids:Array[String];
# Oculta ID (Si esta activo este punto pone en visible estos nodos)
var V_Ocultar_Ids:Array[String];

# Posicion X e Y
var V_X:int;
var V_Y:int;
# Nodo Asociado.
var V_Node:Node2D;
# Indica que se tienen que refrescar 
#por que ha sido modificado algon dato
var V_NeedUpdate:bool;










func _init():
	V_ROW=-1;
	V_ID="";
	V_Activo=false;
	V_Visible_Actual=true;
	V_Visible_Inicial=true;
	V_Bloqueado_Actual=false;
	V_Bloqueado_Inicial=false;
	V_Nom="";
	V_Desc="";
	V_Padre_ID="";
	V_Bloq_Ids=[];
	V_DesBloq_Ids=[];
	V_Mostrar_Ids=[];
	V_Ocultar_Ids=[];
	V_X=0;
	V_Y=0;
	V_Node=null;
	V_NeedUpdate=true;
#END _init()











# Obtenemos un array con TODOS los datos de la clase.
# Este se usara para guardar en fichero el Arbol de Hablidiades
# NO el estado actual.
func F_GetArray_All()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArrayAll",M_LogVis);
	var M_T:Array;
	var M_T1:Array[String];
	
	# El ROW no se guarda ya que se genera Al Configurar la Clase.
	M_T.append(V_ID);# ID (Manual y Unico)
	M_T.append(F.Bool2Int(V_Activo));# Activo (Si permite definir.)
	M_T.append(F.Bool2Int(V_Visible_Inicial));# Si es visible en pantalla o no
	M_T.append(F.Bool2Int(V_Bloqueado_Inicial));# Si esta bloqueado o no
	M_T.append(V_Nom);# Nombre Corto
	M_T.append(V_Desc);# Descripcion
	M_T.append(V_Padre_ID);# Padre ID
	# Bloquea ID (Si bloquea algun nodo al tener un punto.)
	M_T1.clear();
	for M_q in V_Bloq_Ids.size():
		M_T1.append(V_Bloq_Ids[M_q]);
	M_T.append(M_T1);
	# Des Bloquea ID (Si Desbloquea algun nodo al tener un punto.)
	M_T1.clear();
	for M_q in V_DesBloq_Ids.size():
		M_T1.append(V_DesBloq_Ids[M_q]);
	M_T.append(M_T1);
	# Visiblea ID (Si esta activo este punto pone en visible estos nodos)
	M_T1.clear();
	for M_q in V_Mostrar_Ids.size():
		M_T1.append(V_Mostrar_Ids[M_q]);
	M_T.append(M_T1);
	# Oculta ID (Si esta activo este punto pone en visible estos nodos)
	M_T1.clear();
	for M_q in V_Ocultar_Ids.size():
		M_T1.append(V_Ocultar_Ids[M_q]);
	M_T.append(M_T1);# Nombre Corto
	
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()












# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray_All(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArrayAll",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==10):
		
		V_ID=ArrayCfg[Mq];Mq=Mq+1;# ID (Manual y Unico)
		V_Activo=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;# Activo (Si permite definir.)
		V_Visible_Inicial=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;# Si es visible en pantalla o no
		V_Bloqueado_Inicial=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;# Si esta bloqueado o no
		V_Nom=ArrayCfg[Mq];Mq=Mq+1;# Nombre Corto
		V_Desc=ArrayCfg[Mq];Mq=Mq+1;# Descripcion
		V_Padre_ID=ArrayCfg[Mq];Mq=Mq+1;# Padre ID
		
		V_Bloq_Ids=ArrayCfg[Mq];Mq=Mq+1;# des Bloquea ID (Si bloquea algun nodo al tener un punto.)
		V_DesBloq_Ids=ArrayCfg[Mq];Mq=Mq+1;# Bloquea ID (Si bloquea algun nodo al tener un punto.)
		V_Mostrar_Ids=ArrayCfg[Mq];Mq=Mq+1;# Visiblea ID (Si esta activo este punto pone en visible estos nodos)
		V_Ocultar_Ids=ArrayCfg[Mq];Mq=Mq+1;# Oculta ID (Si esta activo este punto pone en visible estos nodos)
		
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray



