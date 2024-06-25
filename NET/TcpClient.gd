extends Control

var V_TcpClient:StreamPeerTCP= StreamPeerTCP.new();
var V_Tcp_Host:String = "127.0.0.1";
var V_Tcp_Port:int = 4242;


# Called when the node enters the scene tree for the first time.
func _ready():
	F_Tcp_Connect2Srv();
#END _ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if V_TcpClient.get_status() == StreamPeerTCP.STATUS_CONNECTED:
		if V_TcpClient.get_available_bytes() > 0:
			var M_Received_data = V_TcpClient.get_utf8_string(V_TcpClient.get_available_bytes())
			print("Recibido del servidor: ", M_Received_data);
			
		 # Por ejemplo, al presionar Enter
		if (Input.is_action_pressed("ui_select")):
			var M_Msg = "Hola, servidor!";
			V_TcpClient.put_utf8_string(M_Msg)
			V_TcpClient.flush()





	

func F_Tcp_Connect2Srv():
	var M_Res = V_TcpClient.connect_to_host(V_Tcp_Host,V_Tcp_Port);
	if (M_Res != OK):
		print("Error al conectar al servidor: ", M_Res);
		return
	print("Conectado al servidor en ", V_Tcp_Host, ":", V_Tcp_Port);
	set_process(true);
#END F_Tcp_Connect2Srv
