extends PointLight2D

const minRotationDegreeRight : float = -60
const maxRotationDegreeRight : float = 60

const minRotationDegreeLeft : float = 120
const maxRotationDegreeLeft : float = 270
@onready var lamp = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	if lamp.player.direction <= 0 :
		position.x = lamp.position.x - 6.0
		look_at(get_global_mouse_position())
		if global_rotation_degrees <= minRotationDegreeLeft :
			global_rotation_degrees = minRotationDegreeLeft
		elif global_rotation_degrees >= maxRotationDegreeLeft :
			global_rotation_degrees = maxRotationDegreeLeft
		
	elif lamp.player.direction >= 0 :
		position.x = lamp.position.x + 6.0
		look_at(get_global_mouse_position())
		if global_rotation_degrees <= minRotationDegreeRight :
			global_rotation_degrees = minRotationDegreeRight
		elif global_rotation_degrees >= maxRotationDegreeRight :
			global_rotation_degrees = maxRotationDegreeRight
		
