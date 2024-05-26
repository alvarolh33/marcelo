extends Node2D

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_game_1_pressed():
	var new_scene = load("res://scenes/level.tscn")
	var level = new_scene.instantiate()
	level.set_game_file(1)
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_game_2_pressed():
	var new_scene = load("res://scenes/level.tscn")
	var level = new_scene.instantiate()
	level.set_game_file(2)
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_game_3_pressed():
	var new_scene = load("res://scenes/level.tscn")
	var level = new_scene.instantiate()
	level.set_game_file(3)
	get_tree().change_scene_to_file("res://scenes/level.tscn")
