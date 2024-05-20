extends Node2D

@onready var player = $Player
@onready var enemy = $Slime
@onready var camera = $Player/Camera2D

func _ready():
	camera.position_smoothing_enabled = true
	camera.limit_smoothed = true
	camera.limit_top = -100
	camera.limit_bottom = 100
	camera.limit_left = -200
	camera.limit_right = 200

func _process(delta):
	enemy.set_player_position(player.position)
