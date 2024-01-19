extends Node2D

func F_Tron(Txt):
	V.F_Tron(Txt,self);
#End F_Tron





# Called when the node enters the scene tree for the first time.
func _ready():
	F_ScrPutWinStatus();
	F_Cfg_Screen();
	F_ScrPutWinStatus()
	
	#$PAN_CfgVideo.visible=false;
	#$PanFondo.visible=true;	
	#$PAN_CfgVideo.PROCESS_MODE_ALWAYS;
	#print(str($PAN_CfgVideo.process_mode));
	#$PAN_CfgVideo.visible=false;	
	#$PAN_CfgVideo.hide();	
	#$ChBd2D_Keko.visible=true;
	
	#pass # Replace with function body.
#END Fnc _Ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func F_Cfg_Screen()->void:
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	
	DisplayServer.window_set_size(Vector2(500,500),0);
	
	var M_WinSize=DisplayServer.window_get_size();
	var M_WinPcX=int(M_WinSize.x/100);
	var M_WinPcY=int(M_WinSize.y/100);
	
	F_Tron("M_WinPcX:"+str(M_WinPcX));
	#$PAN_CfgVideo.set_z_index(0);
	$PAN_CfgVideo.set_position(Vector2(1,(M_WinPcY*80)));
	$PAN_CfgVideo.set_size(Vector2(M_WinSize.x,(M_WinPcY*20)));
	F_Tron("Z_Index:"+str($PAN_CfgVideo.get_z_index()));
	
	
	$PAN_CfgVideo.set_process_mode(Node.PROCESS_MODE_PAUSABLE);
	F_Tron("Pan_ProcesMode:"+str($PAN_CfgVideo.process_mode));
	F_Tron("PosPan:"+str($PAN_CfgVideo.position));
	F_Tron("SizePan:"+str($PAN_CfgVideo.size));
	
#END func F_Cfg_Screen




func F_ScrPutWinStatus()->void:
	
	#Numero pantallas Escritorio extendido.
	print("ScrCount:"+str(DisplayServer.get_screen_count()));
	
	#Resolucion grafica actual
	print("ScrSize:"+str(DisplayServer.screen_get_size()));
	#tamaño de la pantalla usable.
	print("ScrSafeArea:"+str(DisplayServer.get_display_safe_area()));
	
	
	print("ScrWinMode:"+str(DisplayServer.window_get_mode()));
	print("ScrWinSize:"+str(DisplayServer.window_get_size()));
	#indica es estado de la pantalla , full screen, window,absolute etc.
	print("ScrWinFullScrn:"+str(DisplayServer.WINDOW_MODE_FULLSCREEN));
	
	
	
#End Func F_ScrPutWinStatus



#	# Acceder al objeto OS
#	var os = OS.get_singleton()
#
#	# Configurar el ancho y alto de la ventana
#	os.window_size = Vector2(1280, 720)  # Puedes ajustar estos valores según tus preferencias
#
#	# Configurar si se debe usar pantalla completa
#	os.window_fullscreen = true  # Establecer a "false" para modo ventana
#
#	# Confirmar los cambios
#	os.accept_changes()
