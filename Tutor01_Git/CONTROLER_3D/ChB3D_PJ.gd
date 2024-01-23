extends CharacterBody3D

func F_Log(M_Acc:int,M_Txt:String=""):
	V.F_Log(M_Acc,M_Txt,self.name);
#END F_log


var V_MoveAxis:Vector2;

# Velocidad de movimiento
var V_Speed:float = 1.0;
# Velocidad de salto.
const V_JUMP_VELOCITY = 8.5;
# Get the gravity from the project settings to be synced with RigidBody nodes.
var V_Gravity = ProjectSettings.get_setting("physics/3d/default_gravity");
var V_Direction:Vector3=Vector3(0,0,-1);


var V_CamCont:Node3D;# Controlador de la camara .
var V_CamLookAt:Node3D;# Objeto delante de la camara apuntar a.
var V_Luz:Node3D;# Objeto Brazo

# Indica si ya se ha cargado ESTE Ready
var V_ReadyOk=false;

#- Lo cargo a parte ya que aqui el ready aun no tienen todos los controles.
func F_Ready():
	V_ReadyOk=true;
	F_Log(1,"F_Ready");
	
	# - Definismo si muestra o no el cursor (Captura los datos.)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	
	#- Obtengo de mi lista la referencia al CameraControler.
	V_CamCont=V.F_Group01_Find("CamCont_N3D");
	V_CamLookAt=V.F_Group01_Find("LoockAt_N3D");
	V_Luz=V.F_Group01_Find("SpotLight3D");
	F_Log(0,"CamCont:"+str(V_CamCont));
	F_Log(0,"CamLoock:"+str(V_CamLookAt));
	F_Log(0,"V_Luz:"+str(V_Luz));
	
	#- Asi se hace usando los grupos de nodos por godot.
	# No funciona o no se hacerlo. no consigo que caste a array de tipo node3D
	#var Arr_Gr=get_tree().get_nodes_in_group("GRP_PJ1")[0] as Node3D;
	#V_CamCont=Arr_Gr.get_node("LoockAt_N3D") as Node3D;
	#F_Log(0,"Cam:"+str(Arr_Gr));
	#F_Log(0,"Cam:"+str(V_CamCont));
	
	F_Log(2,"F_Ready");
#END F_Ready









func _ready():
	F_Log(1,"_ready()");
	F_Log(2,"_ready()");



func _input(event):
	#if(event is InputEventMouseMotion):
		#rotate_object_local(Vector3.UP,event.relative.x*0.01);
		#rotate_object_local(Vector3.LEFT,event.relative.y*0.01);
		
		#rotate(Vector3.UP,event.relative.x*0.01);
		#rotate(Vector3.LEFT,event.relative.y*0.01);
		
		#rotate(global_transform.basis.y.normalized(),event.relative.x*0.01);
		
	#END if Mouse Motion	
	pass
#END _input


func _physics_process(delta):
	if(V.V_Init_Ok):
		if(!V_ReadyOk):F_Ready();
		
		F_Gravity(delta);
		F_Jump();
		F_Rota();
		F_Move();
		
		#-- Si el N3D esta asignado igualo su posicion a la del keko
		#- Esto lo hago asi para poder liberar la camara si quiero.
		if(V_CamCont!=null):
			V_CamCont.global_position=global_position;

#END _physics_process()


func _process(delta):
	pass


func F_Rota():
	#rotation=Vector3(rotation.x, V_CamCont.rotation.y,rotation.z);
	V_Luz.rotation=Vector3(
		V_CamCont.rotation.x, 
		V_Luz.rotation.y,
		V_Luz.rotation.z);
	
	look_at(Vector3(
		V_CamLookAt.global_position.x,
		global_position.y,
		V_CamLookAt.global_position.z));
	$"../UI/VBoxContainer/RotCam_lb".text="CamCont.Rot"+str(V_CamCont.rotation);
	$"../UI/VBoxContainer/RotPj_lb".text="ChB3D.Rot"+str(rotation);
	
	
	
