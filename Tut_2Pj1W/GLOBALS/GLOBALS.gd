extends Node
#Globals.gb (G)


#Clase Fichero para el log generico.
var V_CLogFile:Cls_Log_File;
#(Usado para guardar el TXT log generado , optimizacion recursos)
var V_Log_Txt="";
var M_LogRama:int=0;
var CLog:Cls_LogLine;
# MAcc genera=1 , comenta=2 o sale=0 de una rama
func F_log(MScn:String,MTxt:String,MAcc:int=2):
	var M_Rama:String="|- |- |- |- |- |- |- |- |- |- |- |- |- |- |- ";
	if(MAcc==1):M_LogRama=M_LogRama+1;
	M_Rama=M_Rama.substr(0,(M_LogRama*3));
	V_Log_Txt="["+str(Time.get_datetime_dict_from_system().hour);
	V_Log_Txt+=":"+str(Time.get_datetime_dict_from_system().minute);
	V_Log_Txt+=":"+str(Time.get_datetime_dict_from_system().second);
	V_Log_Txt+="]:"+M_Rama+"<"+MScn+">."+MTxt;
	
	print(V_Log_Txt);
	if(V_CLogFile != null):V_CLogFile.F_Save2File(V_Log_Txt);
	
	if(MAcc==0):M_LogRama=M_LogRama-1;
	if(M_LogRama<0):M_LogRama=0;
#END F_Log







@onready var V_Player:CharacterBody3D;#Node;
@onready var V_PlayerCamPoint:Node3D;

@onready var V_CamFront:Camera3D;
@onready var V_CamBack:Camera3D;









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



# Datos de la cabecera del juego Actual
#NT: Player_Cab estan dentro de Game_Cab
@onready var V_ClsGame_Cab:Cls_Game_Cab=Cls_Game_Cab.new();

# Datos de las teclas configuradas (Se guardan por fichero Save)
@onready var V_ClsKeys:Cls_Keys=Cls_Keys.new();

# Datos de las partidas Guardadas.
# Las cargo desde siempre ya que tendria que entrar cada  vez que 
# carga la pantalla mejor cargar los datos basicos desde el inicio y
# actualizar segun se necesite.
@onready var V_ClsGameCab_Save1:Cls_Game_Cab=Cls_Game_Cab.new();
@onready var V_ClsGameCab_Save2:Cls_Game_Cab=Cls_Game_Cab.new();
@onready var V_ClsGameCab_Save3:Cls_Game_Cab=Cls_Game_Cab.new();
@onready var V_ClsGameCab_Save4:Cls_Game_Cab=Cls_Game_Cab.new();


# Datos de los MAPAS /BASES/NIVELES/ZONAS
@onready var V_ClsMapas:Cls_Mapas=Cls_Mapas.new();
@onready var V_ClsMapa_Sell:Cls_Mapas;#Mapa Selecionado.

# Clase controladora de los ficheros SAVE
var V_ClsGameFile:Cls_Game_File=Cls_Game_File.new();


# Clase controladora de los Items del juego. (Mochila, crafteo y farmeo)
var V_ClsItems:Cls_Items=Cls_Items.new();




# Clase Actores con los objetos o pnjs creados en el mundo.
# Tenemos los objetos estaticos en el juego y los generados
# dinamicamente un cofre, un respawn, o cualquier actor que 
# necesite mantener su estado en los saves.
# Se rellena al realizar el Ready de la escena.
# Las escenas se instancian todas pero se Descargan.
# Al Recargarlas se revisan añadieno los objetos dinamicos en el
# mapa que corresponda y modificando sus estados si procediese.
# Al crear el ACTOR le damos un nombre a los estaticos "ActSt_" y "ActDin_"
# por ejemplo para definir los que se guardan o no, y despues por tipos
# "ActDin_Sue001" para agrupar por tipo para acelerar las busquedas.
# Pendiente de crear una indexacion por nivel o algo.
# NT: El tipo Objeto lo define el nombre del nodo. SueloAxxx = Tipo Suelo etc
var V_ClsActores:Cls_Actores=Cls_Actores.new();




# Tabla de Habilidades  BASICAS(Por punto) para cada Player ()
# Estan las Hablididades COMPLEJAS(Por Valor) pero no se usan en este tipo de juego
var V_ClsHabil_Play1:Cls_Habilidades;
var V_ClsHabil_Play2:Cls_Habilidades;

# Cabecera de cada jugador con los datos basicos.
var V_ClsPlayerCab1:Cls_Player_Cab;
var V_ClsPlayerCab2:Cls_Player_Cab;


# Contienen los items que tienen en la bolsa los jugadores.
var V_ClsItemsPlayer1:Cls_Items=Cls_Items.new();
var V_ClsItemsPlayer2:Cls_Items=Cls_Items.new();






