extends Area2D


@onready var collect_mushroom_ui_board_instruction = $"../LevelOneUI/CollectMushroomUiBoardInstruction"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	pass


func _on_timer_timeout():
	collect_mushroom_ui_board_instruction.queue_free()
