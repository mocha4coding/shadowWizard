extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var point_light = $Lamp/PointLight2D

	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gets the input direction: -1 0 1
	@warning_ignore("narrowing_conversion")
	var direction: int = Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction < 0 :
		animated_sprite_2d.flip_h = true
	else :
		animated_sprite_2d.flip_h = false
	
	
	# Play animation 
	#if is_on_floor():
	if direction == 0:
		animated_sprite_2d.play("idle")
	else :
		animated_sprite_2d.play("walk")
	
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
