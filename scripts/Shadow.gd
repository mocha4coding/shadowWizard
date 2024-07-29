extends CharacterBody2D


class_name Shadow

var push: bool = false
var direction: int = 0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var play_shadow_form_sound = $playShadowFormSound
@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if push:
		velocity.x = direction * delta * 2000
	else:
		velocity.x = 0
	move_and_slide()


func playShadowFormSound():
	play_shadow_form_sound.play()

func playRiseAnimation():
	animated_sprite_2d.play("rise")
	
func playDefaultAnimation():
	animated_sprite_2d.play("default")

func _on_left_detector_body_entered(body):
	if body is Player:
		push = true
		direction = body.direction


func _on_right_detector_body_entered(body):
	if body is Player:
		push = true
		direction = body.direction


func _on_right_detector_body_exited(body):
	if body is Player:
		push = false


func _on_left_detector_body_exited(body):
	if body is Player:
		push = false
