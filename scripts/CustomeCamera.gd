extends Camera2D

@export var TargetNode : Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta) -> void:
	var cameraPositionX: float = TargetNode.get_position().x - 400
	var cameraPositionY: float = get_position().y

	var cameraPosition: Vector2 = Vector2(cameraPositionX, cameraPositionY)

	set_position(cameraPosition) 
