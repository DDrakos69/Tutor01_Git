extends Node
#Esta clase guarda el log en un fichero
class_name  Cls_Log_File

# Configura si se guarda o no el buffer en fichero.
var V_On:bool=false;
# privada (Fichero mantenido para guardar el log.)
var _file=null;
#Delay en mili segundos para forzar la escritura del fichero.
var V_delay_mseg=20000;

#PRIVADA (guardamos el tiempo limite para flusear now.tiks + segX)
var _time2flush=Time.get_ticks_msec();

#PRIVADA (Nombre del fichero log a guardar)
var _file_name:String="";

# Obtengo el nombre del fichero log que uso.
func file_name() -> String:
	return _file_name;

# Instancia de la clase
func _init(file_name:String,delaymseg=20000):
	_file_name=file_name;
	V_delay_mseg=delaymseg;
#END _init
	
# Cerramos los punteros al fichero y guardamos el buffer
func F_FileClose()->void:
	if(_file!=null):
		_file.flush();
		_file.close();
		_file=null;
#END F_FileClose
	
# Guardamos las lineas al fichero
func F_Save2File(M_Txt)->void:
	if(_file==null):
		_file=FileAccess.open(_file_name, FileAccess.WRITE);
		
	if(_file!=null):
		_file.store_line(M_Txt);
		if(_time2flush>Time.get_ticks_msec()):
			_time2flush=Time.get_ticks_msec()+V_delay_mseg;
			_file.flush();
		#END if Time2flush
	#End If FileNull
	
#END F_TronSaveFile




















#
## Globals contains global project values
#var game_ui:Control
#var save_path:String		# path for config and saved games
#
## Tabla Clave-Valor con la configuracion actual.
#var settings={
			#"text_lang":"en","audio_lang":"en",
			#"res":2,"winmode":1,
			#"gi":"normal","gi_rc":16,"gi_fc":15,"gi_fu":8,
			#"shadows":"enabled",
			#"shadowssize2d":2048,"shadowssizedl":4096,"shadowssizepl":4096,
			#"antial":1,
			#"msaa":0,"msaa_3d":0,
			#"fxaa":false,"taa":false,
			#"aniso":2,"help": true, "meshq":1.0}




#byDark 231130 Configura el motor con parametros del ini
# NT: Aqui se ponen valores que esan en el ini pero no se 
# configuran en el juego .. CFG X DEF
# NT .has(KEY) no funcion.
#func f_settingsbase_set():
	#var m_cfgkey="";
	##---- Shadow Size Atlas (Def 2048)(Solo al iniciar)(Cfg a mano)
	#m_cfgkey="rendering/2d/shadow_atlas/size";
	#f_setting_set("shadowsSize2d",m_cfgkey,2048);
	#f_log("f_settingsbase_set(shadowsSize2d)="+str(settings["shadowsSize2d"]));
	##---- Shadow Size DirLight (Def 4096)()(Cfg a mano)
	#m_cfgkey="rendering/lights_and_shadows/directional_shadow/size";
	#f_setting_set("shadowssizedl",m_cfgkey,4096);
	#f_log("f_settingsbase_set(shadowssizeps)="+str(settings["shadowssizedl"]));
	##---- Shadow Size PosLight (Def 4096)()(Cfg a mano)
	#m_cfgkey="rendering/lights_and_shadows/positional_shadow/atlas_size";
	#f_setting_set("shadowssizepl",m_cfgkey,4096);
	#f_log("f_settingsbase_set(shadowssizepl)="+str(settings["shadowssizepl"]));
	##---- Anti Aliasing (Cfg al inicio solo)
	#m_cfgkey="rendering/anti_aliasing/screen_space_roughness_limiter/enabled";
	#f_setting_set("antial",m_cfgkey,1);
	#f_log("f_settingsbase_set(antial)="+str(settings["antial"]));
	##----Anisotropic Filtering (Cfg al inicio solo)
	#m_cfgkey="rendering/textures/default_filters/anisotropic_filtering_level";
	#f_setting_set("aniso",m_cfgkey,1);
	#f_log("f_settingsbase_set(aniso)="+str(settings["aniso"]));	
	##----LOD Level of Detail (0--1024) (Cfg al inicio solo)
	#m_cfgkey="rendering/mesh_lod/lod_change/threshold_pixels";
	#f_setting_set("meshq",m_cfgkey,1);
	#f_log("f_settingsbase_set(aniso)="+str(settings["meshq"]));	
