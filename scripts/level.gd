extends Node2D

@onready var player = $Player
@onready var enemy = $Slime
@onready var camera = $Player/Camera2D

func _ready():
	camera.position_smoothing_enabled = true
	camera.limit_smoothed = true

func _process(delta):
	if enemy != null && player != null:
		enemy.set_player_position(player.position)
	
