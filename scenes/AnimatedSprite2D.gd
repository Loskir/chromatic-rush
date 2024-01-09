extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jump_animation()
	
func jump_animation():
	if Input.is_action_pressed("jump"):
		play("jump")
	else:
		play("idle")	
func walk_animation():
	if Input.is_action_pressed("move_right"):
		play("walk")
	elif Input.is_action_pressed("move_left"):
		flip_h
	
