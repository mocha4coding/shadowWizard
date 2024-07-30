extends Area2D

var isPlayerInside: bool = false
var player: Player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isPlayerInside:
		player.decreaseHealth()


func _on_body_entered(body):
	if body is Player:
		isPlayerInside = true
		player = body

func _on_body_exited(body):
	if body is Player:
		isPlayerInside = false
		player = null
