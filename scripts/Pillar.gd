extends Sprite2D


@export var key: Key = null
@onready var animation_player = $AnimationPlayer
var isAnimationPlayed : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass



func _on_key_key_collected():
	animation_player.play("PillarGoesDown")
