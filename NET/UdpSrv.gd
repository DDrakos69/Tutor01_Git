# - - UdpSrv.gd - - -
extends Control

var V_UdpSrv:UDPServer = UDPServer.new();
var V_Srv_Ip:String = "127.0.0.1";
var V_Srv_Port:int = 4242;
var V_Udp_OnLine:bool=false;
var V_Srv_LstCon = [];








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
		print("Error al iniciar el servidor UDP: ", M_Res);
		V_Udp_OnLine=false;
	else:
		print("Servidor UDP iniciado en el puerto ", V_Srv_Port);
		V_Udp_OnLine=true;
		#set_process(true) # Activa o desactiva el _process
	#END if
#END F_StarServer





func F_Udp_Escucha():
	var M_Packet = V_UdpSrv.get_packet()
	if M_Packet.size() > 0:
		var M_Sender_ip = V_UdpSrv.get_packet_ip()
		var M_Sender_port = V_UdpSrv.get_packet_port()
		var M_Received_data = M_Packet.get_string_from_utf8()
		
		print("Recibido: ",
		 M_Received_data, " de ",
		 M_Sender_ip, ":",
		 M_Sender_port);
		
		if(str(M_Received_data)=="[SEG]"):
			V_UdpCli.send_packet(
			M_Sender_ip, 
			M_Sender_port, 
			"[SEG]".to_utf8_buffer());
#END F_Udp_Escucha





A simple server that opens a UDP socket and returns connected PacketPeerUDP upon receiving new packets. See also PacketPeerUDP.connect_to_host().

After starting the server (listen()), you will need to poll() it at regular intervals (e.g. inside Node._process()) for it to process new packets, delivering them to the appropriate PacketPeerUDP, and taking new connections.

Below a small example of how it can be used:












func _ready():
	server.listen(4242)

func _process(delta):
	server.poll() # Important!
	if server.is_connection_available():
		var peer: PacketPeerUDP = server.take_connection()
		var packet = peer.get_packet()
		print("Accepted peer: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
		print("Received data: %s" % [packet.get_string_from_utf8()])
		# Reply so it knows we received the message.
		peer.put_packet(packet)
		# Keep a reference so we can keep contacting the remote peer.
		peers.append(peer)

	for i in range(0, peers.size()):
		pass # Do something with the connected peers.

# client_node.gd
class_name ClientNode
extends Node

var udp := PacketPeerUDP.new()
var connected = false

func _ready():
	udp.connect_to_host("127.0.0.1", 4242)

func _process(delta):
	if !connected:
		# Try to contact server
		udp.put_packet("The answer is... 42!".to_utf8_buffer())
	if udp.get_available_packet_count() > 0:
		print("Connected: %s" % udp.get_packet().get_string_from_utf8())
		connected = true


