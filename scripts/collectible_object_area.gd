extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#print(body.name, "entered", get_parent().name)
	if body.name == "Player":
		body.item_collected_audio.play()
		body.increaseHealth()
		get_parent().get_collected_by_player()
