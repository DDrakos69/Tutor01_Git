extends Node
class_name  Cls_Items
var CLog:Cls_LogLine;

# - - - - Cls_Items - - - 
# Esta clase contiene:
# - La lista de items.
# - Las funciones propias para buscar , filtrar
#    Ordenar y demas funciones necesarias sobre los items.
# En caso de Creacion tiene los items necesarios 
# En caso de Destrozar tiene los items que da.
var V_Lista:Array[Cls_Item];

# Tambien tiene la lista de los items de los players.
# y las funciones de guardar ordenar añadir etc.
var V_ListaPlayer1:Array[Cls_StrInt];
var V_ListaPlayer2:Array[Cls_StrInt];




func _init():
	CLog=Cls_LogLine.new("ClsItems");
#END _init()




func F_Play1GetPosItemId(M_Id:String)->int:
	var M_Res:int=-1;
	for M_q in V_ListaPlayer1.size():
		if(V_ListaPlayer1[M_q].V_Str==M_Id):
			M_Res=M_q;
			break;
	return M_Res;
#END F_Play1GetPosItemId;

func F_Play2GetPosItemId(M_Id:String)->int:
	var M_Res:int=-1;
	for M_q in V_ListaPlayer2.size():
		if(V_ListaPlayer2[M_q].V_Str==M_Id):
			M_Res=M_q;
			break;
	return M_Res;
#END F_Play2GetPosItemId;


# Creamos un Item , le asignamos un ID unico y retornamos la clase
# Generada y lo añadimos a la tabla
func F_ADD(M_Tit:String,M_Des:String,M_Lv:int)->Cls_Item:
	var V_Log:bool=false;
	CLog.Add("F_ADD("+M_Tit+")",V_Log);
	var M_C:Cls_Item;
	if(M_Tit.length()>0):
		if(F_BuscaTit(M_Tit)==null):
			CLog.Com("NoRep",V_Log);
			M_C=Cls_Item.new();
			
			M_C.V_ID=F_ID_Get();
			M_C.V_Tit=M_Tit;
			M_C.V_Des=M_Des;
			M_C.V_Lv=M_Lv;
			V_Lista.append(M_C);
			M_C.V_Row=V_Lista.size()-1;
		#END If No Encontrado
	#END If Con Titulo
	CLog.Del("F_ADD()",V_Log);
	return M_C;
#END F_Make







# - Buscamos un Item por su Titulo.
func F_BuscaTit(M_Tit:String)->Cls_Item:
	var M_C:Cls_Item=null;
	for M_q in V_Lista.size():
		if(V_Lista[M_q].V_Tit==M_Tit):
			M_C=V_Lista[M_q];
			break;
	return M_C;
#END F_BuscaTit






# - Buscamos un Item por su ID.
func F_BuscaId(M_Id:String)->Cls_Item:
	var M_C:Cls_Item=null;
	for M_q in V_Lista.size():
		if(V_Lista[M_q].V_ID==M_Id):
			M_C=V_Lista[M_q];
			break;
	return M_C;
#END F_BuscaTit




func F_GetPosItemId(M_Id:String)->int:
	var M_Res:int=-1;
	for M_q in V_Lista.size():
		if(V_Lista[M_q].V_Str==M_Id):
			M_Res=M_q;
			break;
	return M_Res;
#END F_GetPosItemId;











#Privada - Contador numero del item
var V_Max:int=-1;
#Creo el nombre de la siguiente item (V_Bn="Itm"+"00020" y V_ItemNu++)
func F_ID_Get()->String:
	V_Max=V_Max+1;
	return "Itm"+str(V_Max);
#END F_Bn












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



