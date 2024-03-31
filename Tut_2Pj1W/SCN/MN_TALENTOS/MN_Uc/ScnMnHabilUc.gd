extends Node2D


#- - Referencia a la habilidades
var V_ClsHabS:Cls_Habilidades;
#- - Referencia a la habilidad.
var V_ClsHab:Cls_Habilidad;


@onready var V_MnUcHab = $".";

@onready var V_RecMarco = $RecMarco




# Called when the node enters the scene tree for the first time.
func _ready():
	F_Refresh();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(V_ClsHab!=null):
		if(V_ClsHab.V_NeedUpdate):
			F_Refresh();
			V_ClsHab.V_NeedUpdate=false;
#END _process






# Refrescamos el estado de este control.
func F_Refresh():
	if(V_ClsHab!=null):
		
		if(V_ClsHab.V_Bloqueado_Actual):
			if(V_ClsHab.V_Activo):
				V_RecMarco.texture=preload("res://Blender/Marcos30x30Green.png");
			else:
				V_RecMarco.texture=preload("res://Blender/Marcos30x30Grey.png");
			
		else:
			if(V_ClsHab.V_Activo):
				V_RecMarco.texture=preload("res://Blender/Marcos30x30Green.png");
			else:
				V_RecMarco.texture=preload("res://Blender/Marcos30x30Blue.png");
			
		V_MnUcHab.visible=V_ClsHab.V_Visible_Actual;
		$RecMarco/LbTit.text=tr(V_ClsHab.V_Nom);
		$RecMarco/LbDes.text=tr(V_ClsHab.V_Desc);
		$".".position.x=V_ClsHab.V_X;
		$".".position.y=V_ClsHab.V_Y;
		print("Refresh:"+V_ClsHab.V_Nom);
		print("Nom:"+ V_ClsHab.V_Nom + " = " +tr(V_ClsHab.V_Nom));
		print("Des:"+V_ClsHab.V_Desc + " = " +tr(V_ClsHab.V_Desc));
		
	#END If Nodo OK
#END F_Refresh




func _on_bt_button_up():
	if(V_ClsHab!=null):
		if(!V_ClsHab.V_Bloqueado_Actual):
			V_ClsHabS.F_Point_Set(V_ClsHab.V_ID);





func _on_bt_MouseEntered():
	if(V_ClsHab!=null):
		if(!V_ClsHab.V_Bloqueado_Actual):	
			V_RecMarco.texture=preload("res://Blender/Marcos30x30Yelow.png");



func _on_bt_MouseExited():
	if(V_ClsHab!=null):
		if(!V_ClsHab.V_Bloqueado_Actual):
			V_RecMarco.texture=preload("res://Blender/Marcos30x30Blue.png");
