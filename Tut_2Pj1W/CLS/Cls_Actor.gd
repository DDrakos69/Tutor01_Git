extends Node
class_name  Cls_Actor
var CLog:Cls_LogLine;

# - - - - Cls_Actor - - - 
# Contienen los datos propios para un Actor (Objeto o personaje).
# -ESTATICOS Se crean en el mapa
# -DINAMICO Se crea por otro objeto de forma dinamica.
# Un ACT incrementara ITEMS o/y Modifica estados de otros ACTORES.
# EJ: Interruptor,<pikarlo>,Muestra Texto,Incrementa ITEM <Nota Clave>
# EJ: Un Ordenador,<pikarlo>,Muestra Texto,Incrementa ITEM <Nota Clave>
# EJ: Un Cuerpo,<pikarlo>,Suena,Incrementa ITEMs <OREJA><PIEL><COBRE><CIRCUITO>
# Tambien se gestiona los objetos respaun.
# Tambien las tablas para reciclar y crear el item.
# Preparado para cargar y guardar desde fichero pero
# de momento lo cargo todo desde el exe.
# NT : Pendiente de crear lo de guardar y cargar 
# las tablas para Make/Recicle




# - - ENUM Tipos de Objetos
enum eTipos{
	Null,
	Puerta,Pared,Ventana,Suelo,Escalera,
	Tampilla,Contenedor,
	Tranpa,Mina1,Mina2,Mina3,
	PNJ1,PNJ2};


# ID unico Generado Cab+Num (Solo Lectura AutoGenerado)
var _BasID:String;
@export var V_BasID: String="":
	get:return _BasID;
	#set(value):_BasID = value;

# Nombre real del objeto creado en la escena en el _Ready
#Una vez creado no se puede modificar.
var _BasNodoName:String;
@export var V_BasNodoName:String:
	get:return _BasNodoName;


@export var V_BasDinamico:bool=false;# Se genero dinamicamente (NO FIJO)
@export var V_BasTipo:eTipos=eTipos.Null;
@export var V_BasSubTipo:int; # Sub tipo Id Ej: Escalera1=1 Escalera2=x Pared1=1 Pared2=X
@export var V_BasDesc:String;
#- - Stats
@export var V_BasOnOffSaveStats:bool;# Necesita Almacenar Estados.
@export var V_StatVida:int;#Vida actual
@export var V_StatTiempo:int;#Usado para granadas o trampas.
@export var V_StatVisible:bool;# Algunos tipos se pueden descarar.
@export var V_StatHabierto:bool;
@export var V_StatEstado:int;# No se para que . por si la necesito.
#- Pos
@export var V_BasOnOffSavePos:bool;# Necesita Almacenar Posicion y mapas
@export var V_PosMapaId:String; #(Solo si es Dinamico)
@export var V_PosX:int; #Posicion X (Solo si es Dinamico)
@export var V_PosY:int; #Posicion Y (Solo si es Dinamico)
@export var V_PosZ:int; #Posicion Y (Solo si es Dinamico)
@export var V_RotX:int; #Posicion X (Solo si es Dinamico)
@export var V_RotY:int; #Posicion Y (Solo si es Dinamico)
@export var V_RotZ:int; #Posicion Y (Solo si es Dinamico)

#- - Loteo
@export var V_BasOnOffSaveLot:bool;# Necesita Almacenar Loteo
@export var V_Lot:Array[Cls_IntInt];# Loteo (Esto son ITEMS.. )



func _init():
	CLog=Cls_LogLine.new("ClsObj");
#END _init()












# Obtenemos un array con los datos de la clase.
func F_GetArray()->Array:
	var M_LogVis:bool=false;
	#CLog.Add("F_GetArray",M_LogVis);
	var M_T:Array;
	M_T.append(V_BasID);
	M_T.append(F.Bool2Int(V_BasDinamico));
	M_T.append(V_BasTipo);
	M_T.append(V_BasNodoName);
	M_T.append(V_BasDesc);
	M_T.append(V_BasSubTipo);
	M_T.append(F.Bool2Int(V_BasOnOffSavePos));
	M_T.append(F.Bool2Int(V_BasOnOffSaveStats));
	M_T.append(F.Bool2Int(V_BasOnOffSaveLot));
	
	if(V_BasOnOffSavePos):
		M_T.append(V_PosMapaId);
		M_T.append(V_PosX);
		M_T.append(V_PosY);
		M_T.append(V_PosZ);
		M_T.append(V_RotX);
		M_T.append(V_RotY);
		M_T.append(V_RotZ);
	#END if Pos
	
	if(V_BasOnOffSaveStats):
		M_T.append(V_StatVida);
		M_T.append(V_StatTiempo);
		M_T.append(F.Bool2Int(V_StatVisible));
		M_T.append(F.Bool2Int(V_StatHabierto));
		M_T.append(V_StatEstado);

	#END if Stats
	if(V_BasOnOffSaveStats):
		var M_TLot:Array;
		for M_q in V_Lot.size():
			M_TLot.append(V_Lot[M_q].F_GetArray());
		#END For Loteo
		M_T.append(M_TLot);
	#END If Loteo
	
	CLog.Com("F_GetArray() Cels:"+str(M_T.size()),M_LogVis);
	return M_T;
#END F_KeysGetArray()









# Analizamos el Array y cojemos los datos del array a la clase tras analizarlos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	CLog.Add("F_SetArray",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==4):
		
		V_BasID=ArrayCfg[Mq];Mq=Mq+1;
		V_BasDinamico=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
		V_BasTipo=ArrayCfg[Mq];Mq=Mq+1;
		V_BasNodoName=ArrayCfg[Mq];Mq=Mq+1;
		V_BasDesc=ArrayCfg[Mq];Mq=Mq+1;
		V_BasSubTipo=ArrayCfg[Mq];Mq=Mq+1;
		V_BasOnOffSavePos=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
		V_BasOnOffSaveStats=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
		V_BasOnOffSaveLot=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
		
		if(V_BasOnOffSavePos):
			V_PosMapaId=ArrayCfg[Mq];Mq=Mq+1;
			V_PosX=ArrayCfg[Mq];Mq=Mq+1;
			V_PosY=ArrayCfg[Mq];Mq=Mq+1;
			V_PosZ=ArrayCfg[Mq];Mq=Mq+1;
			V_RotX=ArrayCfg[Mq];Mq=Mq+1;
			V_RotY=ArrayCfg[Mq];Mq=Mq+1;
			V_RotZ=ArrayCfg[Mq];Mq=Mq+1;
		#END if Pos
		
		if(V_BasOnOffSaveStats):
			V_StatVida=ArrayCfg[Mq];Mq=Mq+1;
			V_StatTiempo=ArrayCfg[Mq];Mq=Mq+1;
			V_StatVisible=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
			V_StatHabierto=F.Int2Bool(ArrayCfg[Mq]);Mq=Mq+1;
			V_StatEstado=ArrayCfg[Mq];Mq=Mq+1;
		#END if Stats
		
		if(V_BasOnOffSaveLot):
			var M_TLot:Array=ArrayCfg[Mq];Mq=Mq+1;
			var M_ClsIntInt:Cls_IntInt;
			for M_q in M_TLot.size():
				M_ClsIntInt=Cls_IntInt.new()
				M_ClsIntInt.F_SetArray(M_TLot[M_q]);
				V_Lot.append(Cls_IntInt);
			#END For Loteo
		#END If Loteo
		
	#END If Array Size
	CLog.Del("F_SetArray",M_LogVis); 
#END F_KeysSetArray






