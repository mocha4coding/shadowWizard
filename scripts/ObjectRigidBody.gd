extends RigidBody2D

class_name ObstacleObject

var lightFell: bool = false
var shadowCreated: bool = false
#@onready var obstacle_object_1_shadow =$"../ObjectShadowRigidBody"
#@onready var animated_sprite_shadow = $"../ObjectShadowRigidBody/AnimatedSprite2D"
#@onready var collision_shape_shadow = $"../ObjectShadowRigidBody/CollisionShape2D2"
#@onready var play_shadow_form_sound = $"../ObjectShadowRigidBody/playShadowFormSound"
var shadow : Shadow = null
var isShadowCreatedAudioPlayed : bool = false
const OBJECT_SHADOW_RIGID_BODY_PATH = preload("res://scenes/object_shadow_rigid_body.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print("Light fell on stone", lightFell)
	if lightFell && !shadowCreated:
		print("About to create shadwo")
		obstacle_shadow_show()
		if !isShadowCreatedAudioPlayed:
			shadow.playRiseAnimation()
			shadow.playShadowFormSound()
			isShadowCreatedAudioPlayed = true
			shadowCreated = true
		
		


func _on_animated_sprite_2d_animation_finished():
	if shadowCreated:
		shadow.playDefaultAnimation()

	
func obstacle_shadow_show():
	#collision_shape_shadow.set_deferred("disabled", false)
	#obstacle_object_1_shadow.show()	
	print("About to create shadwo")
	shadowCreated = true
	shadow = OBJECT_SHADOW_RIGID_BODY_PATH.instantiate()
	add_child(shadow)
	shadow.position = Vector2(position.x + 5, position.y)
	

