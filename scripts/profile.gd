extends Node2D

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")



func _on_admin_pressed():
	get_tree().change_scene_to_file("res://scenes/admin_profile.tscn")