#END F_Rota


func F_Move():
	#var input_dir = Input.get_vector("UI1_LEFT", "UI1_RIGHT", "UI1_UP", "UI1_DOWN");
	V_MoveAxis.x=int(Input.is_action_pressed("UI1_LEFT"))-int(Input.is_action_pressed("UI1_RIGHT"));
	V_MoveAxis.y=int(Input.is_action_pressed("UI1_UP"))-int(Input.is_action_pressed("UI1_DOWN"));
	$"../UI/VBoxContainer/PosPj_lb".text="Axis"+str(V_MoveAxis);
	
	#- Normalizar es sacar obtener R(Raiz2(X*X + Y*Y + Z*Z)) y V3d Res = X/R,Y/R,Z/R
	#- Se hace para que en diagonal se desplace mas lento.
	V_MoveAxis=V_MoveAxis.normalized();
	$"../UI/VBoxContainer/PosPj1_lb".text="AxisN"+str(V_MoveAxis);
	
	# Transform hace referencia a la matriz de posicion rotacion y escala del
	# propio characterbody3d
	#[A1,A2,A3] [Vx] =[A1*Vx + A2*Vx + A3*Vx] = Vxf
	#[B1,B2,B3] [Vy] =[B1*Vy + B2*Vy + B3*Vy] = Vyf
	#[C1,C2,C3] [Vz] =[C1*Vz + C2*Vz + C3*Vz] = Vzf
	var direction = (transform.basis * Vector3(V_MoveAxis.x, 0, -V_MoveAxis.y));
	
	
	$"../UI/VBoxContainer/PosPj2_lb".text="transform:"+str(transform);
	$"../UI/VBoxContainer/PosPj3_lb".text="basis:"+str(transform.basis);
	$"../UI/VBoxContainer/PosPj4_lb".text="Direct:"+str(direction);
	if direction:
		velocity.x = direction.x * V_Speed;
		velocity.z = direction.z * V_Speed;
		if(V_Speed<8):V_Speed+=0.3;
	else:#- Efecto de frenada
		V_Speed=1;
		velocity.x = move_toward(velocity.x, 0, 0.06);
		velocity.z = move_toward(velocity.z, 0, 0.06);
		
	
	
	
	
	
	#if(Input.is_action_pressed("UI1_CAM_LEFT")):
		#rotate_y(-0.01);
	#if(Input.is_action_pressed("UI1_CAM_RIGHT")):
		#rotate_y(0.01);
	
	
	
	#if(is_on_floor()):
	#V_MoveAxis.x=int(Input.is_action_pressed("UI1_LEFT"))-int(Input.is_action_pressed("UI1_RIGHT"));
	#V_MoveAxis.y=int(Input.is_action_pressed("UI1_UP"))-int(Input.is_action_pressed("UI1_DOWN"));
	#V_MoveAxis=V_MoveAxis.normalized();
	#END IF On Floor
	#velocity.x=V_MoveAxis.x*V_SPEED;
	#velocity.z=V_MoveAxis.y*-V_SPEED;

	#velocity.x=move_toward(velocity.x,0,V_SPEED);
	#velocity.z=move_toward(velocity.z,0,V_SPEED);
	#var M_Dir=$Camera3D.rotation_degrees.y;
	#V_Direction= Vector3(
		#cos(deg2rad(M_Dir)), 0, 
		#sin(deg2rad(M_Dir)));
		#

	
	move_and_slide();
#END F_Movimiento


func F_Gravity(delta):
	#F_Log("F_Gravity");
	if(!is_on_floor()):
		velocity.y -= V_Gravity*delta;
	#END If in floor
#END F_Gravity


func F_Jump():
	
	if(is_on_floor()):
		if(Input.is_action_just_pressed("ui_accept")):
			F_Log(0,"F_Jump");
			velocity.y=V_JUMP_VELOCITY;
		#END if Press Accept
	#END if on floor
#END F_Jump

