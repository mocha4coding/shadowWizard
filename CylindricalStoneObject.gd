extends StaticBody2D


const OBJECT_SHADOW_RIGID_BODY = preload("res://resources/shadow_of_cylindrical_object.tscn")


@export var shadowableObject: ShadowableObject = null
# Called when the node enters the scene tree for the first time.
func _ready():
	shadowableObject.position = global_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shadowableObject.lightFell == true && shadowableObject.shadow == null:
		shadowableObject.shadow = OBJECT_SHADOW_RIGID_BODY.instantiate()
		add_child(shadowableObject.shadow)
		print("Created shadow of shadowable object")

func updateLightFallToTrue():
	if shadowableObject != null && shadowableObject.lightFell == false:
		print("Updating light fall to true")
		shadowableObject.lightFell = true
		shadowableObject.handleLightFall()
