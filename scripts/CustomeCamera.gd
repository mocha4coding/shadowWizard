extends Camera2D

@export var TargetNode : Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta) -> void:
	set_position(TargetNode.get_position()) 
