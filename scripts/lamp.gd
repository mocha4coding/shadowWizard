extends Node2D

#@onready var object_detector = $PointLight2D/RayCast2D
@onready var object_detector_1 = $PointLight2D/ObjectDetector1
@onready var object_detector_2 = $PointLight2D/ObjectDetector2

func _physics_process(_delta):
	# Add the gravity.
	look_at(get_global_mouse_position())
	handle_collision_with_objects()


func _on_area_2d_body_entered(body):
	print(body.name)
	
func handle_collision_with_objects():
	var collisionObject = object_detector_1.get_collider()
	if collisionObject is ObstacleObject && object_detector_2.get_collider() == collisionObject:
		#print("Collision detected")
		collisionObject.lightFell = true
		
	
