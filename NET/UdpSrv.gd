# - - UdpSrv.gd - - -
extends Control

#-- Para Escuchar mensajes UDP
var V_UdpSrv:UDPServer = UDPServer.new();
@export var V_SrvIn_Ip:String = "127.0.0.1";
@export var V_SrvIn_Port:int = 4242;

#-- Para mandar mensajes UDP
var V_UdpConex:PacketPeerUDP = PacketPeerUDP.new()
@export var V_SrvOut_Ip:String = "127.0.0.1";
@export var V_SrvOut_Port:int = 4243;


var V_Udp_OnOff:bool=false;

@onready var V_LbConex = $Lb_Conex;
@onready var V_BtOnOff = $BtOnOff;
@onready var V_LbMsgIn = $LbMsgIn;
@onready var V_BtSend = $BtSend;
@onready var V_TxbMsg = $TxbMsg;


# Called when the node enters the scene tree for the first time.
func _ready():
	V_SrvIn_Ip="";
	V_SrvOut_Ip="";
	if(IP.get_local_addresses().size()>0):
		V_SrvIn_Ip=IP.get_local_addresses()[1];
		V_SrvOut_Ip=IP.get_local_addresses()[1];
	
	$TxbOutIp.text=str(V_SrvOut_Ip);
	$TxbInIp.text=str(V_SrvIn_Ip);
	
	$TxbOutPort.text=str(V_SrvOut_Port);
	$TxbInPort.text=str(V_SrvIn_Port);
	
	#F_StartServer();
	pass;
#END _ready





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (V_Udp_OnOff):
		F_Srv_Escucha();
#END _process



   
#-- Reviso si el puerto en este equipo esta o no usado.
func F_Srv_TestPort()->bool:
	var M_Res = V_UdpSrv.listen(V_SrvIn_Port);
	if (M_Res != OK):
		print("Error al iniciar el servidor UDP: ", M_Res);
		return false;
	else:
		print("Servidor UDP iniciado en el puerto ", V_SrvIn_Port);
		return true;
		#set_process(true) # Activa o desactiva el _process
	#END if
#END F_StarServer




#- - Mando un mensaje a una ip y puerto 
func F_Send2Srv(M_Ip:String,M_Port:int,M_Msg:String):
	V_UdpConex.connect_to_host(M_Ip,M_Port);
	V_UdpConex.put_packet(M_Msg.to_utf8_buffer() );
	V_TxbMsg.text="Mandado";
#END F_Send2Srv




func F_Srv_Escucha():
	V_UdpSrv.poll() # Important!
	if (V_UdpSrv.is_connection_available()):
		var M_Conex: PacketPeerUDP = V_UdpSrv.take_connection();#peer
		var M_Packet = M_Conex.get_packet()
		
		V_LbMsgIn.text=str(M_Packet.get_string_from_utf8());
		if(V_LbMsgIn.text=="Ping"):
			
			print("[Ping] from:"+
				str(M_Conex.get_packet_ip())+":"+
				str(M_Conex.get_packet_port())
				);
			#-- Send Pomg
			F_Send2Srv(
				V_SrvOut_Ip,
				V_SrvOut_Port,
				"Pong");
			
		
		print("Accepted peer: %s:%s" %
		 [M_Conex.get_packet_ip(), M_Conex.get_packet_ip()]);
		
		print("Received data: %s" % [M_Packet.get_string_from_utf8()]);
		
		# Reply so it knows we received the message.
		#M_Conex.put_packet(M_Packet)
		# Keep a reference so we can keep contacting the remote peer.
#END F_Udp_Escucha



# - - Desactivo el Servidor
func F_Srv_Off():
	V_UdpSrv.stop()
	V_UdpSrv.poll();
	V_Udp_OnOff=false;
	V_BtOnOff.text="Activar";
	print("Srv Off-Line ("+str(V_SrvIn_Port)+")");
#END F_Srv_Off




# - - Activo el servidor (Si el puerto esta libre.)
func F_Srv_On():
	if(F_Srv_TestPort()):
		V_Udp_OnOff=true;
		V_BtOnOff.text="Des-Activar";
		print("Srv On-Line ("+str(V_SrvIn_Port)+")");
#END F_Srv_On








func _on_BtOnOff_button_up():
	if (V_Udp_OnOff):
		F_Srv_Off();
	else:
		F_Srv_On();
#END Bt_up On Off


func _on_BtSend_button_up():
	F_Send2Srv(V_SrvOut_Ip,V_SrvOut_Port,$TxbMsg.text);
#END Bt_Up mandar mensaje






func _on_txb_out_ip_text_changed():
	V_SrvOut_Ip=$TxbOutIp.text;
	pass # Replace with function body.


func _on_txb_out_port_text_changed():
	V_SrvOut_Port=int($TxbOutPort.text);
	pass # Replace with function body.







func _on_txb_in_ip_text_changed():
	pass # Replace with function body.


func _on_txb_in_port_text_changed():
	F_Srv_Off();
	V_SrvIn_Port=int($TxbInPort.text);	
	F_Srv_On();
	pass # Replace with function body.


