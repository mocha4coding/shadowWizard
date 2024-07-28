extends CharacterBody2D

var timeTakenToMove : int = 100
var playerChase : bool = false
var player : Player = null
@onready var animated_sprite_2d = $AnimatedSprite2D
var attackModeOn: bool = false

func _physics_process(delta):
	if playerChase:
		animated_sprite_2d.play("attack")
		position += (player.position - position)/timeTakenToMove
		#print("Bee positon after player detected " , position )
		
	else :
		animated_sprite_2d.play("idle")
		#print("Bee position without player ", position)
		
	if attackModeOn:
		player.decreaseHealth()

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
