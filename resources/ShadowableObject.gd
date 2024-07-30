extends Resource
class_name ShadowableObject

const SHADOW_FORMS_AUDIO = preload("res://assets/sounds/shadowFormsAudio.mp3")
@export var name: String = ""
var shadow: ShadowOfAnObject = null
var lightFell: bool = false
var shadowCreated: bool = false
var isShadowCreatedAudioPlayed : bool = false
var position : Vector2 = Vector2(0,0)

func _physics_process(delta):
	if shadow != null:
		print("Shadow is not null ")
	if shadowCreated :
		shadow.show()
		shadow.position = Vector2(position.x + 50, position.y - 40)


func handleLightFall():
	#print("Handling light fall")
	if lightFell && !shadowCreated:
			#print("About to create shadwo")
			obstacle_shadow_show()

func obstacle_shadow_show():
	if shadow != null:
		print("About to show shadwo")
		shadow.show()
		shadowCreated = true
		print("Position rexeived" , position)
		
		if !isShadowCreatedAudioPlayed:
			isShadowCreatedAudioPlayed = true
			shadowCreated = true
		
