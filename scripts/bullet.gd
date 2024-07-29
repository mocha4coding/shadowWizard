extends Node2D

@onready var animated_sprite_2d = $CharacterBody2D/AnimatedSprite2D
const BULLET_SPEED : int = 300

var velocity : Vector2 = Vector2(0,0)
var direction := Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.play("default")
	look_at(position + direction )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	#velocity.x = move_toward(position.x, targetPosition.x, BULLET_SPEED * delta)	
	#velocity.y = move_toward(position.y, targetPosition.y, BULLET_SPEED * delta)
	#velocity = Vector2(0, -BULLET_SPEED).rotated(targetPosition)
	position += direction * BULLET_SPEED * delta
func _on_bullet_damange_area_body_entered(body):
	print(body.name)
	if body is Enemy:
		print("Hitting enemy")
		body.getHit(10)
		queue_free()
		
	
	
