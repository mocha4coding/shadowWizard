extends Node2D
class_name Bullet
@onready var animated_sprite_2d = $CharacterBody2D/AnimatedSprite2D
const BULLET_SPEED : int = 300

var velocity : Vector2 = Vector2(0,0)
var direction := Vector2.ZERO
var isEvil: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if isEvil:
		animated_sprite_2d.play("evilBullet")
	else:
		animated_sprite_2d.play("default")
	look_at(position + direction )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#pass
	##velocity.x = move_toward(position.x, targetPosition.x, BULLET_SPEED * delta)	
	##velocity.y = move_toward(position.y, targetPosition.y, BULLET_SPEED * delta)
	##velocity = Vector2(0, -BULLET_SPEED).rotated(targetPosition)
	if isEvil:
		position += direction * BULLET_SPEED * delta * 2
	else:
		position += direction * BULLET_SPEED * delta
func _on_bullet_damange_area_body_entered(body):
	#print(body.name)
	if isEvil:
		if body is Player:
			body.decreaseHealth()
	else:
		if body is Enemy:
			print("Hitting enemy")
			body.getHit(10)
			queue_free()
		elif body is EvilWizard:
			print("Hitting evil wizard with bullet")
			body.getHit(10)
			queue_free()
	
	


func _on_evil_bullet_damage_area_body_entered(body):
	if isEvil:
		if body is Player:
			body.decreaseHealth(5)
			queue_free()


func _on_timer_timeout():
	queue_free()