#
##END f_settingsBase_set


##byDark 231123 Configura el juego con las propiedades del settings
## NT .has(KEY) no funcion.
#func f_settings_set():
	#var m_cfgkey="";
	#var m_key="";
	#
	##---- Modo ventana 0 Win,1 full, 2 Esclusive
	#m_cfgkey="display/window/size/mode"
	#m_key="winmode";	
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#f_setting_set(m_key,m_cfgkey,1);
	#if(settings[m_key]==0):DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
	#elif(settings[m_key]==1):DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	#elif(settings[m_key]==2):DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN);
	#f_log("F_Settings_Set("+m_key+")="+str(settings[m_key]));
	#
	##---- Resolucion del juego
	#m_key="res";
	#var m_vect2D_size:Vector2;
	#if !(m_key in settings):settings[m_key]=2;
	#m_cfgkey="display/window/size/viewport_width";
	#ProjectSettings.set_setting(m_cfgkey,tab_resoluciones[settings[m_key]][0]);
	#m_vect2D_size.x=int(tab_resoluciones[settings[m_key]][0]);
	#m_cfgkey="display/window/size/viewport_height";
	#ProjectSettings.set_setting(m_cfgkey,tab_resoluciones[settings[m_key]][1]);
	#m_vect2D_size.y=int(tab_resoluciones[settings[m_key]][1]);
	#DisplayServer.window_set_size(m_vect2D_size);
	#f_log("F_Settings_Set("+m_key+")="+str(tab_resoluciones[settings[m_key]]));
#
	#
	##---- Lenguaje del texto
	#if !("text_lang" in settings):settings["text_lang"]="en";
	#TranslationServer.set_locale(settings["text_lang"]);
	#f_log("F_Settings_Set(text_lang)="+str(settings["text_lang"]));
	##---- Lenguaje del audio
	#if !("audio_lang" in settings):settings["audio_lang"]="en";
	#f_log("F_Settings_Set(audio_lang)="+str(settings["audio_lang"]));
	#
	##----gi Global Ilumination 
	##-- En setting(gi) activo/desactivo y configuro los voxels normal/high
	#if !("gi" in settings):settings["gi"]="disabled";
	#m_cfgkey="rendering/global_illumination/gi/use_half_resolution";
	#ProjectSettings.set_setting(m_cfgkey,0);
	#if(globals.settings["gi"]!="disabled"):
		#ProjectSettings.set_setting(m_cfgkey,1);
		#if(globals.settings["gi"]=="normal"):
			#m_cfgkey="rendering/global_illumination/voxel_gi/quality";
			#ProjectSettings.set_setting(m_cfgkey,0);
		##END if Gi Normal
		#if(globals.settings["gi"]=="high"):
			#m_cfgkey="rendering/global_illumination/voxel_gi/quality";		
			#ProjectSettings.set_setting(m_cfgkey,1);
		##END if Gi high
	##END if gi enabled
	#f_log("F_Settings_Set(gi)="+str(settings["gi"]));
	#
	#
	##---- gi_rc Global Ilumination Ray Count (8 Fater,16,32,64,96,128 Slowest)
	#m_cfgkey="rendering/global_illumination/sdfgi/probe_ray_count";
	#f_setting_set("gi_rc",m_cfgkey,16);
	#f_log("F_Settings_Set(gi_rc)="+str(settings["gi_rc"]));
