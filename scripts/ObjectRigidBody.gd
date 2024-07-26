extends RigidBody2D

class_name ObstacleObject

var lightFell: bool = false
var shadowCreated: bool = false
@onready var obstacle_object_1_shadow =$"../ObjectShadowRigidBody"
@onready var animated_sprite_shadow = $"../ObjectShadowRigidBody/AnimatedSprite2D"
@onready var collision_shape_shadow = $"../ObjectShadowRigidBody/CollisionShape2D2"
@onready var play_shadow_form_sound = $"../ObjectShadowRigidBody/playShadowFormSound"

var isShadowCreatedAudioPlayed : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	obstacle_shadow_hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(lightFell)
	if lightFell && !shadowCreated:
		obstacle_shadow_show()
		
		
		if !isShadowCreatedAudioPlayed:
			animated_sprite_shadow.play("rise")
			play_shadow_form_sound.play()
			isShadowCreatedAudioPlayed = true
			shadowCreated = true
		
		


func _on_animated_sprite_2d_animation_finished():
	if shadowCreated:
		animated_sprite_shadow.play("default")

func obstacle_shadow_hide():
	obstacle_object_1_shadow.hide()
	collision_shape_shadow.set_deferred("disabled", true)
	
	
func obstacle_shadow_show():
	collision_shape_shadow.set_deferred("disabled", false)
	obstacle_object_1_shadow.show()	

	
	
	
	
