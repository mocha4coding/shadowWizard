extends Node2D

@onready var shadow = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_detector_body_entered(body):
	shadow.onLeftPush(body)


func _on_left_detector_body_exited(body):
	shadow.onLeftPushStop(body)


func _on_right_detector_body_entered(body):
	shadow.onRightPush(body)


func _on_right_detector_body_exited(body):
	shadow.onRihgtPushStop(body)
