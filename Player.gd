extends CharacterBody2D

const MAX_HP : int = 3
var current_hp : int = 3
const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	set_start_hp(current_hp, MAX_HP)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
	
	animate()
	
func set_start_hp(current_hp, MAX_HP):
	$Camera2D/HP_Bar.value = current_hp
	$Camera2D/HP_Bar.max_value = MAX_HP

func update_hp():
	$HP_Bar.value = current_hp

func animate():
	var anim = "idle"
	if velocity.y > 0 and not $RayCast2D.is_colliding():
		anim = "jump"
	else:
		if velocity.x != 0:
			anim = "walk"
			if velocity.x > 0:
				$AnimatedSprite2D.flip_h = false
			elif velocity.x < 0:
				$AnimatedSprite2D.flip_h = true
	if $AnimatedSprite2D.animation != anim:
		$AnimatedSprite2D.play(anim)
