extends Area2D

@onready var timer = $Timer

func _on_body_entered(_body):
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
