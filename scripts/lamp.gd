extends Node2D


func _physics_process(delta):
	# Add the gravity.
	look_at(get_global_mouse_position())
