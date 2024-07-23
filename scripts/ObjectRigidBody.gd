extends RigidBody2D

class_name ObstacleObject

var lightFell: bool = false
var shadowCreated: bool = false
@onready var obstacle_object_1_shadow =$"../ObjectShadowRigidBody"
@onready var animated_sprite_shadow = $"../ObjectShadowRigidBody/AnimatedSprite2D"
# Called when the node enters the scene tree for the first time.
func _ready():
	obstacle_object_1_shadow.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(lightFell)
	if lightFell && !shadowCreated:
		obstacle_object_1_shadow.show()
		animated_sprite_shadow.play("rise")
		shadowCreated = true
		


func _on_animated_sprite_2d_animation_finished():
	if shadowCreated:
		animated_sprite_shadow.play("default")
