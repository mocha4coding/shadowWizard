extends Area2D

class_name  Key
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var keySprite = $Sprite2D

signal keyCollected
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Player:
		audio_stream_player_2d.play()
		keySprite.queue_free()

func _on_audio_stream_player_2d_finished():
	keyCollected.emit()
	queue_free()
