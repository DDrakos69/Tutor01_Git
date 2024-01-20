extends CharacterBody3D

var V_LogTim="";
func F_Log(M_Txt:String):
	V_LogTim=str(Time.get_ticks_msec());
	print("["+V_LogTim+"]"+M_Txt);
#END F_log


var V_MoveAxis:Vector2;
# Velocidad de movimiento
const V_SPEED = 5.0;
# Velocidad de salto.
const V_JUMP_VELOCITY = 8.5;
# Get the gravity from the project settings to be synced with RigidBody nodes.
var V_Gravity = ProjectSettings.get_setting("physics/3d/default_gravity");



func F_Rota():
	#F_Log("F_Rota");
	if(Input.is_action_just_pressed("UI1_SPACE")):
		F_Log(" - Right");
	#END If Key_Right
#END F_Rota
	

func _ready():
	# - Definismo si muestra o no el cursor (Captura los datos.)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	pass
#END _Ready

func F_Move():
	if(Input.is_action_pressed("UI1_CAM_LEFT")):
		rotate_y(-0.01);
	if(Input.is_action_pressed("UI1_CAM_RIGHT")):
		rotate_y(0.01);
	
	#if(is_on_floor()):
	V_MoveAxis.x=int(Input.is_action_pressed("UI1_LEFT"))-int(Input.is_action_pressed("UI1_RIGHT"));
	V_MoveAxis.y=int(Input.is_action_pressed("UI1_UP"))-int(Input.is_action_pressed("UI1_DOWN"));
	V_MoveAxis=V_MoveAxis.normalized();
	#END IF On Floor
	velocity.x=V_MoveAxis.x*V_SPEED;
	velocity.z=V_MoveAxis.y*-V_SPEED;

	#velocity.x=move_toward(velocity.x,0,V_SPEED);
	#velocity.z=move_toward(velocity.z,0,V_SPEED);
	
	move_and_slide();

#END F_Movimiento


func F_Gravity(delta):
	#F_Log("F_Gravity");
	if(!is_on_floor()):
		velocity.y -= V_Gravity*delta;
	#END If in floor
#END F_Gravity


func F_Jump():
	
	#if(is_on_floor()):
	if(Input.is_action_just_pressed("ui_accept")):
		F_Log("F_Jump");
		velocity.y=V_JUMP_VELOCITY;
	#END if Press Accept
	#END if on floor
	
#END F_Jump


func _input(event):
	if(event is InputEventMouseMotion):
		#rotate_object_local(Vector3.UP,event.relative.x*0.01);
		#rotate_object_local(Vector3.LEFT,event.relative.y*0.01);
		
		#rotate(Vector3.UP,event.relative.x*0.01);
		#rotate(Vector3.LEFT,event.relative.y*0.01);
		
		rotate(global_transform.basis.y.normalized(),event.relative.x*0.01);
		
	#END if Mouse Motion	
#END _input


func _physics_process(delta):
	#F_Log("_physics_process");
	
	
	F_Rota();
	F_Gravity(delta);
	F_Jump();
	F_Move();
	
	# Limitamos la rotacion para que no sea completa.
	rotation.y=clamp(rotation.y,-1,1);
	
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = V_JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * V_SPEED
		#velocity.z = direction.z * V_SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, V_SPEED)
		#velocity.z = move_toward(velocity.z, 0, V_SPEED)
#
	#move_and_slide()
#END _physics_process()
