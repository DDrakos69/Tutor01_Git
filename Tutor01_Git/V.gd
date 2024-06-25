extends Node
# - - - - V.gd - - - - - 
# Auto Load
# -Guardar datos globales
# -Intercambio de objetos entre nodos.



#Movimiento personalizado
#var V_Axis:Vector2;
#
#func F_GetAxis()->Vector2:
	#V_Axis.x=int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"));
	#V_Axis.y=int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up"));
	##print(str(V_Axis.x)+" x "+str(V_Axis.y)+" y");
	#return V_Axis.normalized();
#Fin Fnc F_GetAxis



# - Contador de tiempo
var V_TIME:int;
# - Contador de record
var V_SCORE:int;
# - 
var V_TTxt:String;
var V_Init_Ok:bool=false;



# - - GRROUP ( Variables )
# - - GRROUP ( Variables )
# - - GRROUP ( Variables )
var V_Group01:Array=["XXX"];

func F_Group01_Find(M_Name:String):
	var M_Res=null;
	print("F_Group01_Find Max:"+str(V_Group01.size()) +":"+M_Name);
	for M_q in V_Group01.size()-1:
		if(V_Group01[M_q].name==M_Name):
			F_Log(0,"OK:"+str(M_q));
			M_Res=V_Group01[M_q];
			break;
	#END For
	return M_Res;
#END F_GroupFind
	
	
	
#- Reviso que todos los items añadidos al grupo esten ok 
# (Por si modifico algun nombre que me lo avise.)
func F_Group01_Test():
	var M_Res=true;
	for M_q in V_Group01.size():
		if(V_Group01[M_q]==null):
			F_Log(0,"F_Group01_Test() ERROR IN "+str(M_q));
			M_Res=false;
			break;
	#END For
	
	return M_Res;
#END F_GroupFind

# ____ GRROUP ( Variables )
# ____ GRROUP ( Variables )








# - - - - LOG
# - - - - LOG
# - - - - LOG
var V_LogTim:int;
var V_LogRama:int=1;
var V_LogTxt:String="";

func F_Log(M_Acc:int,M_Txt:String="",M_Self:String=""):
	V_LogTim=Time.get_ticks_msec();
	if(M_Acc==1):#Open
		V_LogTxt=": : : : : : : : : : : : : : : : : : : : : ".substr(0,V_LogRama*2)+":¨";
		V_LogRama+=1;
	elif (M_Acc==0):#Coment
		V_LogTxt=": : : : : : : : : : : : : : : : : : : : : ".substr(0,V_LogRama*2);
	elif (M_Acc==2):#Close
		V_LogRama-=1;
		if(V_LogRama<1):V_LogRama=1;print("LOG ERR");
		V_LogTxt=": : : : : : : : : : : : : : : : : : : : : ".substr(0,V_LogRama*2)+":_";
		
	print("[%06d] %s [%s]:%s" % [V_LogTim,V_LogTxt,M_Self,M_Txt]);	
##END F_log
# _______ LOG
# _______ LOG
# _______ LOG














func _init():
	#F_Log(1,"_init()");
	#F_Log(2,"_init()");
	pass
#End _init

func _enter_tree():
	#F_Log(1,"_enter_tree()");
	#F_Log(2,"_enter_tree()");
	pass
#End _enter_tree

func _exit_tree():
	#F_Log(1,"_exit_tree()");
	#F_Log(2,"_exit_tree()");
	pass
#End _exit_tree



func EVT_BtMouseUp():
	F_Log(1,"EVT_BtMouseUp()");
	F_Log(2,"EVT_BtMouseUp()");
#End Fnc EVT_BtMouseUp;
