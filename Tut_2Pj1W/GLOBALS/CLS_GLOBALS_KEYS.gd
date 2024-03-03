extends Node
class_name  Cls_Globals_Keys
#Cls Globals Keys
# Se carga en GLOBALS
# No responde a eventos del motor solo son funciones de utilidad.
# Se encarga de generar o configurar las acciones y sus eventos
# Para guardar en fichero y cargar de el la configuracion de teclado.

func F_LogAdd(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,1);
func F_LogDel(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,0);
func F_LogCom(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,2);
func F_Log_(MTxt:String,MVisible:bool=true,MAcc:int=2):if(MVisible):V.F_log("UI_Inputs",MTxt,MAcc);

# Generamos un array con la confiracion del teclado para guardar en fichero.
func F_KeysGetArray()->Array:
	var M_LogVis:bool=true;F_LogAdd("F_KeysGetArray()>",M_LogVis);
	var M_TAcc:Array=[];
	var M_TEvt:Array=[];
	var M_Evt;
	var M_LstAcc:Array=InputMap.get_actions();
	var M_Acc:String="";
	
	F_LogCom("Accs:"+str(M_LstAcc.size()),M_LogVis);
	for Mq in M_LstAcc.size():
		M_Acc=M_LstAcc[Mq]
		
		if(str(M_Acc).substr(0,5)=="ACT1_"|| str(M_Acc).substr(0,5)=="ACT2_"):
			M_Evt=InputMap.action_get_events(M_Acc);
			F_LogCom("Acc:"+M_Acc+" Evts:"+str(M_Evt.size()),M_LogVis);
			#Sin Eventos =-1
			if(M_Evt.size()==0):
				M_TEvt=[M_Acc,-1];
			#Con Eventos
			if(M_Evt.size()>0):
				M_Evt=M_Evt[0];
				#Else JoyPadBt=1
				if(M_Evt is InputEventJoypadButton):
					var M_EvtB:InputEventJoypadButton=M_Evt;
					M_TEvt=[M_Acc,1,M_EvtB.device,M_EvtB.button_index];
					F_LogCom("Tipe:JPB:"+str(M_TEvt),M_LogVis);
				#Else JoyPadMot=2
				elif(M_Evt is InputEventJoypadMotion):
					var M_EvtM:InputEventJoypadMotion=M_Evt;
					M_TEvt=[M_Acc,2,M_EvtM.device,M_EvtM.axis,M_EvtM.axis_value];
					F_LogCom("Tipe:JPM:"+str(M_TEvt),M_LogVis);
				#Else Key =3
				elif(M_Evt is InputEventKey):
					var M_EvtK:InputEventKey=M_Evt;
					M_TEvt=[M_Acc,3,M_EvtK.keycode];
					F_LogCom("Tipe:KEY:"+str(M_TEvt),M_LogVis);
			#END if Tipos Eventos
			M_TAcc.append(M_TEvt);
		#END If Con Acciones ACT1_ y ACT2_
	#END For Todas las acciones
	F_LogCom("Res:"+str(M_TAcc),M_LogVis);
	return M_TAcc;
#END F_KeysGetArray()




#Analizamos el Array pasado de Keys y configuro las Acciones y sus eventos.
func F_KeysSetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	F_LogAdd("F_KeysSetArray()",M_LogVis);
	# Seria [ [NomAcc,TipoAcc,Par1,Par2,Parx],[NomAcc,TipoAcc,Par1,Par2,Parx],..]
	var M_TAccs:Array=ArrayCfg;
	var M_TEvt:Array=[];
	var M_LstAcc:Array=InputMap.get_actions();
	var M_Acc:String="";
	var M_PosAcc:int=-1;
	var M_EvtJPB:InputEventJoypadButton;
	var M_EvtJPM:InputEventJoypadMotion;
	var M_EvtKEY:InputEventKey;
	
	F_LogCom("Array:"+str(ArrayCfg),M_LogVis);
	F_LogCom("Accs:"+str(M_LstAcc.size()),M_LogVis);
	
	for Mq in M_LstAcc.size():
		M_Acc=M_LstAcc[Mq]
		if(str(M_Acc).substr(0,5)=="ACT1_" || str(M_Acc).substr(0,5)=="ACT2_"):
			
			#Busco la posicion donde esta esa CFG.
			for Mq1 in M_TAccs.size():
				if(M_TAccs[Mq1][0]==M_Acc):
					M_PosAcc=Mq1;
					break;
			#END For Busco ACCION
			F_LogCom("ACC:"+M_Acc+" PosAcc:"+str(M_PosAcc),M_LogVis);
			
			#Si tengo esta Accion en la tabla la analizo.
			if(M_PosAcc>-1):
				M_TEvt=M_TAccs[M_PosAcc];# Cargo el Array de las acciones (Solo sera 1)
				if(M_TEvt.size()>1):
					#Col0=Nombre Accion
					#Col1=TipoAccion (-1=NoDef 1=JoyPadBt 2=JoyPadMot 3=Key)
					if(M_TEvt[1]==-1):#NoDef [M_Acc,-1];
						InputMap.action_erase_events(M_Acc);
					elif(M_TEvt[1]==1):#JoyPadBt [M_Acc,1,M_EvtB.device,M_EvtB.button_index];
						F_LogCom("Set JPB:"+str(M_TEvt),M_LogVis);
						InputMap.action_erase_events(M_Acc);
						M_EvtJPB=InputEventJoypadButton.new();
						M_EvtJPB.device=M_TEvt[2];
						M_EvtJPB.button_index=M_TEvt[3];
						InputMap.action_add_event(M_Acc,M_EvtJPB);
					elif(M_TEvt[1]==2):#JoyPadMt [M_Acc,2,M_EvtM.device,M_EvtM.axis,M_EvtM.axis_value];
						F_LogCom("Set JPM:"+str(M_TEvt),M_LogVis);
						InputMap.action_erase_events(M_Acc);
						M_EvtJPM=InputEventJoypadMotion.new();
						M_EvtJPM.device=M_TEvt[2];
						M_EvtJPM.axis=M_TEvt[3];
						M_EvtJPM.axis_value=M_TEvt[4];
						InputMap.action_add_event(M_Acc,M_EvtJPM);
					elif(M_TEvt[1]==3):#Key [M_Acc,3,M_EvtK.keycode];
						M_EvtKEY=InputEventKey.new();
						M_EvtKEY.keycode=M_TEvt[2];
						F_LogCom("Set KEY:("+M_Acc+"):" +str(M_EvtKEY),M_LogVis);
						InputMap.action_erase_events(M_Acc);
						InputMap.action_add_event(M_Acc,M_EvtKEY);
						F_LogCom("=("+str(InputMap.action_get_events(M_Acc)[0])+"):",M_LogVis);
					#END If Else Tipos de Eventos.
				#END If con almenos 2 Cols
			#END If Con Accion en el Array
		#End if La Accion es ACT1_ o ACT2_
	#END For Acciones totales
	F_LogDel("F_KeysSetArray()",M_LogVis); 
#END F_KeysSetArray
