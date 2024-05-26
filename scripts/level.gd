extends Node2D

@onready var player = $Player
@onready var enemies = $Slimes
@onready var camera = $Player/Camera2D
var game: int = 1
var save_game_path = "res://save_games/game1.save"

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func set_game_file(game):
	save_game_path = "res://save_games/game" + str(game) + ".save"
	print("level: " + save_game_path)
	$Player.load_game()

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if enemies != null && player != null:
		for enemy in enemies.get_children():
			enemy.set_player_position(player.position)
