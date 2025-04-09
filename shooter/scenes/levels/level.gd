extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gate_player_entered_gate(body) -> void:
	print("player has entered gate")
	print(body)


func _on_player_player_shoot_laser() -> void:
	print("shoot laser")


func _on_player_player_shoot_grenade() -> void:
	print("shoot grenade")