func F_PlayerSet(Player_Node):
	V_Player=Player_Node;
	



func F_PlayerCamPointSet(PlayerCam_N3D):
	V_PlayerCamPoint=PlayerCam_N3D;
	







# Iniciamos las variables y cargamos las DBS
func _init():
	var M_LogOn:bool=true;
	
	CLog=Cls_LogLine.new("G");
	F_log("BAS","_init",1);#Aqui aun no tengo instanciada CLog
	
	V_ClsGameFile=Cls_Game_File.new();
	# - - Creamos la tabla de los Objetos del juego (Armas Escudos etc)
	V_ClsActores=Cls_Actores.new();
	
	# - - Creamos la tabla de los Items del juego (Materiales,minerales etc.)
	V_ClsItems=Cls_Items.new();
	
	# - - Creamos las cabeceras de cada PLAYER
	V_ClsPlayerCab1=Cls_Player_Cab.new();
	V_ClsPlayerCab2=Cls_Player_Cab.new();
		
	# - - Creamos y configuramos las habilidades (Basicas)
	V_ClsHabil_Play1=Cls_Habilidades.new();
	V_ClsHabil_Play2=Cls_Habilidades.new();
	
	
	# - - Asocio Clases para la clase GameFile
	V_ClsGameFile.V_Ref_ClsGameCab=V_ClsGame_Cab;
	V_ClsGameFile.V_Ref_ClsKeys=V_ClsKeys;	
	V_ClsGameFile.V_Ref_ClsPlayer1Cab=V_ClsPlayerCab1;
	V_ClsGameFile.V_Ref_ClsPlayer2Cab=V_ClsPlayerCab2;	
	V_ClsGameFile.V_Ref_ClsHabP1=V_ClsHabil_Play1;
	V_ClsGameFile.V_Ref_ClsHabP2=V_ClsHabil_Play2;
	V_ClsGameFile.V_Ref_ClsItems=V_ClsItems;#Items de los jugadores.
	V_ClsGameFile.V_Ref_ClsActores=V_ClsActores;#Actores de los niveles
	
	
	F_log("BAS","_init",0)
#END _INIT














# - - - Evento de Notificaciones Estados devueltos por el juego.
func _notification(what):
	CLog.Com("Notifi:"+str(what));
	if(V_CLogFile!=null): V_CLogFile.F_FileClose();
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit(0) # default behavior
#END _Notification