#
	##---- gi_fc Global Ilumination - Frame Converge (5 Lower Quality ,10,15,20,25,30 Higer Quality)
	#m_cfgkey="rendering/global_illumination/sdfgi/frames_to_converge";
	#f_setting_set("gi_fc",m_cfgkey,15);
	#f_log("F_Settings_Set(gi_fc)="+str(settings["gi_fc"]));
	#
	##---- gi_fu Global Ilumination - Frames to Update Lights (1 Slowest,2,3,8,16 Faster)
	#m_cfgkey="rendering/global_illumination/sdfgi/frames_to_update_lights";
	#f_setting_set("gi_fu",m_cfgkey,8);
	#f_log("F_Settings_Set(gi_fu)="+str(settings["gi_fu"]));
	#
	#
		##-----------------	
	##Se ha mantenido disabled, Shadows acepta de 0 a 6,
	## En el settings puede tener disable,0,1,2,3,4,5,6
	## Si setting=Disable cfg=0 y si setting=0 tambien cfg=0
	#if !("shadows" in settings):settings["shadows"]="disabled";
	#if(settings["shadows"]=="disabled"):
			##"disabled" tambien desactiva las luces por codigo.
			#m_cfgkey="rendering/lights_and_shadows/positional_shadow/soft_shadow_filter_quality";
			#f_setting_set("shadows",m_cfgkey,0);
			#m_cfgkey="rendering/lights_and_shadows/directional_shadow/soft_shadow_filter_quality";
			#f_setting_set("shadows",m_cfgkey,0);
	#else:
			#m_cfgkey="rendering/lights_and_shadows/positional_shadow/soft_shadow_filter_quality";
			#f_setting_set("shadows",m_cfgkey,5);
			#m_cfgkey="rendering/lights_and_shadows/directional_shadow/soft_shadow_filter_quality";
			#f_setting_set("shadows",m_cfgkey,5);
	##END del if else shadows disabled
	#
	##-- Anti Aliasing 
	#if !("antial" in settings):settings["antial"]=1;	
	#RenderingServer.screen_space_roughness_limiter_set_active((settings["antial"]==1),0.25,0.18);	
	#f_log("F_Settings_Set(antial)="+str(settings["antial"]));
	#
	##-- Multisample Anti-Aliasing
	#f_setting_set("msaa","rendering/anti_aliasing/quality/msaa_2d",0);
	#f_log("F_Settings_Set(msaa)="+str(settings["msaa"]));
	#
	##-- Multisample Anti-Aliasing
	#f_setting_set("msaa_3d","rendering/anti_aliasing/quality/msaa_3d",0);	
	#f_log("F_Settings_Set(msaa_3d)="+str(settings["msaa_3d"]));
	#
	##-- Fast Approximate Anti-Aliasing (FXAA)  (0,1)
	#f_setting_set("fxaa","rendering/anti_aliasing/quality/screen_space_aa",1);
	#f_log("F_Settings_Set(fxaa)="+str(settings["fxaa"]));
	#
	##-- Temporal Anti-Aliasing  (TAA)  (0,1)
	#f_setting_set("taa","rendering/anti_aliasing/quality/use_taa",0);
	#f_log("F_Settings_Set(taa)="+str(settings["taa"]));
	#
	#
	#
#
#
	##-----------------	
	#f_setting_set("aniso","rendering/textures/default_filters/anisotropic_filtering_level",0);
#
	##-----------------
##END F_Settings_Set
#
##byDark 231127 Configura solo valor de la clave. NT .has(KEY) no funcion.
#func f_setting_set(settingkey,cfgkey,vdef)->void:
	#if !(settingkey in settings):settings[settingkey]=vdef;
	#ProjectSettings.set_setting(cfgkey,settings[settingkey]);
	#f_log("F_Settings_Set("+settingkey+")="+str(settings[settingkey])+" def:"+str(vdef));
