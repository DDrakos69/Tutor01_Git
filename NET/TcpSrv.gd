extends Control


var V_TcpSrv := TCPServer.new()
var V_Tcp_Clients := []
var V_Tcp_Port:int=4242;


# Called when the node enters the scene tree for the first time.
func _ready():
	F_Tcp_Start_Srv();
#END _ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if server.is_connection_available():
		var client = server.take_connection()
		if client:
			clients.append(client)
			print("Cliente conectado: ", client.get_connected_host())

	for client in clients:
		if client.get_available_bytes() > 0:
			var received_data = client.get_utf8_string(client.get_available_bytes())
			print("Recibido: ", received_data)
			client.put_utf8_string("Eco: " + received_data)
			client.flush()
#END _process


	

func F_Tcp_Start_Srv():
	var M_Res = V_TcpSrv.listen(V_Tcp_Port);
	if M_Res != OK:
		print("Error al iniciar el servidor: ", M_Res);
		return
	print("Servidor iniciado en el puerto: ", V_Tcp_Port);
	set_process(true);
#END F_Tcp_Start_Srv

