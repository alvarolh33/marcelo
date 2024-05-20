extends Node2D

func _on_host_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
func _on_join_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
