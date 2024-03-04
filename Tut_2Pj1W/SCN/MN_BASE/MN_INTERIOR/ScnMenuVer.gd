extends Control


@onready var V_VBox = $PanelContainer/VBoxContainer/PanelContainer/ScrlCont/VBoxContainer


var V_Lab:Label;

# NT_ Genera nombres y texto del propio nombre de las acciones.
#- Genero los lables con las acciones.
func F_AddLb(MFechIn:String,MFechOut:String,MAcc:String,MDes:String):
	V_Lab=Label.new();
	V_Lab.text=MFechOut+" : " + MAcc +" - "+MDes;
	V_Lab.size.x=600;
	V_Lab.size.y=20;
	V_Lab.tooltip_text=MFechIn+" : " + MFechOut;
	V_Lab.mouse_filter=Control.MOUSE_FILTER_IGNORE;
	V_VBox.add_child(V_Lab);

#END F_AddLb()




# Called when the node enters the scene tree for the first time.
func _ready():
	F_AddLb("24-03-03:15","24-03-03:15","V1.00","");
	F_AddLb("24-03-04:15","24-03-04:15","ADD","<Cls_Global_Cab> Ya Guarda la Fecha/Hora del inicio partida.");	
	F_AddLb("24-03-04:15","24-03-04:15","ADD","<Cls_Global_Cab> Ya guarda y calcula Horas y Ninutos Jugados");
	F_AddLb("24-03-04:15","24-03-04:15","ADD","Clase Global Cabecera Juego");
	F_AddLb("24-03-04:15","24-03-04:15","ADD","Clase Global Player");
	F_AddLb("24-03-04:15","24-03-04:15","ADD","Clase Global Keys");	
	F_AddLb("24-03-04:15","24-03-04:15","ADD","Ahora borra las ACC.Evt repetidas si existen.");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Game Load");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Game Save");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Inputs");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Sound");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Lenguaje");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Graficos");
	F_AddLb("24-03-03:15","24-03-03:15","ADD","Escena Menu CFG Versiones");
#END _ready():


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