##END F_Setting_Set
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
##
##
###byDark 231127 Si no existe el fichero de resoluciones,creamos uno por defecto.
##func f_resoluciones_fileload():
	##var m_fname=save_path+"resolutions.conf";
	##if(!FileAccess.file_exists(m_fname)):
		##f_resoluciones_savefile();
	##else:
		##var m_f= FileAccess.open(m_fname, FileAccess.READ)
		##var m_l;
		##var m_cels;
		##tab_resoluciones.clear();
		##while(!m_f.eof_reached()):
			##m_l=m_f.get_line();
			##m_cels=m_l.split(":");
			##
			##if(m_cels.size()==2):
				##tab_resoluciones.append(m_cels);
		###END While
		##m_f.close();
		##m_f=null;
	###END if Else Save o Read
	##print("load res:",m_fname);
	##print("load res:",tab_resoluciones);
###END f_resoluciones_fileload
	#
#
#
#
##
##NOTIFICATION_ENTER_TREE = 10
##NOTIFICATION_EXIT_TREE = 11
##NOTIFICATION_MOVED_IN_PARENT = 12
##NOTIFICATION_READY = 13
##NOTIFICATION_PAUSED = 14
##NOTIFICATION_UNPAUSED = 15
##NOTIFICATION_PHYSICS_PROCESS = 16
##NOTIFICATION_PROCESS = 17
##NOTIFICATION_PARENTED = 18
##NOTIFICATION_UNPARENTED = 19
##NOTIFICATION_SCENE_INSTANTIATED = 20
##NOTIFICATION_DRAG_BEGIN = 21
##NOTIFICATION_DRAG_END = 22
##NOTIFICATION_PATH_RENAMED = 23
##NOTIFICATION_INTERNAL_PROCESS = 25
##NOTIFICATION_INTERNAL_PHYSICS_PROCESS = 26
##NOTIFICATION_POST_ENTER_TREE = 27
##NOTIFICATION_DISABLED = 28
##NOTIFICATION_ENABLED = 29
##NOTIFICATION_NODE_RECACHE_REQUESTED = 30
##NOTIFICATION_EDITOR_PRE_SAVE = 9001
##NOTIFICATION_EDITOR_POST_SAVE = 9002
##NOTIFICATION_WM_MOUSE_ENTER = 1002
##NOTIFICATION_WM_MOUSE_EXIT = 1003
##NOTIFICATION_WM_WINDOW_FOCUS_IN = 1004
##NOTIFICATION_WM_WINDOW_FOCUS_OUT = 1005
##NOTIFICATION_WM_CLOSE_REQUEST = 1006
##NOTIFICATION_WM_GO_BACK_REQUEST = 1007
##NOTIFICATION_WM_SIZE_CHANGED = 1008
##NOTIFICATION_VP_MOUSE_ENTER = 1010
##NOTIFICATION_VP_MOUSE_EXIT = 1011
##NOTIFICATION_OS_MEMORY_WARNING = 2009
##NOTIFICATION_TRANSLATION_CHANGED = 2010
##NOTIFICATION_WM_ABOUT = 2011
##NOTIFICATION_CRASH = 2012
##NOTIFICATION_OS_IME_UPDATE = 2013
##NOTIFICATION_APPLICATION_RESUMED = 2014
##NOTIFICATION_APPLICATION_PAUSED = 2015
##NOTIFICATION_APPLICATION_FOCUS_IN = 2016
##NOTIFICATION_APPLICATION_FOCUS_OUT = 2017
##NOTIFICATION_TEXT_SERVER_CHANGED = 2018
#
##
###byDark 231127 Capturamos algunos mensajes ,aun no se hace nada.
##func _notification(msg):
		###Al cerrar entran.
		###6320>[main_menu]..Bt_Close
		###6321>[globals]._Notification=17 NOTIFICATION_PROCESS
		###6322>[globals]._Notification=11 NOTIFICATION_EXIT_TREE
		###6328>[globals]._Notification=19 NOTIFICATION_UNPARENTED
		###6328>[globals]._Notification=1 Nose
		##
		##if(msg == NOTIFICATION_WM_CLOSE_REQUEST):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_WM_CLOSE_REQUEST",self,false);
		##elif(msg == NOTIFICATION_CRASH):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_CRASH",self,false);
		##elif(msg == NOTIFICATION_APPLICATION_FOCUS_IN):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_APPLICATION_FOCUS_IN",self,false);
		##elif(msg == NOTIFICATION_WM_WINDOW_FOCUS_OUT):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_WM_WINDOW_FOCUS_OUT",self,false);
		##elif(msg == NOTIFICATION_WM_SIZE_CHANGED):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_WM_SIZE_CHANGED",self,false);
		##elif(msg == NOTIFICATION_OS_MEMORY_WARNING):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_OS_MEMORY_WARNING",self,false);
		##elif(msg == NOTIFICATION_NODE_RECACHE_REQUESTED):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_NODE_RECACHE_REQUESTED",self,false);
		##elif(msg == NOTIFICATION_WM_MOUSE_ENTER):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_WM_MOUSE_ENTER",self,false);
		##elif(msg == NOTIFICATION_UNPARENTED):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_UNPARENTED",self,false);
		##elif(msg == NOTIFICATION_EXIT_TREE):
			##f_log("_Notification=("+str(msg)+")NOTIFICATION_EXIT_TREE",self,true);
