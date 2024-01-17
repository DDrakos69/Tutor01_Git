extends CharacterBody2D


func F_Tron(Txt):
	V.F_Tron(self,Txt);
#End F_Tron


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	F_MotionControl(delta);
	#F_MotionDefault(delta);
#End func _physics_process



func F_MotionDefault(delta)->void:
	#Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis(
		"ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(
			velocity.x, 0, SPEED)

	move_and_slide()
#End Func F_MotionDefault

func F_MotionControl(delta)->void:
	velocity.x=V.F_GetAxis().x*SPEED;
	velocity.y=V.F_GetAxis().y*SPEED;
	var M_WinSize=DisplayServer.window_get_size();
	
	if($Sprite2D.get_position().x<0):
		$Sprite2D.set_position(
		Vector2(M_WinSize.x-20,
		$Sprite2D.get_position.y)
		)
		
	if($Sprite2D.get_position().x>M_WinSize.x):
		$Sprite2D.set_position(
		Vector2(20,$Sprite2D.get_position().y)
		)
		
#	if($Sprite2D.get_position().y<0):
#		$Sprite2D.set_position(
#		Vector2($Sprite2D.get_position().x,
#		M_WinSize.y-20)
#		)
#
#	if($Sprite2D.get_position().y>M_WinSize.y):
#		$Sprite2D.set_position(
#		Vector2($Sprite2D.get_position().x,20)
#		)
		
		
	
	
	move_and_slide();
#End Fnc F_MotionControl
