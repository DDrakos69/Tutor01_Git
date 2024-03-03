extends Control


func F_LogAdd(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,1);
func F_LogDel(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,0);
func F_LogCom(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,2);
func F_Log_(MTxt:String,MVisible:bool=true,MAcc:int=2):if(MVisible):V.F_log("UI_Inputs",MTxt,MAcc);


@onready var V_LbPressKey =$PanelContainer/VBoxContainer/PanelContainer/LbPressKey
@onready var V_ScrlCont = $PanelContainer/VBoxContainer/PanelContainer/ScrlCont
@onready var V_VBoxContainer =$PanelContainer/VBoxContainer/PanelContainer/ScrlCont/VBoxContainer


#Sera el boton de la accion selecionado para definir su evento.
#Tras Capturar la tecla o eje se modifica el texto de dicho boton.
var V_ButtonSell:Button;
#Esto indica que se esta capturand una Accion
var V_AccName2Scan:String= "";







# Called when the node enters the scene tree for the first time.
func _ready():
	V_LbPressKey.visible=false;
	V_LbPressKey.size=$PanelContainer/VBoxContainer/PanelContainer.size;
	
	var m_TKeys:Array=[["ACT1_FRONT", 3, 87], ["ACT2_FRONT", -1], ["ACT1_BACK", 3, 83], ["ACT2_BACK", -1], ["ACT1_LEFT", 3, 65], ["ACT2_LEFT", -1], ["ACT1_RIGHT", 3, 68], ["ACT2_RIGHT", -1], ["ACT1_JUMP", 3, 32], ["ACT2_JUMP", -1], ["ACT1_TOUCH", 3, 69], ["ACT2_TOUCH", -1], ["ACT1_DOWN", 3, 67], ["ACT2_DOWN", -1], ["ACT1_LIGHT", 3, 76], ["ACT2_LIGHT", -1], ["ACT1_RUN", 3, 4194325], ["ACT2_RUN", -1], ["ACT1_MENU", 3, 81], ["ACT2_MENU", -1], ["ACT1_PUNCH1", 3, 82], ["ACT2_PUNCH1", -1], ["ACT1_PUNCH2", 3, 84], ["ACT2_PUNCH2", -1], ["ACT1_PUNCH3", 3, 89], ["ACT2_PUNCH3", -1], ["ACT1_PUNCH4", 3, 85], ["ACT2_PUNCH4", -1]];
	V.V_ClsKeys.F_KeysSetArray(m_TKeys);
	
	F_AddAcc();
#END func _ready







# NT_ Genera nombres y texto del propio nombre de las acciones.
#- Genero los lables con las acciones.
func F_AddAcc():
	var M_LogVis:bool=false;F_LogAdd("<F_AddAcc()>",M_LogVis);
	
	var M_LstAcc:Array=InputMap.get_actions();
	var M_Txt:String="";
	var M_Acc:String="";
	var M_h=30;
	var M_HBC:HBoxContainer;
	#Cab Play1
	M_HBC=HBoxContainer.new();
	
	V_VBoxContainer.add_child(M_HBC);
	F_GetLb("LbTxPly1"," ",100,M_h,M_HBC).mouse_filter=Control.MOUSE_FILTER_IGNORE;
	F_GetLb("Lbly1","PLAYER 1",200,M_h,M_HBC).mouse_filter=Control.MOUSE_FILTER_IGNORE;
	
	F_LogCom("Accs:"+str(M_LstAcc.size()),false);
	# Por cada Accion P1
	for Mq in M_LstAcc.size():
		M_Acc=M_LstAcc[Mq];
		F_LogCom(str(Mq)+" Acc:"+str(M_Acc),false);
		
		if(str(M_Acc).substr(0,5)=="ACT1_"):
			M_HBC=HBoxContainer.new();
			V_VBoxContainer.add_child(M_HBC);
			M_Txt=str(M_Acc).substr(5);
			F_GetLb("LbP1_"+M_Txt,M_Txt,100,M_h,M_HBC).mouse_filter=Control.MOUSE_FILTER_IGNORE;
			F_GetBt("Bt1_"+M_Acc,M_Txt,200,M_h,M_HBC).text=F_GetAccTxt(M_Acc);
			
	#Cab Play2
	M_HBC=HBoxContainer.new();
	V_VBoxContainer.add_child(M_HBC);
	F_GetLb("LbTxPly2"," ",100,M_h,M_HBC);
	F_GetLb("Lbly2","PLAYER 2",150,M_h,M_HBC);
	# Por cada Accion P2
	for Mq in M_LstAcc.size():
		M_Acc=M_LstAcc[Mq];
		if(str(M_Acc).substr(0,5)=="ACT2_"):
			M_HBC=HBoxContainer.new();
			V_VBoxContainer.add_child(M_HBC);
			M_Txt=str(M_Acc).substr(5);
			F_GetLb("LbP2_"+M_Txt,M_Txt,100,M_h,M_HBC).mouse_filter=Control.MOUSE_FILTER_IGNORE;
			F_GetBt("Bt1_"+M_Acc,M_Txt,200,M_h,M_HBC).text=F_GetAccTxt(M_Acc);
			
	F_LogDel("<..ok>",M_LogVis);
