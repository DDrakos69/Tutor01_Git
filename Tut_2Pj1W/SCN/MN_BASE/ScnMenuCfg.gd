extends Control


var CLog:Cls_LogLine=Cls_LogLine.new("ScnMnCfg");


# Contara las veces que entras en el tit para mostrar las versiones
var V_MouseInCount=0;


# Called when the node enters the scene tree for the first time.
func _ready():
	#-- TES Al iniciar una partida comienzo a contar el tiempo.
	V.V_Game_Cab.F_Set_MSegIniPartida();
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PanelContainer/HBoxContainer/VBoxContainer/LbTitGame.text=V.V_Game_Cab.F_Get_HoraMinJugados();
	








# 0Teclado 1Idioma, 2Grafico, 3Audio ,4Save 5Load 6Ver
func F_OcultaSecciones(MFrmVis:int):
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuInputs.visible=(MFrmVis==0);
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuLeng.visible=(MFrmVis==1);
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuGrf.visible=(MFrmVis==2);
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuAudio.visible=(MFrmVis==3);
	
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuSave.visible=(MFrmVis==4);
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuLoad.visible=(MFrmVis==5);
	
	$PanelContainer/HBoxContainer/PanelContainer/ScnMenuVer.visible=(MFrmVis==6);
	V_MouseInCount=0;
#END F_OcultaSecciones

func _on_BtTeclado_button_up():
	F_OcultaSecciones(0);
#END _on_BtTeclado_button_up

func _on_BtIdioma_button_up():
	F_OcultaSecciones(1);
#END _on_BtIdioma_button_up

func _on_BtGrafico_button_up():
	F_OcultaSecciones(2);
#END _on_BtGrafico_button_up

func _on_BtAudio_button_up():
	F_OcultaSecciones(3);
#END _on_BtAudio_button_up

func _on_BtRegresar_button_up():
	pass # Replace with function body.
#END _on_BtRegresar_button_up


func _on_BtLoad_button_up():
	F_OcultaSecciones(5);
#END _on_BtAudio_button_up


func _on_BtSave_button_up():
	F_OcultaSecciones(4);
#END _on_BtAudio_button_up


func _on_BtExit_button_up():
	get_tree().quit(0);
#END _on_BtAudio_button_up


func _on_LbTitGame_mouse_entered():
	V_MouseInCount=V_MouseInCount+1;
	if(V_MouseInCount>6):F_OcultaSecciones(6);
#END _on_LbTitGame_mouse_entered
