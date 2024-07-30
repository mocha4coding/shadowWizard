extends CharacterBody2D

class_name ShadowOfAnObject

var push: bool = false
var direction: int = 0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var play_shadow_form_sound = $playShadowFormSound
@export var animatedSprite: AnimatedSprite2D
@export var positionXSpawnPointOffSet: int = 50
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	position.x = position.x +positionXSpawnPointOffSet

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if push:
		velocity.x = direction * delta * 2000
	else:
		velocity.x = 0
	move_and_slide()

func onLeftPush(body):
	if body is Player:
		push = true
		direction = body.direction


func onRightPush(body):
	if body is Player:
		push = true
		direction = body.direction


func onRihgtPushStop(body):
	if body is Player:
		push = false


func onLeftPushStop(body):
	if body is Player:
		push = false
