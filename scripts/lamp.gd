extends Node2D
class_name LampOfWizard


signal lampStateChanged

@export var currentScene: Node2D = null
@export var player: Player = null
@onready var lights = $Lights

@onready var object_detector_1 = $PointLight2D/ObjectDetector1
@onready var object_detector_2 = $PointLight2D/ObjectDetector2

const lampStateDefault  = 0
const lampStateLightThrow = 1
const lampStateAttack = 2
var lampState = lampStateDefault




func _physics_process(_delta):

	handle_collision_with_objects()
	handle_lamp_animation()
	
	if Input.is_action_just_pressed("turn_on_lamp"):
		print("Cirrent lamp state is : ", lampState)
		lampState += 1
		lampState %= 3 
		print("Lamp state updated to", lampState)
		lampStateChanged.emit()
	# Flip the sprite
	if player != null:
		if player.direction < 0 :
			lights.flip_h = true
		elif player.direction > 0:
			lights.flip_h = false
			
	


func handle_lamp_animation():
	match lampState:
		lampStateDefault:
			#print("Default lamp")
			lights.play("default")
		lampStateLightThrow:
			#print("Light lamp")
			lights.play("lightThrow")
		lampStateAttack:
			#print("Attack lamp")
			lights.play("attack")
	
func _on_area_2d_body_entered(body):
	print(body.name)
	
func handle_collision_with_objects():
	var collisionObject = object_detector_1.get_collider()

	if lampState == lampStateLightThrow:
		if collisionObject is ObstacleObject && object_detector_2.get_collider() == collisionObject:
			#print("Collision detected")
			collisionObject.lightFell = true
		
		elif "shadowableObject" in collisionObject  && object_detector_2.get_collider() == collisionObject:
			print("Collision detected with shadowable object")
			collisionObject.updateLightFallToTrue()
		


