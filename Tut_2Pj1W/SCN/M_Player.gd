extends CharacterBody3D

var CLog:Cls_LogLine=Cls_LogLine.new("MPlayer");


const SPEED = 1.6
const JUMP_VELOCITY = 3.5

@onready var V_lb_10 = $Control/VBoxContainer/Lb_10;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var V_IsWalking:bool=false; #- guardara cuando el keko este caminando.
@onready var V_anim_player = $PlayerControler_N3D/player_N3D/AnimationPlayer
@onready var V_PlayerControler = $PlayerControler_N3D


func _ready():
	#- Compartimos este propio player
	V.F_PlayerSet(self);
	V.F_PlayerCamPointSet($CamPoint_N3D);
	
	
	#- Añadimos a las animaciones de andar y Reposo un periodo de 
	#  mezcla de 0,2seg.-
	V_anim_player.set_blend_time("walk","idle",0.2);
	V_anim_player.set_blend_time("idle","walk",0.2);
	
#END _Ready



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ACT1_JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#- Solo desplazo si estamos en el suelo
	if (is_on_floor() ):
	
		var M_Input_V3d = Input.get_vector("ACT1_LEFT","ACT1_RIGHT","ACT1_FRONT","ACT1_BACK");
		var M_Dir_V3d=Vector3(M_Input_V3d.x, 0, M_Input_V3d.y);
		var M_DirTrans_V3d=(transform.basis * M_Dir_V3d);
		var M_DirTransNorm_V3d = M_DirTrans_V3d.normalized();
		var M_Position_V3d = position;
		
		$Control/VBoxContainer/Lb_1.text="IN:"+str(M_Input_V3d);
		$Control/VBoxContainer/Lb_2.text="DIR:"+str(M_Dir_V3d);
		$Control/VBoxContainer/Lb_3.text="TRANS"+str(transform.basis);
		$Control/VBoxContainer/Lb_4.text="DIR t:"+str(M_DirTrans_V3d);
		$Control/VBoxContainer/Lb_5.text="DIR t+n:"+str(M_DirTransNorm_V3d);
		$Control/VBoxContainer/Lb_6.text="POS:"+str(M_DirTransNorm_V3d);	
		
		$Control/VBoxContainer/Lb_7.text="CAM F:"+str(V.V_CamFront.position);
		$Control/VBoxContainer/Lb_8.text="CAM B:"+str(V.V_CamBack.position);
		
		
		
		
		if M_Dir_V3d:
			velocity.x = M_Dir_V3d.x * SPEED
			velocity.z = M_Dir_V3d.z * SPEED
			
			#- Miramos hacia nuestra direcion segun el vector
			# generado desde nuestro teclado y normalizado
			# OJO en el punto 0 del mundo las coordenadas se invierten
			# Esto hace que el keko rote del todo.
			#V_PlayerControler.look_at(direction);
			
			# Al sumarle nuestra posicion en el mundo seremos 
			# nostros el centro
			V_PlayerControler.look_at(M_Dir_V3d+M_Position_V3d);
			
			#- Si NO estoy ya camiando , me pongo a caminar e
			# inicio la animacion en bucle de Caminar.
			# para que la animacion solo se ejute una vez
			if(!V_IsWalking):
				V_IsWalking=true;
				V_anim_player.play("walk");
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			
			#- Si SI estoy ya camiando , Dejo de caminar e
			# inicio la animacion en bucle de reposo.
			if(V_IsWalking):
				V_IsWalking=false;
				V_anim_player.play("idle");
	#END if IsInfloor
	F_PAD_GetKey();
	move_and_slide()
#END _physics_process;

func F_PAD_GetKey():
	var M_Evt;
	# Itera sobre todos los eventos de entrada en la cola de eventos		
	var M_Pads=Input.get_connected_joypads();
	V_lb_10.text="PADS="+str(M_Pads.size())+"\n";
	
	var M_PadName=Input.get_joy_name(0);
	V_lb_10.text+=" Name:"+str(M_PadName)+"\n";
	
	var M_PadInf=Input.get_joy_info(0);
	V_lb_10.text+=" Info:"+str(M_PadInf)+"\n";
	
	var M_PadGuid=Input.get_joy_guid(0);
	#V_lb_10.text+=" Guid:"+str(M_PadGuid);
	
	var M_PadAxisVal;
	V_lb_10.text+=" Axis:";
	for M_q in 12:
		M_PadAxisVal=Input.get_joy_axis(0,M_q);
		if(M_PadAxisVal>0):M_PadAxisVal=1;
		if(M_PadAxisVal<0):M_PadAxisVal=-1;
		V_lb_10.text+=str(M_PadAxisVal)+",";
	#END For
	
	V_lb_10.text+=" Bt:";
	for M_q in 20:
		if(Input.is_joy_button_pressed(0,M_q)):
			V_lb_10.text+="1,";
		else:
			V_lb_10.text+="0,";

	#END For
	
	
	
#END F_PAD_GetKey
