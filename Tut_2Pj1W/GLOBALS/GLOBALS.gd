extends Node

var V_ClsKeys:Cls_Globals_Keys=Cls_Globals_Keys.new();

var V_Player:CharacterBody3D;#Node;
var V_PlayerCamPoint:Node3D;

var V_CamFront:Camera3D;
var V_CamBack:Camera3D;

#Ruta Base de la aplicacion
@onready var V_Path_App:String="";
#Ruta Base Del perfil del jugador (DirPerfilWindows+MiPthGame)
@onready var V_Path_Perf:String="";
#Ruta Base de la carpeta de Datos (V_Path_App +"\Datos\")
@onready var V_Path_Datos:String="";
#Ruta completa del fichero Save1 (V_Path_Perf + "Save1.db");
@onready var V_Path_FileSave1:String="";
#Ruta completa del fichero Save1 (V_Path_Perf + "Save2.db");
@onready var V_Path_FileSave2:String="";
#Ruta completa del fichero Save1 (V_Path_Perf + "Save3.db");
@onready var V_Path_FileSave3:String="";
#Ruta completa del fichero Save1 (V_Path_Perf + "Save4.db");
@onready var V_Path_FileSave4:String="";


func F_PlayerSet(Player_Node):
	V_Player=Player_Node;
	
func F_PlayerCamPointSet(PlayerCam_N3D):
	V_PlayerCamPoint=PlayerCam_N3D;
	

var M_LogRama:int=0;
# MAcc genera=1 , comenta=2 o sale=0 de una rama
func F_log(MScn:String,MTxt:String,MAcc:int=2):
	var M_Rama:String="|- |- |- |- |- |- |- |- |- |- |- |- |- |- |- ";
	if(MAcc==1):M_LogRama=M_LogRama+1;
	M_Rama=M_Rama.substr(0,(M_LogRama*3));
	print(
		"["+
		str(Time.get_datetime_dict_from_system().hour) +":"+
		str(Time.get_datetime_dict_from_system().minute) +":"+
		str(Time.get_datetime_dict_from_system().second) +
		"]:"+
		M_Rama +
		"("+MScn+")."+
		MTxt
		);
	if(MAcc==0):M_LogRama=M_LogRama-1;
	if(M_LogRama<0):M_LogRama=0;
#END F_Log


func _ready():
	
	#V.V_Path_Datos=OS.get_user_data_dir()+"/"+"GAME1";
	V.V_Path_Datos=OS.get_data_dir()+"/"+"GAME1";
	F_log("<BASE>",V.V_Path_Datos,0);
	
	if (!DirAccess.dir_exists_absolute(V.V_Path_Datos)):
		F_log("<BASE>","APP_PTH_ADD:"+V.V_Path_Datos,0);
		DirAccess.make_dir_absolute(V.V_Path_Datos);
	#END IF Creo USER DIR
		
	if (DirAccess.dir_exists_absolute(V.V_Path_Datos)):
		F_log("<BASE>","APP_PTH_OK:"+V.V_Path_Datos,0);
		V_Path_FileSave1=V.V_Path_Datos+"/Save1.db";
		V_Path_FileSave2=V.V_Path_Datos+"/Save2.db";
		V_Path_FileSave3=V.V_Path_Datos+"/Save3.db";
		V_Path_FileSave4=V.V_Path_Datos+"/Save4.db";
		F_log("<BASE>","SAVES_PTH_OK:"+V.V_Path_FileSave1,0);
	else:
		get_tree().quit(69);
	#END IF ELSE USER DIR Creado/Existe
	
	#V.V_Path_App=ProjectSettings.get_setting("application/config/name");
	#V.V_Path_App=ProjectSettings.globalize_path("");
	
	#OS.get_executable_path(); #Retorna la ruta completa + el ejecutable
	F_log("<BASE>","PTH_APP:"+V.V_Path_App,0);
	#OS.get_executable_path().get_base_dir(); # Retorna solo la ruta sin el ultimo /
	V.V_Path_App=OS.get_executable_path().get_base_dir()+"/"; #.path_join("hello.txt")
	F_log("<BASE>","PTH_APP:"+V.V_Path_App,0);
	
#END _Ready


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit(0) # default behavior
