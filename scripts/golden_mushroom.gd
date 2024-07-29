extends Node2D

@onready var collectibleManager: CollectibleManager = preload("res://collectibleManagement/playerCollectibleManager.tres")
@onready var golden_mushroom_solid = $CollectibleObjectArea/GoldenMushroomSolid
@onready var mushroom_animations = $MushroomAnimations


var isCollected: bool = false

func _ready():
	isCollected = false
	mushroom_animations.play("appear")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !isCollected:
		mushroom_animations.play("appear")


func get_collected_by_player(): 
	print("Got collected by player. Mushroom disappearing")
	isCollected = true
	#golden_mushroom_solid.queue_free()
	mushroom_animations.set_deferred("disabled", false)
	mushroom_animations.play("disappear")
	collectibleManager.items[0].count += 1
	


func _on_mushroom_animations_animation_finished():
	queue_free()
