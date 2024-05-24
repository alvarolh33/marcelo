class_name Enemy

extends Entity

const TRIG_DIST = 60
const SURR_DIST = 80
var player_position: Vector2 = Vector2.ZERO
var rng = RandomNumberGenerator.new();


func set_player_position(pos: Vector2):
	player_position = pos

# TODO: Move into Behaviour class
func get_direction() -> Vector2:
	var direction
	var cycles = 0
	if (prev_direction.is_zero_approx() \
	&& position.distance_to(player_position) > TRIG_DIST) \
	|| position.distance_to(player_position) > SURR_DIST:
		#if (cycles == 0):
			#cycles = rng.randi_range(100, 1000);
			#direction = Vector2(rng.randf_range(0.0, 1.0), rng.randf_range(0.0, 1.0)).normalized()
		#else:
			#cycles -= 1;
		direction = Vector2.ZERO
	else:
		direction = position.direction_to(player_position)
	return direction

func take_damage():
	vidas -= 1
	print("AAA me pegaron")
	print(self , " tengo " , vidas)
	if vidas < 0:
		die()

func die():
	print(self, " ha muerto")
	dead = true
	drop_loot()
	#queue_free()


func attack():
	print("Enemigo ataca")
