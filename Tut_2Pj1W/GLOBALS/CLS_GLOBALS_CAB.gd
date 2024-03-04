extends Node

class_name  CLS_GLOBALS_CAB
#Cls Globals CAB
# Se carga en GLOBALS
# No responde a eventos del motor solo son funciones de utilidad.
# Se encarga de Generar el array y cargar el array con datos de 
# la cabecera de la partida configuracion de entorno.

func F_LogAdd(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,1);
func F_LogDel(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,0);
func F_LogCom(MTxt:String,MVisible:bool=true):F_Log_(MTxt,MVisible,2);
func F_Log_(MTxt:String,MVisible:bool=true,MAcc:int=2):if(MVisible):V.F_log("ClsGbCab",MTxt,MAcc);


@onready var V_Is2Player:bool=false;# Es una partida a 2 Players
@onready var V_IdCuartoSave:int=-1;# ID Cuarto donde se guarda
@onready var V_IdNivel:int=-1;#ID Nivel Actual
@onready var V_IdSubNivel:int=-1;#ID SubNivel Actual

@onready var V_HorasJugadas:int=0;#Horas Jugadas Calculadas
@onready var V_MinutosJugados:int=0;#Horas Jugadas Calculadas

# Fecha y hora del inicio de la partida.
@onready var V_DateTimeInicioPartida:String;

#Milisegundos del systema del inicio de la partida actual
@onready var V_MSegGameIni:int=999999999;


#Dictionary get_datetime_dict_from_system ( bool utc=false ) const
#Returns the current date as a dictionary of keys: year, month, day, weekday, hour, minute, second, and dst (Daylight Savings Time).

#int get_ticks_usec ( ) const
#Returns the amount of time passed in microseconds since the engine started.




# Defino la fecha y hora del inicio de la partida.
func F_Set_DateTimeIniPartida():
	V_DateTimeInicioPartida=Time.get_datetime_string_from_system();
#END F_Set_DateTimeIniPartida




# Defino los milisegundos al iniciar la partida.
func F_Set_MSegIniPartida():
	V_MSegGameIni=Time.get_ticks_msec();
#END F_Set_MSegIniPartida






# Calculo y añado las horas y los minutos totales jugados.
# Y Reseteo los milisegundos acutales.
func F_Set_HoraMinJugados():
	var M_MSeg=Time.get_ticks_msec()-V_MSegGameIni;
	var M_S:int=(M_MSeg/1000);
	var M_M:int=(M_S/60)+V_MinutosJugados;
	var M_H:int=(M_M/60);
	M_M=M_M-(M_H*60);
	M_H=M_H+V_HorasJugadas;
	V_HorasJugadas=M_H;
	V_MinutosJugados=M_M;
	V_MSegGameIni=Time.get_ticks_msec();
#END F_Set_HoraMinJugados





# Obtengo un string con las Horas y Minutos sin modificarlos.
func F_Get_HoraMinJugados()->String:
	var M_MSeg=Time.get_ticks_msec()-V_MSegGameIni;
	var M_S:int=(M_MSeg/1000);
	var M_M:int=(M_S/60)+V_MinutosJugados;
	var M_H:int=(M_M/60);
	M_M=M_M-(M_H*60);
	M_H=M_H+V_HorasJugadas;
	return "H:"+str(M_H)+" M:"+str(M_M);
#END F_Set_HoraMinJugados



# Generamos un array con la confiracion del teclado para guardar en fichero.
func F_GetArray()->Array:
	var M_LogVis:bool=true;
	F_LogAdd("F_GetArray()>",M_LogVis);
	var M_T:Array=[];
	
	M_T.append(V_Is2Player);
	M_T.append(V_IdCuartoSave);
	M_T.append(V_IdNivel);
	M_T.append(V_IdSubNivel);
	M_T.append(V_HorasJugadas);
	M_T.append(V_MinutosJugados);
	
	F_LogCom("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()




#Analizamos el Array pasado de Keys y configuro las Acciones y sus eventos.
func F_SetArray(ArrayCfg:Array):
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

