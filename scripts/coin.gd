extends Area2D

func _on_body_entered(_body):
	print("Coin entered")
	_body.add_gold(1)
	queue_free()
