extends Control


func F_LogAdd(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,1);
func F_LogDel(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,0);
func F_LogCom(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,2);
func F_Log_(MTxt:String,MVisible:bool=true,MAcc:int=2):if(MVisible):V.F_log("UI_Inputs",MTxt,MAcc);


#Sera el boton de la accion selecionado para definir su evento.
#Tras Capturar la tecla o eje se modifica el texto de dicho boton.
var V_ButtonSell:Button;
#Esto indica que se esta capturand una Accion
var V_AccName2Scan:String= "";









# Called when the node enters the scene tree for the first time.
func _ready():
	$LbMsg.visible=false;
	$LbMsg.size=$PanelContainer.size;
	
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
	$PanelContainer/ScrlCont/VBoxContainer.add_child(M_HBC);
	F_GetLb("LbTxPly1"," ",100,M_h,M_HBC);
	F_GetLb("Lbly1","PLAYER 1",150,M_h,M_HBC);
	
	F_LogCom("Accs:"+str(M_LstAcc.size()),false);
	# Por cada Accion P1
	for Mq in M_LstAcc.size():
		M_Acc=M_LstAcc[Mq];
		F_LogCom(str(Mq)+" Acc:"+str(M_Acc),false);
		
		if(str(M_Acc).substr(0,5)=="ACT1_"):
			M_HBC=HBoxContainer.new();
			$PanelContainer/ScrlCont/VBoxContainer.add_child(M_HBC);
			M_Txt=str(M_Acc).substr(5);
			F_GetLb("LbP1_"+M_Txt,M_Txt,100,M_h,M_HBC);
			F_GetBt("Bt1_"+M_Acc,M_Txt,150,M_h,M_HBC).text=F_GetAccTxt(M_Acc);
			
	#Cab Play2
	M_HBC=HBoxContainer.new();
	$PanelContainer/ScrlCont/VBoxContainer.add_child(M_HBC);
	F_GetLb("LbTxPly2"," ",100,M_h,M_HBC);
	F_GetLb("Lbly2","PLAYER 2",150,M_h,M_HBC);
	# Por cada Accion P2
	for Mq in M_LstAcc.size():
		M_Acc=M_LstAcc[Mq];
		if(str(M_Acc).substr(0,5)=="ACT2_"):
			M_HBC=HBoxContainer.new();
			$PanelContainer/ScrlCont/VBoxContainer.add_child(M_HBC);
			M_Txt=str(M_Acc).substr(5);
			F_GetLb("LbP2_"+M_Txt,M_Txt,100,M_h,M_HBC);
			F_GetBt("Bt1_"+M_Acc,M_Txt,150,M_h,M_HBC).text=F_GetAccTxt(M_Acc);
			
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
		var M_LogVis:bool=false;
		F_LogAdd("EVT_on_button_up("+SELF.name+")>",M_LogVis);
		
		var M_Acc:String=SELF.name.substr(4);#Texto del nombre del boton.
		F_LogCom("Acc:"+M_Acc,M_LogVis);
		V_AccName2Scan=M_Acc;
		V_ButtonSell=SELF;
		$LbMsg.visible=true;
		$PanelContainer/ScrlCont.visible=false;
		F_LogDel("...ok",M_LogVis);
	#END If
#END _on_button_up












# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




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
					M_Res="Cod:"+str(M_EvtK.keycode)+" Key:"+String.chr(M_EvtK.keycode);
				#END if Tipos Eventos
				
			#END If Con Acciones
			break;
		#END IF
	#END For
	F_LogCom(M_Res,M_LogVis);
	F_LogDel("<...OK>",M_LogVis);
	
	return M_Res;
#END F_SetTextAcc











func _input(event):
	var M_LogVis:bool=true;
	# Verificar si se está esperando la asignación de una tecla o botón
	if (V_AccName2Scan != ""):
		F_LogAdd("<_input()>",false);
		if event is InputEventKey:
			F_LogAdd("<_input(KEY)>",M_LogVis);
			
			var M_Evts=InputMap.action_get_events(V_AccName2Scan);
			F_LogCom("Evts"+str(M_Evts.size()) ,M_LogVis);
			
			F_LogCom("Dell Evts of "+str(V_AccName2Scan) ,M_LogVis);
			InputMap.action_erase_events(V_AccName2Scan);
			
			M_Evts=InputMap.action_get_events(V_AccName2Scan);
			F_LogCom("Evts"+str(M_Evts.size()) ,M_LogVis);
			
			var M_EvtKey:InputEventKey=event;
			var M_Evt:InputEventKey = InputEventKey.new();
			M_Evt.keycode=M_EvtKey.keycode;# .get_keycode_with_modifiers();
			F_LogCom("Ascii:"+String.chr(M_Evt.keycode) ,M_LogVis);
			F_LogCom("keycodeD:"+str(M_Evt.keycode) ,M_LogVis);
			F_LogCom("keycodeLab:"+str(M_EvtKey.key_label) ,M_LogVis);
			F_LogCom("keycodeLab:"+str(M_EvtKey.to_string() ) ,M_LogVis);
			
			F_LogCom("keycodeMod:"+str(M_EvtKey.get_keycode_with_modifiers()) ,false);
			F_LogCom("keycodeLabMod:"+str(M_EvtKey.get_key_label_with_modifiers()) ,false);
			F_LogCom("keycodePh:"+str(M_EvtKey.physical_keycode) ,false);
			F_LogCom("keycodePhMod:"+str(M_EvtKey.get_physical_keycode_with_modifiers()) ,false);
			
			F_LogCom("Add Evt to "+str(V_AccName2Scan) ,M_LogVis);
			InputMap.action_add_event(V_AccName2Scan, M_Evt);
			
			M_Evts=InputMap.action_get_events(V_AccName2Scan);
			F_LogCom("Evts"+str(M_Evts.size()) ,M_LogVis);
			
			F_LogCom("Bt "+str(V_ButtonSell.name) ,M_LogVis);
			F_LogCom("Bt "+str(V_ButtonSell.name) ,M_LogVis);
			V_ButtonSell.text=F_GetAccTxt(V_AccName2Scan);
			V_AccName2Scan = ""
			$LbMsg.visible=false;
			$PanelContainer/ScrlCont.visible=true;
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
			$LbMsg.visible=false;
			$PanelContainer/ScrlCont.visible=true;
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
				$LbMsg.visible=false;
				$PanelContainer/ScrlCont.visible=true;
			#END Values Maximos
			F_LogDel("<_input(JPM)...Ok>",M_LogVis);
		#END IF JPM
		F_LogAdd("<..OK>",false);
		#END If V_AccName2Scan
#END _input()


