extends Node2D


var V_HPs1:Cls_Habilidades;
var V_H:Cls_Habilidad;
var V_NodoSell:Node2D;


# Called when the node enters the scene tree for the first time.
func _ready():
	V_HPs1=V.V_ClsHabil_Play1;
	for M_q in V_HPs1.V_Lista.size():
		V_H=V_HPs1.V_Lista[M_q];
		var M_n:Node2D=($NinePatchRect/UcHabil).duplicate();
		M_n.add_child($NinePatchRect);
		M_n.V_ClsHabS=V_HPs1;
		M_n.V_ClsHab=V_H;
		M_n.name="UcHabil_"+V_H.V_ID;
		$".".add_child(M_n);
		M_n.position.x=V_H.V_X;
		M_n.position.y=V_H.V_Y;
		V_H.V_Node=M_n;
		V_H.V_Node.F_Refresh();
	#	print("NodosI:"+M_n.name);
	#END For Creamos los UCS
	
	#for M_q in ($".").get_child_count():
	#	print("Nodos:"+($".").get_child(M_q).name);
	#END For Asignamos al padre
	






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_BtIngES_button_up():
	TranslationServer.set_locale("ES");
	F_UcsRefresh();
#END _on_BtIngES_button_up



func _on_BTLngEN_button_up():
	TranslationServer.set_locale("EN");
	F_UcsRefresh();
#END _on_BTLngEN_button_up



# - Forzamos el refresco de los UCs.
func F_UcsRefresh():
	V_HPs1.F_Refresh(true);
#END F_UcsRefres


func _on_BtSave_button_up():
	V.F_TEST_SaveGame();
	


func _on_BtLoad_button_up():
	V.F_TEST_LoadGame();
	
