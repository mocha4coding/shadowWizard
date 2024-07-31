extends Node2D

@onready var collect_mushroom_instruction = $CollectMushroomInstruction
@onready var collect_mushroom_ui_board_instruction = $LevelOneUI/CollectMushroomUiBoardInstruction
@onready var space_bar_for_magic_light_instruction = $SpaceForMagicLightInstructionArea2D/SpaceBarForMagicLightInstruction
@onready var push_shadow_instruction = $PushShadowInstruction
@onready var object_original = $Object_original
@onready var attack_instruction = $AttackInstruction
@onready var animation_player = $FinalPlatformWhole/Pillar/AnimationPlayer


@onready var golden_mushroom_tutorial = $GoldenMushroomTutorial
# Called when the node enters the scene tree for the first time.
func _ready():
	collect_mushroom_instruction.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if golden_mushroom_tutorial !=  null:
		if golden_mushroom_tutorial.isCollected:
			collect_mushroom_instruction.hide()
			collect_mushroom_ui_board_instruction.show()
			$LevelOneUI/CollectMushroomUiBoardInstruction/Timer.start()



func _on_collect_mushroom_instruction_detector_body_entered(body):
	if body is Player:
		collect_mushroom_instruction.show()


func _on_timer_timeout():
	pass


func _on_area_2d_body_entered(body):
	pass # Replace with function body.


func _on_space_for_magic_light_instruction_area_2d_body_entered(body):
	if body is Player:
		space_bar_for_magic_light_instruction.show()
		push_shadow_instruction.show()


func _on_space_for_magic_light_instruction_area_2d_body_exited(body):
	if body is Player:
		$SpaceForMagicLightInstructionArea2D.queue_free()
		


func _on_tutorial_bee_tree_exiting():
	attack_instruction.hide()


func _on_level_end_body_entered(body):
	if body is Player:
		const CUTSCENE = "res://scenes/cutscene.tscn"
		get_tree().change_scene_to_file(CUTSCENE)


func _on_final_mushroom_collected_body_entered(body):
	if body is Player:
		animation_player.play("cyinderStoneUp")
