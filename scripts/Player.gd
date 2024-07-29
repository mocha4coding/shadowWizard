extends CharacterBody2D

class_name Player

signal healthChanged
const SPEED = 300.0
const JUMP_VELOCITY = -350.0

var currentHealth = 100
var maxHealth = 100
var direction: int = 0

@export var playerCollectibleManager: CollectibleManager
@export var currentScene: Node2D = null
@onready var lamp = $Lamp

@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var point_light = $Lamp/PointLight2D
@onready var walk_audio = $walkAudio
@onready var jump_audio = $jumpAudio
@onready var item_collected_audio = $itemCollectedAudio

@onready var background_music = $BackgroundMusic
@onready var lamp_right_facing_position = $LampRightFacingPosition
@onready var lamp_left_facing_position = $LampLeftFacingPosition


const BULLET_PATH = preload("res://scenes/bullet.tscn")
var walk_audio_play_finished: bool = true
var jump_audio_play_finished:bool = true
var didJump: bool = false
var isHit: bool = false
func _ready():
	point_light.hide()
	lamp.global_position = lamp_right_facing_position.global_position

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else :
		if didJump:
			if walk_audio_play_finished && !jump_audio_play_finished:
				#print("Play jump audio")
				jump_audio.play()
			
			didJump = false
	#
	if lamp.lampState == lamp.lampStateAttack:
		if Input.is_action_just_pressed("shoot"):
			shoot()
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		didJump = true
		jump_audio_play_finished = false

	# Gets the input direction: -1 0 1
	@warning_ignore("narrowing_conversion")
	direction = Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction < 0 :
		animated_sprite_2d.flip_h = true
		lamp.global_position = lamp_left_facing_position.global_position
	elif direction > 0:
		animated_sprite_2d.flip_h = false
		lamp.global_position = lamp_right_facing_position.global_position
	
	
	# Play animation 
	if is_on_floor():
		if isHit:
			animated_sprite_2d.play("hit")
		else:
			if direction == 0 && currentHealth > 0:
				animated_sprite_2d.play("idle")
			else :
				if currentHealth > 0:
					animated_sprite_2d.play("walk")
					if walk_audio_play_finished && jump_audio_play_finished:
						walk_audio.play()
						walk_audio_play_finished = false
				else:
					
					gravity = 0
					animated_sprite_2d.play("death")
	else : 
		animated_sprite_2d.play("idle")	
		
	
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_walk_audio_finished():
	#print("Finished playing walk audio")
	walk_audio_play_finished = true


func _on_jump_audio_finished():
	jump_audio_play_finished = true

func decreaseHealth():
	isHit = true
	currentHealth -= 0.05
	#print("Decreasing health to ", currentHealth)
	healthChanged.emit()
	


func _on_lamp_lamp_state_changed():
		print("Lamp state : ", lamp.lampState)
		if lamp.lampState == lamp.lampStateLightThrow:
			point_light.show()
		else:
			point_light.hide()


func shoot():

	var bullet_spawn_point_right = $BulletSpawnPointRight.global_position
	var bullet_spawn_point_left = $BulletSpawnPointLeft.global_position
	print("Right point : ", bullet_spawn_point_right)
	print("Left point : ", bullet_spawn_point_left)
	var bullet = BULLET_PATH.instantiate()
	var bulletSpawnPosition : Vector2 
	bullet.apply_scale(Vector2(0.15, 0.15))
	
	if direction >= 0:
		bulletSpawnPosition = bullet_spawn_point_right
	elif direction <= 0:
		bulletSpawnPosition = bullet_spawn_point_left
	currentScene.add_child(bullet)
	bullet.position = Vector2(lamp.global_position.x, lamp.global_position.y - 60.0)
	bullet.direction = bullet.global_position.direction_to(get_global_mouse_position())
	

func _on_animated_sprite_2d_animation_finished():
	if isHit : 
		isHit = false
	if currentHealth <= 0:
		queue_free()
