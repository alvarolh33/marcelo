extends Area2D

var valor: int = 1

func _on_body_entered(_body):
	print("Coin entered")
	_body.add_gold(valor)
	queue_free()
