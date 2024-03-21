extends Node
class_name  Cls_Objs
var CLog:Cls_LogLine;

# - - - - Cls_Objetos - - - 
# Esta clase contiene:
# - La lista de Objetos.
# - Las funciones propias para buscar , filtrar
#    Ordenar y demas funciones necesarias sobre los items.
# En caso de Creacion tiene los items necesarios 
# En caso de Destrozar tiene los items que da.


var V_Lista:Array[Cls_Obj];

func _init():
	CLog=Cls_LogLine.new("ClsObjs");
#END _init()











# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	for M_q in V_Lista.size():
		M_T.append(V_Lista[M_q].F_GetArray());
	#END For Rows
	CLog.Del("Res Add:"+str(V_Lista.size()),M_LogVis);
	return M_T;
#END F_KeysGetArray()














# Creamos un Objeto , le asignamos un ID unico y retornamos la clase
# Generada y lo añadimos a la tabla
func F_ADD_ByNode(MNodo3D:Node3D,MTipo:Cls_Obj.eTipos,
MDinamico:bool,MSubTipo:int,MDesc:String)->Cls_Obj:
	var M_Co:Cls_Obj=F_ADD_ByText(MNodo3D.name,MTipo,MDinamico,MSubTipo,MDesc);
	var M_LogOn:bool=true;
	if(M_Co!=null):
		M_Co.V_PosMapaId=MNodo3D.get_parent().name;
		M_Co.V_PosX=MNodo3D.global_position.x;
		M_Co.V_PosY=MNodo3D.global_position.y;
		M_Co.V_PosZ=MNodo3D.global_position.z;
		M_Co.V_RotX=MNodo3D.global_rotation.x;
		M_Co.V_RotY=MNodo3D.global_rotation.y;
		M_Co.V_RotZ=MNodo3D.global_rotation.z;
	return M_Co;
#END F_ADD_ByNode
	
	
	
	
	
	
	
	
	
	
	
	
	
	
# Creamos un Objeto , le asignamos un ID unico y retornamos la clase
# Generada y lo añadimos a la tabla
func F_ADD_ByText(MNodoName:String,MTipo:Cls_Obj.eTipos,
MDinamico:bool,MSubTipo:int,MDesc:String)->Cls_Obj:
	var M_LogOn:bool=true;
	var M_C:Cls_Obj;
	if(MNodoName.length()>0):
		if(F_BuscaNodo(MNodoName)!=null):
			CLog.Com("F_ADD()..ERR("+MNodoName+")rep",M_LogOn);
		else:
			M_C=Cls_Obj.new();
			M_C._BasID=F_ID_Get();
			M_C._BasNodoName=MNodoName;
			M_C.V_BasTipo=MTipo;
			M_C.V_BasDinamico=MDinamico;
			M_C.V_BasSubTipo=MSubTipo;
			M_C.V_BasDesc=MDesc;
			V_Lista.append(M_C);
			
			#M_C.V_Row=V_Lista.size()-1;
		#END If No Encontrado
	#END If Con Titulo
	return M_C;
#END F_Make











# - Buscamos un Item por su Titulo.
func F_BuscaNodo(MNodo:String)->Cls_Obj:
	var M_C:Cls_Obj=null;
	for M_q in V_Lista.size():
		if(V_Lista[M_q].V_BasNodoName==MNodo):
			M_C=V_Lista[M_q];
			break;
	return M_C;
#END F_BuscaTit










# - Buscamos un Item por su ID.
func F_BuscaId(M_Id:String)->Cls_Obj:
	var M_C:Cls_Obj=null;
	for M_q in V_Lista.size():
		if(V_Lista[M_q].V_ID==M_Id):
			M_C=V_Lista[M_q];
			break;
	return M_C;
#END F_BuscaTit







#Privada - Contador numero del item
var V_Max:int=-1;
#Creo el nombre de la siguiente Objeto (V_Bn="Obj"+"00020" y V_ItemNu++)
func F_ID_Get()->String:
	V_Max=V_Max+1;
	return "Obj"+str(V_Max);
#END F_Bn

















# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
