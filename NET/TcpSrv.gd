extends Control


var V_TcpSrv:TCPServer = TCPServer.new()
var V_Lst_StreamPeerTCP:=[];
@export var V_TcpSrv_Port:int=4242;
var V_TcpSrv_OnOff:bool=false;


var V_TcpClient:StreamPeerTCP= StreamPeerTCP.new();
var V_TcpCli_Host:String = "127.0.0.1";
var V_TcpCli_Port:int = 4242;





# "*" (default), listen on all (IPv4 and IPv6).
# "0.0.0.0" (for IPv4)
# "::" (for IPv6)
#("192.168.1.101", "::1", etc), the server only listen


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#END _ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V_TcpSrv_OnOff):
		F_Tcp_Srv_Escucha();
		
	if(V_Lst_StreamPeerTCP.size()>0):
		F_Tcp_RevisaConexiones();
		
	#V_TcpSrv.listen()
	#if (V_TcpSrv.is_connection_available()):
		#var client = V_TcpSrv.take_connection()
		#if client:
			#clients.append(client)
			#print("Cliente conectado: ", client.get_connected_host())
#
	#for client in clients:
		#if client.get_available_bytes() > 0:
			#var received_data = client.get_utf8_string(client.get_available_bytes())
			#print("Recibido: ", received_data)
			#client.put_utf8_string("Eco: " + received_data)
			#client.flush()
	
#END _process



func F_Tcp_Srv_Escucha():
	V_TcpSrv.listen(V_TcpSrv_Port,"0.0.0.0");
	if (V_TcpSrv.is_connection_available()):
		var M_TcpSrv_Conex = V_TcpSrv.take_connection()
		if(M_TcpSrv_Conex):
			V_Lst_StreamPeerTCP.append(M_TcpSrv_Conex);
			print("[TCP Conex Open]"+ 
			str(M_TcpSrv_Conex.get_connected_host())+":"+
			str(M_TcpSrv_Conex.get_connected_port())+" LocalPort:"+
			str(M_TcpSrv_Conex.get_local_port())+" Status:"+
			str(M_TcpSrv_Conex.get_status())
			);
#END F_Tcp_Srv_Escucha



func F_Tcp_RevisaConexiones():
	var M_StreamPeerTCP:StreamPeerTCP;
	var M_Stdo="";
	for M_q in V_Lst_StreamPeerTCP.size():
		M_StreamPeerTCP=V_Lst_StreamPeerTCP[M_q];
		M_Stdo+= "[TCP Conex Open]";
		M_Stdo+= "IP:"+str(M_StreamPeerTCP.get_connected_host());
		M_Stdo+= ":" + str(M_StreamPeerTCP.get_connected_port());
		M_Stdo+= " LocalPort:"+str(M_StreamPeerTCP.get_local_port());
		M_Stdo+= " Status:"+str(M_StreamPeerTCP.get_status());
		M_Stdo+="\r\n";
	#END For
#END F_Tcp_RevisaConexiones
	



func F_Tcp_Srv_On():
	if(V_TcpSrv_OnOff==false):
		var M_Res = V_TcpSrv.listen(V_TcpSrv_Port,"0.0.0.0");
		if (M_Res != OK):
			print("[TCP... ERR]"+str(M_Res));
		else:
			V_TcpSrv_OnOff=true;
			print("[TCP... ON]"+str(M_Res));
#END F_Tcp_Srv_On




func F_Tcp_Srv_Off():
	if(V_TcpSrv_OnOff):
		V_TcpSrv.stop();
		V_TcpSrv_OnOff=false;
		print("[TCP... OFF]");
#END F_Tcp_Srv_Off





func F_Tcp_Connect2Srv():
	var M_Res = V_TcpClient.connect_to_host(V_TcpCli_Host,V_TcpCli_Port);
	if (M_Res != OK):
		print("Error al conectar al servidor: ", M_Res);
		return
	print("Conectado al servidor en ", V_TcpCli_Host, ":", V_TcpCli_Port);
	set_process(true);
#END F_Tcp_Connect2Srv


