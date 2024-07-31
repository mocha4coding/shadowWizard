extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_stream_player_finished():
	const FINAL_SCENE = "res://scenes/final_scene.tscn"
	get_tree().change_scene_to_file(FINAL_SCENE)