#END F_AddAcc()







# Genera un Label y lo añade a Parent
func F_GetLb(MName:String,MTxt:String,
Mw:int,Mh:int,
MParent:Control)->Label:
	var MCtr:Label=Label.new();
	MCtr.name=MName;
	MCtr.text=MTxt;
	MCtr.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER;
	MParent.add_child(MCtr);
	MCtr.size.y=Mh;
	MCtr.size.x=Mw;
	MCtr.custom_minimum_size=Vector2(Mw,Mh);
	MCtr.set_size(Vector2(Mw,Mh));
	return MCtr;
#END F_GetBt(MName:String)







# Genera un Button y lo añade a Parent y genera su Evento
func F_GetBt(MName:String,MTxt:String,
Mw:int,Mh:int,
MParent:Control,MConEvt:bool=true)->Button:
	var MCtr:Button=Button.new();
	MCtr.name=MName;
	MCtr.text=MTxt;
	MParent.add_child(MCtr);
	MCtr.size.y=Mh;
	MCtr.size.x=Mw;
	MCtr.custom_minimum_size=Vector2(Mw,Mh);
	MCtr.set_size(Vector2(Mw,Mh));
	if(MConEvt):MCtr.button_up.connect(EVT_on_button_up.bind(MCtr));
	return MCtr;
#END F_GetBt(MName:String)







# Evento ButtonUp asociado a GetBt
func EVT_on_button_up(SELF:Button):
	if (V_AccName2Scan==""):
		var M_LogVis:bool=false;F_LogAdd("EVT_on_button_up("+SELF.name+")>",M_LogVis);
		
		var M_Acc:String=SELF.name.substr(4);#Texto del nombre del boton.
		F_LogCom("Acc:"+M_Acc,M_LogVis);
		V_AccName2Scan=M_Acc;
		V_ButtonSell=SELF;
		
		V_LbPressKey.visible=true;
		V_ScrlCont.visible=false;
		F_LogCom("CAD_FILE"+str(V.V_ClsKeys.F_KeysGetArray()),M_LogVis);
		F_LogDel("...ok",M_LogVis);
	#END If
#END _on_button_up






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#END _Process






