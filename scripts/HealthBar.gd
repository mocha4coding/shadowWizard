extends TextureProgressBar

@export var player: Player
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Inside health bar : ", player.currentHealth)
	player.healthChanged.connect(update)
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update():
	value = (player.currentHealth * 100) / player.maxHealth
	if value < 80 && value > 20 :
		set_progress_texture(preload("res://assets/healthBar/HealthBarLess.png"))
	if value <= 35 :
		const HEALTH_BAR_LOW = preload("res://assets/healthBar/HealthBarLow.png")
		set_progress_texture(HEALTH_BAR_LOW)
