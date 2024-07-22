extends Node2D


func _physics_process(_delta):
	# Add the gravity.
	look_at(get_global_mouse_position())


func _on_area_2d_body_entered(body):
	print(body.name)
