extends Node2D

const SPEED: int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(400, 400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * delta * SPEED

	if Input.is_action_just_pressed("primary action"):
		print("shoot laser")
	if Input.is_action_just_pressed("secondary action"):
		print("shoot grenade")
