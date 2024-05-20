extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
func _on_multiplayer_pressed():
	get_tree().change_scene_to_file("res://scenes/multiplayer.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _on_languages_pressed():
	get_tree().change_scene_to_file("res://scenes/languages.tscn")
	
func _on_profile_pressed():
	get_tree().change_scene_to_file("res://scenes/profile.tscn")
