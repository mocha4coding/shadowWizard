extends Resource

@export var name: String = ""

var push: bool = false
var direction: int = 0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func handleShadowMovement(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if push:
		velocity.x = direction * delta * 2000
	else:
		velocity.x = 0
	move_and_slide()
	
