extends CharacterBody2D

const SPEED: int = 400

func _process(_delta):
	var direction = Vector2.RIGHT
	velocity = direction * SPEED
	move_and_slide()
