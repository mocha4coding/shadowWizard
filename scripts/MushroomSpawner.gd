extends Node2D

const PINK_MUSHROOM = preload("res://scenes/pink_mushroom.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	PINK_MUSHROOM.instantiate()
	
