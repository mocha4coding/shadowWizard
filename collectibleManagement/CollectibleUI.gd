extends Control

@onready var collectibleManager: CollectibleManager = preload("res://collectibleManagement/playerCollectibleManager.tres")

@onready var goldenMushroomSlots: Array = $NinePatchRect/BoxContainer/GoldenMushroomSlots.get_children()

# Called when the node enters the scene tree for the first time.

func update_slots():
	var filledSlotsCount: int = collectibleManager.items[0].count
	#dummyForTesting
	print("FilledSlotsCount = ", filledSlotsCount)
	#dummyForTesting
	filledSlotsCount += 5
	for i in range(0, filledSlotsCount):
		var temp = ((i % 2) == 0)
		print("Checking if filled at index: ", i)
		goldenMushroomSlots[i].isFilled = temp
	
func _ready():
	update_slots()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_slots()
