extends Control

func _on_volume_pressed():
	get_tree().change_scene_to_file("res://scenes/volume.tscn")

func _on_graphics_pressed():
	get_tree().change_scene_to_file("res://scenes/graphics.tscn")

func _on_return_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
