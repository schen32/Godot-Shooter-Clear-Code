extends Node2D

@onready var logo: Sprite2D = $Logo
const SPEED: int = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		logo.position.x += delta * SPEED
	if Input.is_action_pressed("left"):
			logo.position.x -= delta * SPEED
	if Input.is_action_pressed("up"):
		logo.position.y -= delta * SPEED
	if Input.is_action_pressed("down"):
		logo.position.y += delta * SPEED
