extends Node2D

var isFilled: bool = false
@onready var empty = $Empty
@onready var filled = $Filled

# Called when the node enters the scene tree for the first time.
func _ready():
	filled.visible = isFilled


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	filled.visible = isFilled
	empty.visible = !isFilled
		
