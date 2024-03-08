extends Node
class_name  Cls_Mapas;

#Esta clase controla el ROW de un MAPA
#Usado tanto para BASE,NIVELES,ZONAS
#Es una clase de DATOS, 
#BASE A:Cls_Mapa
#	-NIVEL A1:Cls_Mapa
#	-NIVEL A2:Cls_Mapa
#		-ZONA A2A:Cls_Mapa
#		-ZONA A2B:Cls_Mapa
#		-ZONA A2C:Cls_Mapa
#	-NIVEL A3:Cls_Mapa
#		-ZONA A3A:Cls_Mapa
#		-ZONA A3B:Cls_Mapa

#NT: Los nombres de las BASES,NIVELES y ZONAS estan en el fichero de traducion.
@onready var V_Id:String="";#Codigo de la Base Contenedora
@onready var V_Desc:String="";#Descripcion corta
@onready var V_ZonaSave:bool=false;#Permite guardar partida
@onready var V_ZonaLucha:bool=false;#Permite Luchar
@onready var V_ZonaFabrica:bool=false;#Permite Fabricar

@onready var V_Lista:Array;#Array con las BASES/NIVELES/ZONAS segun el caso



func F_GetStr()->Array:
	pass;
#END F_GetStr

