class_name Enemy

extends Entity

const TRIG_DIST = 60
const SURR_DIST = 80
var player_position: Vector2 = Vector2.ZERO

func set_player_position(pos: Vector2):
	player_position = pos

func get_direction() -> Vector2:
	var dir
	if (prev_direction.is_zero_approx() \
	&& position.distance_to(player_position) > TRIG_DIST) \
	|| position.distance_to(player_position) > SURR_DIST:
		dir = Vector2.ZERO
	else:
		dir = position.direction_to(player_position)
	return dir

func die():
	print(self, " ha muerto")
	dead = true
	drop_loot()

func attack():
	print("Enemigo ataca")
