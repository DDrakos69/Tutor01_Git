extends Node

class_name  Cls_DbBases;

var V_Bn:String;#Nombre Base
var V_Bi:int=-1;#Id Base
#Creo el nombre de la siguiente base(V_Bn="Bas"+"020" y Bi++)
func F_Bn()->String:
	V_Bi=V_Bi+1;
	return "Bas%3"%V_Bi;
#END F_Bn
	
var V_Nn:String;#Nombre Nivel
var V_Ni:int=-1;#Id Nivel
#Creo el nombre de la siguiente Nivel(V_Nn="Nv"+"020" y Ni++)
func F_Nn()->String:
	V_Ni=V_Ni+1;
	return "Nv%3"%V_Ni;
#END F_Bn

var V_Zn:String;#Nombre Zona
var V_Zi:int=-1;#Id Zona
#Creo el nombre de la siguiente Zona(V_Zn="Zn"+"020" y Zi++)
func F_Zn()->String:
	V_Zi=V_Zi+1;
	return "Zn%3"%V_Zi;
#END F_Bn


	
	
	
	
func F_DB_BasesCrea():
	var M_Base:Cls_Mapas=V.V_Bases;
	var M_CBase:Cls_Mapas;
	var M_CNivel:Cls_Mapas;
	var M_CZona:Cls_Mapas;
	#NT Genera ids dinamocos una vez usada y cerada 
	#no modificar su posicion
	
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"MiNave",false,false,false);
	
	M_CNivel=F_MapaAdd(M_CBase,F_Nn(),"Culo Nave",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Combustible",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Gemerador",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Motor Luz",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Motor SubLuz",false,false,false);
	
	M_CNivel=F_MapaAdd(M_CBase,F_Nn(),"Centro Nabe",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Escalera",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Ordenador",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Informes",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Misiones",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Tesoros",false,false,false);
	
	M_CNivel=F_MapaAdd(M_CBase,F_Nn(),"Almacen Nave",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Armas",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Recurso",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Especimenes",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Piezas",false,false,false);
	
	M_CNivel=F_MapaAdd(M_CBase,F_Nn(),"Cabina Nave",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Escaner",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Sensores",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Saltos",false,false,false);
	
	M_CNivel=F_MapaAdd(M_CBase,F_Nn(),"Techo Nave",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Escalera",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Escaner",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Sensores",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Saltos",false,false,false);

	M_CNivel=F_MapaAdd(M_CBase,F_Nn(),"Barria Nave",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Escalera",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Esclusa",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Depurador Agua",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Depurador Oxino",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Residuos",false,false,false);
	M_CZona=F_MapaAdd(M_CNivel,F_Nn(),"Cuarto Aterrizaje A",false,false,false);
	
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Tierra Central",false,false,false);
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Tierra Silo",false,false,false);
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Tierra Laboratorio",false,false,false);
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Tierra Bajo Mar",false,false,false);
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Carcel 1",false,false,false);
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Carcel 2",false,false,false);
	#Base
	M_CBase=F_MapaAdd(M_Base,F_Bn(),"Carcel 3",false,false,false);
#END F_DB_BasesCrea





#@onready var V_Id:String="";#Codigo de la Base Contenedora
#@onready var V_Desc:String="";#Descripcion corta
#@onready var V_ZonaSave:bool=false;#Permite guardar partida
#@onready var V_ZonaLucha:bool=false;#Permite Luchar
#@onready var V_ZonaFabrica:bool=false;#Permite Fabricar
func F_MapaAdd(MCls:Cls_Mapas,MId:String,MDesc:String,
MIsSave:bool,MIsLucha:bool,MIsFabrica:bool)->Cls_Mapas:
	var M_Cls:Cls_Mapas=Cls_Mapas.new();
	M_Cls.V_Id=MId;
	M_Cls.V_Desc=MDesc;
	M_Cls.V_ZonaFabrica=MIsFabrica;
	M_Cls.V_ZonaLucha=MIsLucha;
	M_Cls.V_ZonaSave=MIsSave;
	MCls.V_Lista.append(M_Cls);
	return M_Cls;
#END F_ZonaAdd
