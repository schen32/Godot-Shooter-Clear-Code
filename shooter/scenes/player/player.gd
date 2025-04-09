extends CharacterBody2D

const SPEED: int = 500
var can_laser: bool =  true
var can_grenade: bool =  true
@onready var laser_timer: Timer = $LaserTimer
@onready var grenade_timer: Timer = $GrenadeTimer
@onready var laser_start_pos: Node2D = $LaserStartPos

signal laser(pos, direction)
signal grenade(pos, direction)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = laser_start_pos.get_children()
		var pos = laser_markers[randi() % len(laser_markers)].global_position
		
		laser.emit(pos, player_direction)
		can_laser = false
		laser_timer.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = laser_start_pos.get_children()[0].global_position
		grenade.emit(pos, player_direction)
		can_grenade = false
		grenade_timer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
