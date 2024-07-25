extends Node2D


@onready var collectibleManager: CollectibleManager = preload("res://collectibleManagement/playerCollectibleManager.tres")

func get_collected_by_player(): 
	collectibleManager.items[2].count += 1
	queue_free()
