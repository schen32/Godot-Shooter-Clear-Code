extends CharacterBody2D

const SPEED: int = 500
var can_laser: bool =  true
var can_grenade: bool =  true
@onready var laser_timer: Timer = $LaserTimer
@onready var grenade_timer: Timer = $GrenadeTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		print("laser")
		can_laser = false
		laser_timer.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("grenade")
		can_grenade = false
		grenade_timer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
