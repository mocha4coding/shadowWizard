extends Area2D

@onready var collect_mushroom_instruction =$"../CollectMushroomInstruction"
@onready var golden_mushroom_tutorial = $"../GoldenMushroomTutorial"
@onready var collect_mushroom_ui_board_instruction = $"../LevelOneUI/CollectMushroomUiBoardInstruction"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if golden_mushroom_tutorial !=  null:
		if golden_mushroom_tutorial.isCollected:
			collect_mushroom_instruction.hide()
			collect_mushroom_ui_board_instruction.show()
			$"../LevelOneUI/CollectMushroomUiBoardInstruction/Timer".start()


func _on_body_entered(body):
	if body is Player:
		collect_mushroom_instruction.show()


func _on_timer_timeout():
	collect_mushroom_ui_board_instruction.queue_free()
