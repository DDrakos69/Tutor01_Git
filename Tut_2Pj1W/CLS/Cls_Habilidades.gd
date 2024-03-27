extends Node
class_name  Cls_Habilidades
var CLog:Cls_LogLine;

# - - - - Cls_Habilidades - - - 
# Controla la lista de Habilidades con descripciones y demas
# Es un Array[Cls_Habilidad] Cada habilidad puede estar activa
# o no, y cada habilidad bloquea , visiblea y oculta otras 
# habilidades segun este o no ACTIVA.
# Para guardar las Habilidades de los usuarios es tan facil como
# Guardar el Array con las habilidades chekeadas (ACTIVAS) del jugador.
# Cada habilidad puede tener asociado un nodo o no un nodo.
# Pudiendo definir posicion y visibilidad sobre su nodo.

# Esta clase se encarga de Ejecutar las modificaciones 
# sobre otras habilidades y si queremos tambien modifica posicion y 
# visibilidad de sus nodos asociados.


var V_Lista:Array[Cls_Habilidad];




func _init():
	CLog=Cls_LogLine.new("ClsHabilidades");
#END _init()











# - Buscamos un Item por su Titulo.
func F_BuscaId(M_Id:String)->Cls_Habilidad:
	var M_C:Cls_Habilidad=null;
	for M_q in V_Lista.size():
		if(V_Lista[M_q].V_Id==M_Id):
			M_C=V_Lista[M_q];
			break;
	return M_C;
#END F_BuscaTit














# Obtenemos un array con los datos para guardar en el USUARIO
func F_File_PlayGetArray()->Array[bool]:
	var M_T:Array[bool]
	for M_q in V_Lista.size():
		M_T.append(V_Lista[M_q].V_Activo);
	#END For Habilidades
	return M_T;
#END F_File_PlayGetArray()













# Pasamos del Array del fichero a la Cfg interna
func F_File_PlayerSetArray(M_t:Array[bool])->bool:
	var M_Res:bool=false;
	if(M_t.size()==V_Lista.size()):
		for M_q in V_Lista.size():
			if(M_t[M_q]):F_Point_Set(V_Lista[M_q].V_ID);
		#END For Habilidade
		M_Res=true;
	#END If Tamaño Ok
	return M_Res;
#END F_File_PlayGetArray()






# Obtenemos el Array con el estado de las Hablididades.
func F_File_PlayerGetArray()->Array[bool]:
	var M_Res:Array[bool];
	for M_q in V_Lista.size():
		M_Res.append(V_Lista[M_q].V_Activo);
	#END For Habilidade
	return M_Res;
#END F_File_PlayGetArray()









# Resetea el estado de las habilidades a su Defalut
# El estado Actual sera el de su inical
# Todas Desactivadas.
func F_Reset():
	var M_Res:Array[bool];
	var M_c:Cls_Habilidad;
	for M_q in V_Lista.size():
		M_c=V_Lista[M_q];
		M_c.V_Visible_Actual=M_c.V_Visible_Inicial;
		M_c.V_Bloqueado_Actual=M_c.V_Bloqueado_Inicial;
		M_c.V_Activo=false;
		
	#END For Habilidades
#END F_Reset()








# - - Activamos una habilidad 
# y ejecutamos todos sus comandos Ocultar, Mostrar, Bloquear Etc
# OJO De momento no toca controles (NODOS) solo datos
# OJO el UnSet tendria que funcionar pero mejor si entra la clase Habilidades limpia.
func F_Point_Set(M_Id:String)->bool:
	var M_c:Cls_Habilidad=F_BuscaId(M_Id);
	var M_c1:Cls_Habilidad;
	var M_Res:bool=false;
	if(M_c!=null):
		M_c.V_Activo=true;
		# Mostramos IDs
		for M_q in M_c.V_Muestra_Ids.size():
			M_c1=F_BuscaId(M_c.V_Muestra_Ids[M_q]);
			if(M_c1!=null):M_c1.V_Visible=true;
		#END For Visibles
		# Bloqueamos IDs
		for M_q in M_c.V_Bloquea_Ids.size():
			M_c1=F_BuscaId(M_c.V_Bloquea_Ids[M_q]);
			if(M_c1!=null):M_c1.V_Bloqueado=true;
		#END For Bloquea
		# Ocultamos IDs
		for M_q in M_c.V_Oculta_Ids.size():
			M_c1=F_BuscaId(M_c.V_Oculta_Ids[M_q]);
			if(M_c1!=null):M_c1.V_Visible=false;
		#END For Ocultamos
		
	#END If Encontrada
	return M_Res
#END F_Point_Set












# - - Desactivamos una habilidad (Desace el Activar)
# y ejecutamos todos sus comandos (Inversos) Ocultar, Mostrar, Bloquear Etc
# OJO De momento no toca controles (NODOS) solo datos
func F_Point_UnSet(M_Id:String)->bool:
	var M_c:Cls_Habilidad=F_BuscaId(M_Id);
	var M_c1:Cls_Habilidad;
	var M_Res:bool=false;
	if(M_c!=null):
		M_c.V_Activo=false;
		# Mostramos IDs
		for M_q in M_c.V_Muestra_Ids.size():
			M_c1=F_BuscaId(M_c.V_Muestra_Ids[M_q]);
			if(M_c1!=null):M_c1.V_Visible=false;
		#END For Visibles
		# Bloqueamos IDs
		for M_q in M_c.V_Bloquea_Ids.size():
			M_c1=F_BuscaId(M_c.V_Bloquea_Ids[M_q]);
			if(M_c1!=null):M_c1.V_Bloqueado=true;
		#END For Bloquea
		# Ocultamos IDs
		for M_q in M_c.V_Oculta_Ids.size():
			M_c1=F_BuscaId(M_c.V_Oculta_Ids[M_q]);
			if(M_c1!=null):M_c1.V_Visible=false;
		#END For Ocultamos
		
	#END If Encontrada
	return M_Res
#END F_Point_Set



