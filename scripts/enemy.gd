extends CharacterBody2D

class_name Enemy
var timeTakenToMove : int = 100
var playerChase : bool = false
var player : Player = null
@onready var animated_sprite_2d = $AnimatedSprite2D
var attackModeOn: bool = false
var enemyHealth:float = 30
var spawnPosition: Vector2 = global_position
var gotHit: bool = false
func _ready():
	spawnPosition = global_position
	
func _physics_process(delta):
	if playerChase and not gotHit:
		animated_sprite_2d.play("attack")
		position += (player.position - position)/timeTakenToMove
		#print("Bee positon after player detected " , position )
		
	elif not gotHit:
		animated_sprite_2d.play("idle")
		position += (spawnPosition - position)/timeTakenToMove
		#print("Bee position without player ", position)
	else :
		animated_sprite_2d.play("hit")
	if attackModeOn:
		player.decreaseHealth()

func getHit(damageAmount: float):
	if enemyHealth > 0:
		enemyHealth -= damageAmount
		gotHit = true
func _on_detetction_area_body_entered(body):
	if body is Player:
		#print("Player detected")
		player = body
		playerChase = true


func _on_detetction_area_body_exited(body):
	if body is Player:
		player = null
		playerChase = false



func _on_damage_area_body_entered(body):
	if body is Player:
		player = body
		attackModeOn = true
		


func _on_damage_area_body_exited(body):
	if body is Player:
		player = body
		attackModeOn = false


func _on_animated_sprite_2d_animation_finished():
	if gotHit:
		gotHit = false
	if enemyHealth <= 0:
		queue_free()
