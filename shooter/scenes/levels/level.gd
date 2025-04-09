extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
@onready var player: CharacterBody2D = $Player
@onready var projectiles: Node2D = $Projectiles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gate_player_entered_gate(body) -> void:
	print("player has entered gate")


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	projectiles.add_child(laser)


func _on_player_grenade(pos) -> void:
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	projectiles.add_child(grenade)
