extends CharacterBody2D


class_name EvilWizard
var timeTakenToMove : int = 100
var playerChase : bool = false
@export var player : Player = null
@onready var animated_sprite_2d = $AnimatedSprite2D
var attackModeOn: bool = false
var enemyHealth:float = 200
var spawnPosition: Vector2 = global_position
var gotHit: bool = false
const BULLET_PATH = preload("res://scenes/bullet.tscn")
@export var currentScene :Node2D = null
@onready var timer = $Timer

func _ready():
	spawnPosition = global_position
	timer.start(1)
	
func _physics_process(delta):
	#attack
	
	if playerChase and not gotHit:
		animated_sprite_2d.play("idle")
		
	
		
	elif not gotHit:
		animated_sprite_2d.play("idle")
	
	
	else :
		if enemyHealth > 5  :
			animated_sprite_2d.play("hit")
		else :
			animated_sprite_2d.play("dead")
	if attackModeOn:
		player.decreaseHealth()

		#if player.currentHealth > 0 :
			#shoot()

func shoot():
	var bullet = BULLET_PATH.instantiate()
	bullet.isEvil = true
	var bulletSpawnPosition : Vector2 
	bullet.apply_scale(Vector2(0.15, 0.15))
	currentScene.add_child(bullet)
	bullet.position = Vector2(global_position.x - 100,global_position.y )
	bullet.direction = bullet.global_position.direction_to(player.global_position)
	


func getHit(damageAmount: float):
	if enemyHealth > 0:
		enemyHealth -= damageAmount
		gotHit = true

func _on_detection_area_body_entered(body):
	if body is Player:
		#print("Player detected")
		player = body
		playerChase = true


func _on_detection_area_body_exited(body):
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




func _on_timer_timeout():
	if player.currentHealth > 0 :
		shoot()
		timer.start(0.7)
