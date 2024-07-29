extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

const LEVEL_1 = "res://scenes/level_1.tscn"
func _on_texture_button_button_down():
	get_tree().change_scene_to_file(LEVEL_1)