func _ready():
	CLog.V_Visible=true;
	CLog.Add("_ready()");
	TranslationServer.set_locale("ES");
	
	
	#V.V_Path_Datos=OS.get_data_dir();#+"/"+"GAME1";
	V.V_Path_Datos=OS.get_user_data_dir();
	CLog.Com("<USER DATA DIR>");
	V.V_Path_Datos=V.V_Path_Datos+"/GAME1";
	CLog.Com("<PathDatos>"+V.V_Path_Datos);
	
	
	#Si el directorio no existe lo intento crear
	if (!DirAccess.dir_exists_absolute(V.V_Path_Datos)):
		CLog.Com("APP_PTH_ADD:"+V.V_Path_Datos);
		DirAccess.make_dir_absolute(V.V_Path_Datos);
	#END IF Creo USER DIR
	
	
	#Si SI lo he creado definos los ficheros save si no SALGO
	if (DirAccess.dir_exists_absolute(V.V_Path_Datos)):
		CLog.Com("APP_PTH_OK:"+V.V_Path_Datos);
		# Fichero para el log.
		V_CLogFile=Cls_Log_File.new(V.V_Path_Datos+"/Log.txt");
		V_CLogFile.V_On=true;
		# Ficheros Save
		V_Path_FileSave1=V.V_Path_Datos+"/Save1.db";
		V_Path_FileSave2=V.V_Path_Datos+"/Save2.db";
		V_Path_FileSave3=V.V_Path_Datos+"/Save3.db";
		V_Path_FileSave4=V.V_Path_Datos+"/Save4.db";
		CLog.Com("SAVES_PTH_OK:"+V.V_Path_FileSave1);
	else:
		get_tree().quit(69);#Codigo de error propio retornado por salida no normal
	#END IF ELSE USER DIR Creado/Existe
	
	#V.V_Path_App=ProjectSettings.get_setting("application/config/name");
	#V.V_Path_App=ProjectSettings.globalize_path("");
	
	#OS.get_executable_path(); #Retorna la ruta completa + el ejecutable
	CLog.Com("PTH_APP:"+V.V_Path_App);
	#OS.get_executable_path().get_base_dir(); # Retorna solo la ruta sin el ultimo /
	V.V_Path_App=OS.get_executable_path().get_base_dir()+"/"; #.path_join("hello.txt")
	CLog.Com("PTH_APP:"+V.V_Path_App);
	
	# - - - CARGAS - - - 
	# - - - CARGAS - - - 
	# - - - CARGAS - - - 
	
	# - - Cargamos el arbol de las habilidades basicas para cada PLAYER
	var M_Cdb_h:Cls_Habilidades_Db=Cls_Habilidades_Db.new();
	M_Cdb_h.F_MAKE(V_ClsHabil_Play1);
	M_Cdb_h.F_MAKE(V_ClsHabil_Play2);
	M_Cdb_h=null;
	CLog.Com("DB_Habilidades"+str(V_ClsHabil_Play1.V_Lista.size()));
	
	# Creamos los items del juego.
	# De momento la DB es interna en el EXE.
	var M_Cdb_i:Cls_Items_DB=Cls_Items_DB.new();
	M_Cdb_i.F_Make_Items(V_ClsItems);
	M_Cdb_i=null;
	CLog.Com("DB_Items"+str(V_ClsItems.V_Lista.size()));
	
	#Cargo la lista de BASES,NIVELES,ZONAS
	#De este modo una vez cargada la DB la clase contenedora se puede descargar.
	var M_Db:Cls_DbBases=Cls_DbBases.new();
	M_Db.F_DB_BasesCrea();
	M_Db=null;
	CLog.Com("DB_MAPS"+str(V_ClsMapas.V_Lista.size()));
	

	
	#Defino el teclado por defecto
	var m_TKeys:Array=[["ACT1_FRONT", 3, 87], ["ACT2_FRONT", -1],
	["ACT1_BACK", 3, 83], ["ACT2_BACK", -1], ["ACT1_LEFT", 3, 65],
	["ACT2_LEFT", -1], ["ACT1_RIGHT", 3, 68], ["ACT2_RIGHT", -1],
	["ACT1_JUMP", 3, 32], ["ACT2_JUMP", -1], ["ACT1_TOUCH", 3, 69],
	["ACT2_TOUCH", -1], ["ACT1_DOWN", 3, 67], ["ACT2_DOWN", -1],
	["ACT1_LIGHT", 3, 76], ["ACT2_LIGHT", -1], ["ACT1_RUN", 3, 4194325],
	["ACT2_RUN", -1], ["ACT1_MENU", 3, 81], ["ACT2_MENU", -1], 
	["ACT1_PUNCH1", 3, 82], ["ACT2_PUNCH1", -1], ["ACT1_PUNCH2", 3, 84],
	["ACT2_PUNCH2", -1], ["ACT1_PUNCH3", 3, 89], ["ACT2_PUNCH3", -1],
	["ACT1_PUNCH4", 3, 85], ["ACT2_PUNCH4", -1]];
	V_ClsKeys.F_SetArray(m_TKeys);
	CLog.Com("Default_Keys");
	
	
	
	
	# - - Testeo de los Saves.
	F_TEST_Files();


	
	CLog.Del("_ready()");
#END _Ready














# Todo el codigo para testear si se guardan bien los datos en los saves
func F_TEST_Files():
	CLog.Add("F_TEST_Files()");
	
	# - TEST - Carga de la carga OBJ Test
	F_TEST_SaveGame();
	
	# Reviso si carga bien los items de los players
	var M_TabItems1:Array[int]=V_ClsItems.V_ListaPlayer1.duplicate();
	var M_TabItems2:Array[int]=V_ClsItems.V_ListaPlayer2.duplicate();
	V_ClsItems.F_Player1_Clear();
	V_ClsItems.F_Player2_Clear();
	print("TEST ITEMS Play1 Clean... "+str((M_TabItems1!=V_ClsItems.V_ListaPlayer1)));
	print("TEST ITEMS Play2 Clean... "+str((M_TabItems2!=V_ClsItems.V_ListaPlayer2)));
	F_TEST_LoadGame();
	print("TEST ITEMS Play1 Load... "+str((M_TabItems1==V_ClsItems.V_ListaPlayer1)));
	print("TEST ITEMS Play2 Load... "+str((M_TabItems2==V_ClsItems.V_ListaPlayer2)));
	
	
	CLog.Del("F_TEST_Files()");
#END F_TEST_Files









