extends Node2D

@onready var player = $Player
@onready var enemy = $Slime
@onready var camera = $Player/Camera2D

func _ready():
	camera.position_smoothing_enabled = true
	camera.limit_smoothed = true

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if enemy != null && player != null:
		enemy.set_player_position(player.position)

