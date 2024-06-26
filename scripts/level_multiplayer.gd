extends Node2D

@onready var player = $Player
@onready var enemies = $Slimes
@onready var camera = $Player/Camera2D

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _ready():
	if !is_multiplayer_authority(): 
		return
	pass

func _process(delta):
	if !is_multiplayer_authority(): 
		return
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if enemies != null && player != null:
		for enemy in enemies.get_children():
			enemy.set_player_position(player.position)