# Modificamos el texto de la accion del boton
func F_GetAccTxt(M_Acc:String)->String:
	var M_LogVis=false;F_LogAdd("<F_GetAccTxt>",M_LogVis);
	var M_Res="";
	var M_Accs:Array=InputMap.get_actions();
	var M_Evt;
	
	F_LogCom("Acc:"+M_Acc+" Accs:"+str(M_Accs.size()),M_LogVis);
	for Mq in M_Accs.size():
		
		if(M_Accs[Mq]==M_Acc):
			M_Evt=InputMap.action_get_events(M_Acc);
			F_LogCom("Evts:"+str(M_Evt.size()),M_LogVis);
			
			if(M_Evt.size()>0):
				M_Evt=M_Evt[0];
				
				if(M_Evt is InputEventJoypadButton):
					F_LogCom("Tipe:JPB",M_LogVis);
					var M_EvtB:InputEventJoypadButton=M_Evt;
					M_Res="Device:"+str(M_EvtB.device)+" Bt:"+str(M_EvtB.button_index);
					
				elif(M_Evt is InputEventJoypadMotion):
					F_LogCom("Tipe:JPM",M_LogVis);
					var M_EvtM:InputEventJoypadMotion=M_Evt;
					M_Res="Device:"+str(M_EvtM.device)+" Axis:"+str(M_EvtM.axis)+" Val:"+str(M_EvtM.axis_value);
					
				elif(M_Evt is InputEventKey):
					F_LogCom("Tipe:KEY",M_LogVis);
					var M_EvtK:InputEventKey=M_Evt;
					M_Res=" "+F_GetKeyName(M_EvtK.keycode)+" ("+str(M_EvtK.keycode)+")";

				#END if Tipos Eventos
				
			#END If Con Acciones
			break;
		#END IF
	#END For
	F_LogCom(M_Res,M_LogVis);
	F_LogDel("<...OK>",M_LogVis);
	
	return M_Res;
#END F_SetTextAcc








# Retorna el nombre de la tecla que corresponde al KeyCode
func F_GetKeyName(KeyCode:int)->String:
	match KeyCode:
		KEY_SPACE: return "ESPACE";
		KEY_ESCAPE: return "ESCAPE";
		KEY_TAB: return "TAB";
		KEY_BACKTAB: return "BACKTAB";
		KEY_BACKSPACE: return "BACKSPACE";
		KEY_ENTER: return "ENTER";
		KEY_INSERT: return "INSERT";
		KEY_DELETE: return "DELETE";
		KEY_PAUSE: return "PAUSE";
		KEY_PRINT: return "PRINT";
		KEY_SYSREQ: return "SYSREQ";
		KEY_CLEAR: return "CLEAR";
		KEY_HOME: return "HOME";
		KEY_END: return "END";
		KEY_LEFT: return "LEFT";
		KEY_UP: return "UP";
		KEY_RIGHT: return "RIGHT";
		KEY_DOWN: return "DOWN";
		KEY_PAGEUP: return "PAGEUP";
		KEY_PAGEDOWN: return "PAGEDOWN";
		KEY_SHIFT: return "SHIFT";
		KEY_META: return "META";
		KEY_ALT: return "ALT";
		KEY_CAPSLOCK: return "CAPSLOCK";
		KEY_NUMLOCK: return "NUMLOCK";
		KEY_SCROLLLOCK: return "SCROLLLOCK";
		KEY_F1: return "F1";
		KEY_F2: return "F2";
		KEY_F3: return "F3";
		KEY_F4: return "F4";
		KEY_F5: return "F5";
		KEY_F6: return "F6";
		KEY_F7: return "F7";
		KEY_F8: return "F8";
		KEY_F9: return "F9";
		KEY_F10: return "F10";
		KEY_F11: return "F11";
		KEY_F12: return "F12";
		KEY_F13: return "F13";
		KEY_F14: return "F14";
		KEY_F15: return "F15";
		KEY_F16: return "F16";
		KEY_F17: return "F17";
		KEY_F18: return "F18";
		KEY_F19: return "F19";
		KEY_F20: return "F20";
		KEY_F21: return "F21";
		KEY_F22: return "F22";
		KEY_F23: return "F23";
		KEY_F24: return "F24";
		KEY_F25: return "F25";
		KEY_KP_0: return "KP_0";
		KEY_KP_1: return "KP_1";
		KEY_KP_2: return "KP_2";
		KEY_KP_3: return "KP_3";
		KEY_KP_4: return "KP_4";
		KEY_KP_5: return "KP_5";
		KEY_KP_6: return "KP_6";
		KEY_KP_7: return "KP_7";
		KEY_KP_8: return "KP_8";
		KEY_KP_9: return "KP_9";
		KEY_KP_DIVIDE: return "KP_DIVIDE";
		KEY_KP_MULTIPLY: return "KP_MULTIPLY";
		KEY_KP_SUBTRACT: return "KP_SUBTRACT";
		KEY_KP_PERIOD: return "KP_PERIOD";
		KEY_KP_ADD: return "KP_ADD";
		KEY_KP_ENTER: return "KP_ENTER";
		KEY_HELP: return "HELP";
		KEY_SYSREQ: return "SYSREQ";
		KEY_MENU: return "MENU";
		_: return String.chr(KeyCode);
