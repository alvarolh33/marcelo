extends Area2D

func _on_body_entered(_body):
	print("Coin entered")
	queue_free()
