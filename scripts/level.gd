extends Node2D

@onready var player = $Player
@onready var enemy = $Slime

func _process(delta):
	enemy.set_player_position(player.position)
