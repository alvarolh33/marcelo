class_name Enemy

extends Entity

var player_position: Vector2 = Vector2(0.0, 0.0)

func set_player_position(position: Vector2):
	player_position = position

func get_direction() -> Vector2:
	return position.direction_to(player_position)