# - - Testeo del Save Game - - - 
func F_TEST_SaveGame():
	CLog.Add("F_TEST_SaveGame()");
	# - - TESTE DE SAVE
	
	# - - Añado un ejemplo para el Bab
	V_ClsGame_Cab.V_IdBase=666;
	V_ClsGame_Cab.V_IdNivel=6;
	V_ClsGame_Cab.V_IdZona=69;
	V_ClsGame_Cab.V_Is2Player=true;
	
	# - - Añado items Basicos de testeo a Items
	var M_ClsItemsDb:Cls_Items_DB=Cls_Items_DB.new();
	V_ClsItems.V_Lista.clear();
	V_ClsItems.V_ListaPlayer1.clear();
	V_ClsItems.V_ListaPlayer2.clear();
	M_ClsItemsDb.F_Make_Items(V_ClsItems);
	M_ClsItemsDb.F_Make_Items_Test(V_ClsItems,500);
	M_ClsItemsDb=null;
	
	# - - Asocio Clases
	V_ClsGameFile.V_Ref_ClsGameCab=V_ClsGame_Cab;
	V_ClsGameFile.V_Ref_ClsKeys=V_ClsKeys;	
	V_ClsGameFile.V_Ref_ClsPlayer1Cab=V_ClsPlayerCab1;
	V_ClsGameFile.V_Ref_ClsPlayer2Cab=V_ClsPlayerCab2;	
	V_ClsGameFile.V_Ref_ClsHabP1=V_ClsHabil_Play1;
	V_ClsGameFile.V_Ref_ClsHabP2=V_ClsHabil_Play2;
	V_ClsGameFile.V_Ref_ClsItems=V_ClsItems;#Items de los jugadores.
	V_ClsGameFile.V_Ref_ClsActores=V_ClsActores;#Actores de los niveles
	
	V_ClsGameFile.F_SaveGame(V_Path_FileSave1,false);
	V_ClsGameFile.F_SaveGame(V_Path_FileSave2,true);
	
	CLog.Del("F_TEST_SaveGame()");
#END F_TEST_SaveGame













# - - Testeo del Load Game - - - 
func F_TEST_LoadGame():
	CLog.Add("F_TEST_LoadGame()");
	
	#V_ClsGameFiles.V_Ref_ClsObjs=V_ClsObjs;
	# - - Añado un ejemplo
	V_ClsGame_Cab.V_IdBase=0;
	V_ClsGame_Cab.V_IdNivel=0;
	V_ClsGame_Cab.V_IdZona=0;
	V_ClsGame_Cab.V_Is2Player=false;
	
	# - - Asocio Clases
	V_ClsGameFile.V_Ref_ClsGameCab=V_ClsGame_Cab;
	V_ClsGameFile.V_Ref_ClsKeys=V_ClsKeys;
	
	V_ClsGameFile.V_Ref_ClsPlayer1Cab=V_ClsPlayerCab1;
	V_ClsGameFile.V_Ref_ClsPlayer2Cab=V_ClsPlayerCab2;
	
	V_ClsGameFile.V_Ref_ClsHabP1=V_ClsHabil_Play1;
	V_ClsGameFile.V_Ref_ClsHabP2=V_ClsHabil_Play2;
	
	V_ClsGameFile.V_Ref_ClsItems=V_ClsItems;
	
	V_ClsGameFile.F_LoadGame(V_Path_FileSave1);
	
	CLog.Del("F_TEST_LoadGame()");
#END F_TEST_SaveGame











# - Creamos una buena cantidad de Actores para Testear el FileSave.
func F_TEST_ObjsCarga():
	var M_LogOn:bool=true;
	CLog.Add("F_TEST_ObjsCarga()",M_LogOn);
	var M_Act:Cls_Actor;
	var M_NmNodo:String="";
	var M_Max:int=10000;
	for M_q in M_Max:
		#- Intento añadir el control
		M_NmNodo="ScnMapB01/Suelos/SueloA"+str(M_q);
		M_Act=V_ClsActores.F_ADD_ByText(M_NmNodo,
		Cls_Actor.eTipos.Pared,true,22,"Desc");
		#- Si lo logro termino de meter datos
		if(M_Act==null):
			CLog.Com("F_TEST_ObjsCarga()..ERR("+M_NmNodo+")",M_LogOn);
		else:
			M_Act.V_BasNodoName="XXX";
			M_Act.V_BasDinamico=true;
			M_Act.V_BasDesc="";
			M_Act.V_BasSubTipo=1;
			M_Act.V_BasTipo=Cls_Actor.eTipos.Pared;
			M_Act.V_BasOnOffSavePos=true;
			M_Act.V_PosMapaId="ScnMapB01";
			M_Act.V_PosX=M_q*3;
			M_Act.V_PosY=M_q*2;
			M_Act.V_BasOnOffSaveStats=true;
			M_Act.V_StatEstado=22;
			M_Act.V_StatHabierto=true;
			M_Act.V_StatTiempo=(3*M_q);
			M_Act.V_StatVida=(4*M_q);
			M_Act.V_StatVisible=true;
		#END If M_c!=Null
	#END For Carga
	CLog.Del("F_TEST_ObjsCarga()..ADD("+str(M_Max)+")",M_LogOn);
#END F_OBJS_Carga









