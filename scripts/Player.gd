extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -350.0

@export var playerCollectibleManager: CollectibleManager


@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var point_light = $Lamp/PointLight2D
@onready var walk_audio = $walkAudio
@onready var jump_audio = $jumpAudio
@onready var item_collected_audio = $itemCollectedAudio

@onready var background_music = $BackgroundMusic



var walk_audio_play_finished: bool = true
var jump_audio_play_finished:bool = true
var didJump: bool = false
func _ready():
	background_music.play()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else :
		if didJump:
			if walk_audio_play_finished && !jump_audio_play_finished:
				print("Play jump audio")
				jump_audio.play()
			
			didJump = false

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		didJump = true
		jump_audio_play_finished = false

	# Gets the input direction: -1 0 1
	@warning_ignore("narrowing_conversion")
	var direction: int = Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction < 0 :
		animated_sprite_2d.flip_h = true
	else :
		animated_sprite_2d.flip_h = false
	
	
	# Play animation 
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else :
			animated_sprite_2d.play("walk")
			if walk_audio_play_finished && jump_audio_play_finished:
				walk_audio.play()
				walk_audio_play_finished = false
		
		
	else : 
		animated_sprite_2d.play("idle")	
		
	
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_walk_audio_finished():
	print("Finished playing walk audio")
	walk_audio_play_finished = true


func _on_jump_audio_finished():
	jump_audio_play_finished = true
