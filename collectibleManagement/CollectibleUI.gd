extends Control

@onready var collectibleManager: CollectibleManager = preload("res://collectibleManagement/playerCollectibleManager.tres")

@onready var goldenMushroomSlots: Array = $NinePatchRect/GoldenMushroomSlots.get_children()
@onready var pinkMushroomSlots: Array = $NinePatchRect/PinkMushroomSlots.get_children()
@onready var vermMushroomSlots: Array =$NinePatchRect/VermMushroomSlots.get_children()

# Called when the node enters the scene tree for the first time.

func update_slots():
	var totalTypeOfMushrooms: int = collectibleManager.items.size()
	print("Total types of mushroom ", totalTypeOfMushrooms)
	for typeOfMushroom in range(0, totalTypeOfMushrooms):
		var filledSlotsCount: int = collectibleManager.items[typeOfMushroom].count
		#dummyForTesting
		print("FilledSlotsCount = ", filledSlotsCount)
		#dummyForTesting
		filledSlotsCount += 5
		for i in range(0, filledSlotsCount):
			var temp = ((i % 2) == 0)
			print("Checking if filled at index: ", i)
			match typeOfMushroom:
				0:
					goldenMushroomSlots[i].isFilled = temp
				1:
					pinkMushroomSlots[i].isFilled = !temp
				2:
					vermMushroomSlots[i].isFilled = temp
	
func _ready():
	update_slots()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_slots()
