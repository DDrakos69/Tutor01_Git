extends Node
class_name  Cls_Item
var CLog:Cls_LogLine=Cls_LogLine.new("ClsItem");

# - - - - Cls_Item - - - 
# Contienen los datos propios para un item
# Tambien las tablas para reciclar y crear el item.
# Preparado para cargar y guardar desde fichero pero
# de momento lo cargo todo desde el exe.
# NT : Pendiente de crear lo de guardar y cargar 
# las tablas para Make/Recicle




# - - ENUM Tipos de Items
enum eTipos{
	Null,
	MatPrima,Pieza,
	ArmaBlan,ArmaFueg,
	RopaCabeza,RopaPeto,
	RopaBrazoDer,RopaBrazoIzq,
	RopaPierDer,RopaPierIzq,
	RopaCuello,RopaMano,RopaDedo,
	Comida,Pocion,
	Carta,Video,Audio
	}



# contendra la posicion en la tabla.
var V_Row:int=0;
# ID unico Generado Cab+Num
var V_ID:String;
# Tipo de objeto
var V_Tipo:eTipos=eTipos.Null;
# No se puede repetir. Forzada, Nombre corto que se traducira al final.
var V_Tit:String;
# No necesaria
var V_Des:String;
# No Necesaria usada para saber si se dropea por nivel
var V_Lv:int;
#Items y cantidad para Crear
var V_TMake:Array[Cls_StrInt];
#Items y cantidad para Reciclar
var V_TDell:Array[Cls_StrInt];




func _init():
	pass
#END _init()












# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	#NT: El Row es interna.
	M_T.append(V_ID);
	M_T.append(V_Tipo);
	M_T.append(V_Tit);
	M_T.append(V_Des);
	M_T.append(V_Lv);
	M_T.append(V_TMake);
	M_T.append(V_TDell);
	
	CLog.Del("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()











# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==4):
		#NT: El Row es interna.
		V_ID=ArrayCfg[Mq];Mq=Mq+1;
		V_Tipo=ArrayCfg[Mq];Mq=Mq+1;
		V_Tit=ArrayCfg[Mq];Mq=Mq+1;
		V_Des=ArrayCfg[Mq];Mq=Mq+1;
		V_Lv=ArrayCfg[Mq];Mq=Mq+1;
		V_TMake=ArrayCfg[Mq];Mq=Mq+1;
		V_TDell=ArrayCfg[Mq];Mq=Mq+1;
	#END If Array
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray


