extends Node
class_name  Cls_Game_File
#Esta clase tiene las funciones basicas para guardar
#una partida en un fichero dado.
#Usa Referencias de las clases que quieres guardar o cargar.
# Se establece la relacion y luego se ejecuta la funcion.

# Clase para realiza un log.
var CLog:Cls_LogLine=Cls_LogLine.new("ClsGameFile");

# Clase para cifrar los ficheros.
var V_ClsCrypto:Cls_Crypt;





#No crea clases, son referencias a las clases principales.

# Datos de la partida, nivel,fase,dificultad etc.
var V_Ref_ClsGameCab:Cls_Game_Cab;
# Configuracion del teclado
var V_Ref_ClsKeys:Cls_Keys;
# Los actores son los objetos que se cargan en el nivel y su estado.
var V_Ref_ClsActores:Cls_Actores;
# Items que tiene el player en su inventario.
# La clas eItems tiene dentro los items de cada player
var V_Ref_ClsItems:Cls_Items;
# Habilidades selecionadas del Player
var V_Ref_ClsHabP1:Cls_Habilidades;
var V_Ref_ClsHabP2:Cls_Habilidades;
# Cabecera del estado de cada Player
var V_Ref_ClsPlayer1Cab:Cls_Player_Cab;
var V_Ref_ClsPlayer2Cab:Cls_Player_Cab;










# Constructor
func _init():
	CLog.Add("_Init()");
	V_ClsCrypto=Cls_Crypt.new();
	CLog.Del("_Init()");
#END _ini








# Guardo las tablas en el fichero Cifrando y JSONeando las tablas a texto
func F_SaveGame(M_FileName:String,M_Cifrado:bool=false):
	var V_Log:bool=true;
	CLog.Add("F_SabeGame("+M_FileName+")",V_Log);
	# Genero la tabla que unifica todos los datos
	var M_t:Array;
	M_t.append(V_Ref_ClsGameCab.F_GetArray());
	M_t.append(V_Ref_ClsKeys.F_GetArray());
	
	M_t.append(V_Ref_ClsPlayer1Cab.F_GetArray());
	M_t.append(V_Ref_ClsPlayer2Cab.F_GetArray());
	
	M_t.append(V_Ref_ClsHabP1.F_File_PlayerGetArray());
	M_t.append(V_Ref_ClsHabP2.F_File_PlayerGetArray());
	
	M_t.append(V_Ref_ClsItems.V_ListaPlayer1);
	M_t.append(V_Ref_ClsItems.V_ListaPlayer2);
	
	# Estado de las misiones / decisiones / Estados
	
	M_t.append(V_Ref_ClsActores.F_GetArray());
	
	# Borro el fichero si existe.
	DirAccess.remove_absolute(M_FileName);
	var M_File = FileAccess.open(M_FileName,FileAccess.WRITE);
	
	# Paso la tabla a formato JSON
	var M_Str:String=JSON.stringify(M_t);
	
	# Cifro la cadena JSoneada
	if (M_Cifrado): M_Str=V_ClsCrypto.F_Cifra(M_Str);
	
	# Guardo el fichero
	M_File.store_string(M_Str);
	
	# Guardo Buffer, Cierro y Libero
	M_File.flush();
	M_File.close();
	M_File = null;
	
	#--- Reviso que el cifrado funcione.
	#var M_Str0:String=M_Str;
	#print("BAS:"+M_Str0,V_Log);
	#print(" - - - - - ");
	#var M_Str1:String=V_ClsCrypto.F_Cifra(M_Str0);
	#print("CIF:"+M_Str1,V_Log);
	#print(" - - - - - ");
	#var M_Str2:String=V_ClsCrypto.F_DesCifra(M_Str1)
	#print("DCIF:"+M_Str2,V_Log);
	#var M_p:int=0;
	#if(M_Str0!=M_Str2):
		#for M_q in M_Str0.length():
			#if(str(M_Str0[M_p])!=str(M_Str2[M_p])):
				#print("P:"+str(M_p)+" X:" +str(M_Str0[M_p]));
			#M_p+=1;
	##END if Alguna diferencia.
	#--- Revision del cifrado
	
	CLog.Del("F_SabeGame("+M_FileName+")",V_Log);
#END F_SaveGame










# Cargo un fichero y destripo con JSON las tablas de datos (Descifra)
func F_LoadGame(M_FileName:String,M_Cifrado:bool=false):
	var M_Log:bool=true;
	var M_Pos:int=0;
	CLog.Add("F_LoadGame("+M_FileName+")",M_Log);
	if(FileAccess.file_exists(M_FileName)):
		var M_t:Array;
		var M_File =  FileAccess.open(M_FileName,FileAccess.READ);
		# Cargo todo el texto del fichero
		var M_Str = M_File.get_as_text();
		
		# Cierro y libero el fichero
		M_File.close();
		M_File=null;
		
		# Descifro el texto cargado.
		if (M_Cifrado): M_Str=F.DesCifra(M_Str);
		
		# Reviso el texto y genero Genero la tabla usando JSON
		M_t=JSON.parse_string(M_Str);
		
		#- Separo la tabla en sus secciones.
		if(M_t.size()==8):
			M_Pos=0;
			V_Ref_ClsGameCab.F_SetArray(M_t[M_Pos]);M_Pos+=1;
			V_Ref_ClsKeys.F_SetArray(M_t[M_Pos]);M_Pos+=1;
			
			V_Ref_ClsPlayer1Cab.F_SetArray(M_t[M_Pos]);M_Pos+=1;
			V_Ref_ClsPlayer2Cab.F_SetArray(M_t[M_Pos]);M_Pos+=1;
			
			V_Ref_ClsHabP1.F_Reset();
			V_Ref_ClsHabP1.F_File_PlayerSetArray(M_t[M_Pos]);M_Pos+=1;
			V_Ref_ClsHabP2.F_Reset();
			V_Ref_ClsHabP2.F_File_PlayerSetArray(M_t[M_Pos]);M_Pos+=1;
			
			V_Ref_ClsItems.F_Player1_SetArray(M_t[M_Pos]);M_Pos+=1;
			V_Ref_ClsItems.F_Player2_SetArray(M_t[M_Pos]);M_Pos+=1;
			
			
	#M_t.append(V_Ref_ClsObjsP1.F_GetArray());
	#M_t.append(V_Ref_ClsObjsP2.F_GetArray());
	
	#END If FileExist
	CLog.Del("F_LoadGame()",M_Log);
#END F_LoadGame
	
