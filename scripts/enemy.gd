class_name Enemy

extends Entity

const TRIG_DIST = 60
const SURR_DIST = 80
var player_position: Vector2 = Vector2.ZERO

func set_player_position(position: Vector2):
	player_position = position

# TODO: Move into Behaviour class
func get_direction() -> Vector2:
	var direction
	if prev_direction.is_zero_approx() && position.distance_to(player_position) > TRIG_DIST:
		direction = Vector2.ZERO
	elif position.distance_to(player_position) > SURR_DIST:
		direction = Vector2.ZERO
	else:
		direction = position.direction_to(player_position)
	return direction