###END _notification
#
#
##func _ready():	
	##save_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)+"/tkotw/"
	##if !DirAccess.dir_exists_absolute(save_path):
		##DirAccess.make_dir_absolute(save_path)
		##DirAccess.make_dir_absolute(save_path+"save")
	##
	###- byDark 231127 Borramos el log antiguo si existe.
	##if(FileAccess.file_exists(save_path+"generic.log")):
		##DirAccess.remove_absolute(save_path+"generic.log");
	###END If Dell Exist File Log
	##
	###-byDark 231123 Configuramos la clase para guardar el log.
	##self.log_clsfile_generic =cls_log_file.new(save_path+"generic.log",10000);
	##self.log_clsfile_generic.on=true;
	##f_log("File Log set:("+save_path+"generic.log)");
	##
	### Detecto el idioma del SO y lo defino para el idioma.
	##detect_os_locate()
	##
	### Si existe el fichero CFG lo cargo.
	##if FileAccess.file_exists(save_path+"config.conf"):
		##load_config()
	##else : #No config created, save defaults
		##save_config()
	###END If
	##
	###-- Cargamos la lista de resoluciones (si no existe creo uno por def);
	##f_resoluciones_fileload();
	##
	### Configuro el motor con el CFG cargado o por defecto.(NO EDITABLES)
	##f_settingsbase_set();
	##
	### Configuro el motor con el CFG cargado o por defecto.(EDITABLES)
	##f_settings_set();
###END _ready
#
#
#
#
#
###byDark 231127 ADD. Ahora se cierra el fichero antes de desinstanciarlo
##func save_config():
	##DirAccess.remove_absolute(save_path+"config.conf")
	##var f =  FileAccess.open(save_path+"config.conf",FileAccess.WRITE)
	##f_log("Save_Config("+save_path+"config.conf)");
	##f.store_var(settings)
	##f.flush()
	##f.close();
	##f = null
	##print("save config ", settings)
###END save_config
#
#
#
#
##func load_config():
	##var f= FileAccess.open(save_path+"config.conf", FileAccess.READ)
	##f_log("Load_Config("+save_path+"config.conf)");
	##settings = f.get_var();
	##f.close();
	##f=null;
	##print("load config ", settings)
##
	##
#
#
#
#
##
### Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
	##pass
##
##
##
###- configuro el lenguaje del sistema a settings.
##func detect_os_locate():
	##if OS.get_locale().begins_with("es"):
		##settings["text_lang"]="es"
	##else :
		##settings["text_lang"]="en"
##
#
##
##
### Gerates a random 4 digit string
##static func random_id()->String:	
	##randomize()
	##var s:String = "*"
	##for i in range(2):
		##var value =randi_range(10,99)
		##s+=str(value)
	##return s
