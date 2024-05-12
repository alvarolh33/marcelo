extends Entity

func _ready():
	position = Vector2(0.0, 0.0)

#const SPEED: float = 70.0
#@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
#var direction: Vector2 = Vector2(0.0, 0.0)
#var prev_direction: Vector2 = Vector2(0.0, 0.0)

#func get_direction() -> Vector2:
	#return Input.get_vector("left", "right", "up", "down")
#
#func _physics_process(delta):
	## Obtener el vector direction
	#direction = get_direction()
	#if direction.length() != 0:
		#prev_direction = direction
#
	#velocity = direction * SPEED
	#move_and_slide()
#
#func _process(delta):
	## Invertir el sprite
	#if direction.x > 0:
		#animated_sprite.flip_h = false
	#elif direction.x < 0:
		#animated_sprite.flip_h = true
#
	## Ejecutar las animaciones
	#if direction.length() == 0:
		#if prev_direction.x != 0:
			#animated_sprite.play("IdleSide")
		#elif prev_direction.y < 0:
			#animated_sprite.play("IdleUp")
		#else:
			#animated_sprite.play("IdleDown")
	#elif direction.y < 0:
		#animated_sprite.play("WalkUp")
	#elif direction.y > 0:
		#animated_sprite.play("WalkDown")
	#else:
		#animated_sprite.play("WalkSide")
