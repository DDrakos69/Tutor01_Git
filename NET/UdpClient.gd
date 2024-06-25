extends Control
# - - - UdpClient.gd - - 

var V_UdpSrv:UDPServer = UDPServer.new();
var V_Srv_Ip:String = "127.0.0.1";
var V_Srv_Port:int = 4243;
var V_Udp_OnLine:bool=false;


# Called when the node enters the scene tree for the first time.
func _ready():
	F_StartServer();
#END _ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V_Udp_OnLine):F_Udp_Escucha();
#END _process




func F_StartServer():
	var M_Res = V_UdpSrv.listen(V_Srv_Port);
	if M_Res != OK:
		print("CLI Error al iniciar el servidor UDP: ", M_Res);
		V_Udp_OnLine=false;
	else:
		print("CLI Servidor UDP iniciado en el puerto ", V_Srv_Port);
		V_Udp_OnLine=true;
		#set_process(true) # Activa o desactiva el _process
	#END if
#END F_StarServer









func F_Send2Srv(M_Cmd:String,M_Ip:String,M_Port:int):
	if(M_Cmd=="[SEG]"):
			V_UdpSrv.send_packet(
			M_Ip, 
			M_Port, 
			"[SEG]..ok".to_utf8_buffer());
#END F_SendToUdpSrv









func F_Udp_Escucha():
	var M_Packet = V_UdpSrv.get_packet()
	if (M_Packet.size() > 0):
		var M_Sender_ip = V_UdpSrv.get_ .get_packet_ip();
		var M_Sender_port = V_UdpSrv.get_packet_port();
		var M_Received_data = M_Packet.get_string_from_utf8();
		
		print("CLI Recibido: ",
		 M_Received_data, " de ",
		 M_Sender_ip, ":",
		 M_Sender_port);
		
		F_Send2Srv(str(M_Received_data),
		M_Sender_ip,
		M_Sender_port):
			
		if(str(M_Received_data)=="[SEG]"):
			V_UdpCli.send_packet(
			M_Sender_ip, 
			M_Sender_port, 
			"[SEG]..ok".to_utf8_buffer());
#END F_Udp_Escucha