##
### Strips an id from its random part
##static func get_id(full_id)->String:
	##var pos = full_id.find("*")
	##if pos!=-1:
		### get the position of -		
		##print("Stripped id ",full_id.substr(0,pos))
		##return full_id.substr(0,pos)
	##else:
		##return full_id
##
##func attrib_idx(att:String)->int:
	##match  att:
		##"str", "strength":
			##return entity.STR
		##"int", "intelligence":
			##return entity.INT
		##"dex", "dext", "dexterity":
			##return entity.DEX
		##"con","const", "constitution":
			##return entity.CON	
	##
	##return 4
##
##static func set_owner_recursive(node:Node):
	##for n in node.get_children():
		##n.owner = n.get_parent()
		##if n.get_child_count()>0:
			##set_owner_recursive(n)
	##pass
##
##func info_text(item)->String:
	##var txt:String=""
	###item specific info
	##if item.type==item_base.ItemTypes.itWEAPON:
		###is a weapon ? Display damage
		##txt=tr("dmg")+": "
		##txt=txt+tr("dmg_phys")+" "+str(item.damage[0])+", "
		##txt=txt+tr("dmg_fire")+" "+str(item.damage[1])+", "
		##txt=txt+tr("dmg_ice")+" "+str(item.damage[2])+", "
		##txt=txt+tr("dmg_light")+" "+str(item.damage[3])+"\n"
	##elif item.type==item_base.ItemTypes.itARMOR:
		##txt=tr("prot")+": "
		##txt=txt+tr("dmg_phys")+" "+str(item.prot[0])+", "
		##txt=txt+tr("dmg_fire")+" "+str(item.prot[1])+", "
		##txt=txt+tr("dmg_ice")+" "+str(item.prot[2])+", "
		##txt=txt+tr("dmg_light")+" "+str(item.prot[3])
	##
	##
	###Quality info
	##txt=txt+"\n"+tr("quality")+": "
	##if item.quality==item_base.Quality.Regular:
		##txt=txt+tr("regular")
	##elif item.quality==item_base.Quality.Good:
		##txt=txt+tr("good")
	##elif item.quality==item_base.Quality.Legendary:
		##txt=txt+tr("legend")
	##else:		
		##txt=txt+tr("epic")
	##txt+="\n"+tr("weight")+": "+str(item.weight)
	##return txt
##
### Creates a complete item information
##func display_info(panel:VBoxContainer, it, display_durability=false, durability:float=0):
	###Clear panel
	##var child = panel.get_children()
	##for c in child:
		##panel.remove_child(c)
	##var desc:String = tr(it.desc)
	##var l =Label.new()
	##l.text = desc
	##l.autowrap_mode=TextServer.AUTOWRAP_WORD
	##panel.add_child(l)
	##var prop_info:Label=Label.new()
	##prop_info.text=globals.info_text(it)
	##panel.add_child(prop_info)	
	### Durability
	##if display_durability:
		##var dur =Label.new()
		##dur.text=tr("state")+": "+str(durability)
		##panel.add_child(dur)
		##
	##if it.reqs.size()>0:
		###item has reqs	
		##var req_lab = Label.new()
		##req_lab.text=tr("reqs")
		##panel.add_child(req_lab)		
		##for r in it.reqs:
			##var r_label=Label.new()
###			if r["type"]=="attrib":
			##r_label.text=" "+tr(r["id"])+": "+str(r["value"])
			##panel.add_child(r_label)
	##if it.mods.size()>0:
		##var mod_lab = Label.new()
		##mod_lab.text=tr("mod")
		##panel.add_child(mod_lab)	
		##for m in it.mods:
			##var m_lab = Label.new()
			##m_lab.text = tr(m["id"])+": "+str(m["value"])
			##panel.add_child(m_lab)
##
#
#
##
### Returns all the members of a given group
##func get_group_members(g_id:int)->Array[CharacterBody3D]:
	##var ents = actual_level.find_child("NPCs", true).get_children(true)
	##var g:Array[CharacterBody3D]
	##for e in ents:
		##if e is entity and e.group==g_id:
			##g.append(e)
	##return g
