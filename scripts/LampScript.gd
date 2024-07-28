extends PointLight2D

const minRotationDegree : float = -60
const maxRotationDegree : float = 60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if global_rotation_degrees <= minRotationDegree :
		global_rotation_degrees = minRotationDegree
	elif global_rotation_degrees >= maxRotationDegree :
		global_rotation_degrees = maxRotationDegree
	