#END F_GetKeyName











# Fincion de captura de inputs
func _input(event):
	var M_LogVis:bool=true;
	# Verificar si se está esperando la asignación de una tecla o botón
	if (V_AccName2Scan != ""):
		
		if event is InputEventKey:
			F_LogAdd("<_input(KEY)>",M_LogVis);
			
			var M_Evts=InputMap.action_get_events(V_AccName2Scan);
			F_LogCom("ACC:"+V_AccName2Scan+" Evts:"+str(M_Evts.size()) ,M_LogVis);
			InputMap.action_erase_events(V_AccName2Scan);
			F_LogCom("Erase:"+str(M_Evts.size()) ,M_LogVis);
			
			var M_EvtIn:InputEventKey=event;
			var M_EvtNew:InputEventKey = InputEventKey.new();
			M_EvtNew.keycode=M_EvtIn.keycode;# .get_keycode_with_modifiers();
			F_LogCom(
			"IN ChrKC"+String.chr(M_EvtIn.keycode) +
			" KC:"+str(M_EvtIn.keycode)+
			" KCL:"+str(M_EvtIn.key_label)+
			" KCLs:"+str(M_EvtIn.to_string() ) ,M_LogVis);
			
			InputMap.action_add_event(V_AccName2Scan, M_EvtNew);
			F_LogCom("Add Evt:"+str(M_Evts.size()) ,M_LogVis);
			V_ButtonSell.text=F_GetAccTxt(V_AccName2Scan);
			F_LogCom("Bt "+str(V_ButtonSell.name) ,M_LogVis);
			V_AccName2Scan = ""
			V_LbPressKey.visible=false;
			V_ScrlCont.visible=true;
			F_LogDel("<_input(KEY)...ok>",M_LogVis);
		#END IF Key
		elif event is InputEventJoypadButton:
			F_LogAdd("<_input(JPB)>",M_LogVis);
			var M_EvtJoyBt:InputEventJoypadButton = event;
			var M_Evt:InputEventJoypadButton=InputEventJoypadButton.new();
			InputMap.action_erase_events(V_AccName2Scan);
			F_LogCom("Dell Accs:"+str(V_AccName2Scan) ,M_LogVis);
			M_Evt.device=event.device;
			M_Evt.button_index=M_EvtJoyBt.button_index;
			InputMap.action_add_event(V_AccName2Scan,M_Evt);
			
			V_ButtonSell.text=F_GetAccTxt(V_AccName2Scan);
			V_AccName2Scan = "";
			V_LbPressKey.visible=false;
			V_ScrlCont.visible=true;
			F_LogDel("<_input(JPB)...ok>",M_LogVis);
		#END IF JPB
		elif event is InputEventJoypadMotion:
			F_LogAdd("<_input(JPM)>",M_LogVis);
			var M_EvtJoyMot:InputEventJoypadMotion = event;
			if(M_EvtJoyMot.axis_value==-1 || M_EvtJoyMot.axis_value==+1):
				var M_Evt:InputEventJoypadMotion=InputEventJoypadMotion.new();
				InputMap.action_erase_events(V_AccName2Scan);
				F_LogCom("Dell Accs:"+str(V_AccName2Scan) ,M_LogVis);
				
				M_Evt.device=event.device;
				M_Evt.axis=M_EvtJoyMot.axis;
				M_Evt.axis_value=M_EvtJoyMot.axis_value;
				InputMap.action_add_event(V_AccName2Scan,M_Evt);
				
				V_ButtonSell.text=F_GetAccTxt(V_AccName2Scan);
				V_AccName2Scan = "";
				V_LbPressKey.visible=false;
				V_ScrlCont.visible=true;
			#END Values Maximos
			F_LogDel("<_input(JPM)...Ok>",M_LogVis);
		#END IF JPM
		F_LogAdd("<..OK>",false);
		#END If V_AccName2Scan
#END _input()


