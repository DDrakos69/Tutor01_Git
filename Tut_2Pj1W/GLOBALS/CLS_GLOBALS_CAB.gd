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
#La Base se divide en Zonas y la zona se divide en niveles
#Solo en algunosnivels se puede guardar.
@onready var V_IdBase:int=-1;#ID Base actual
@onready var V_IdZona:int=-1;#ID Zona de la base
@onready var V_IdNivel:int=-1;#ID Nivel de la zona de la base.
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
	
	M_T.append(V_IdBase);
	M_T.append(V_IdNivel);
	M_T.append(V_IdZona);
	
	M_T.append(V_HorasJugadas);
	M_T.append(V_MinutosJugados);
	M_T.append(V_DateTimeInicioPartida);
	
	F_LogCom("Res:"+str(M_T),M_LogVis);
	return M_T;
#END F_KeysGetArray()




#Analizamos el Array pasado de Keys y configuro las Acciones y sus eventos.
func F_SetArray(ArrayCfg:Array):
	var M_LogVis:bool=true;
	F_LogAdd("F_KeysSetArray()",M_LogVis);
	var Mq:int=0;
	if(ArrayCfg.size()==6):
		
		V_Is2Player=ArrayCfg[Mq];Mq=Mq+1;
		
		V_IdBase=ArrayCfg[Mq];Mq=Mq+1;
		V_IdNivel=ArrayCfg[Mq];Mq=Mq+1;
		V_IdZona=ArrayCfg[Mq];Mq=Mq+1;
		
		V_HorasJugadas=ArrayCfg[Mq];Mq=Mq+1;
		V_MinutosJugados=ArrayCfg[Mq];Mq=Mq+1;
		V_DateTimeInicioPartida=ArrayCfg[Mq];Mq=Mq+1;
		
	#END If Array
	F_LogDel("F_KeysSetArray()",M_LogVis); 
#END F_KeysSetArray

