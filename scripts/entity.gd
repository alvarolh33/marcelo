class_name Entity

extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var dead: bool = false
var speed: float = 70.0
var direction: Vector2 = Vector2.ZERO
var prev_direction: Vector2 = Vector2.ZERO

func get_direction() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")

func _physics_process(delta):
	# Obtener el vector direction
	direction = get_direction()
	if !direction.is_zero_approx():
		prev_direction = direction
	else:
		direction = Vector2.ZERO

	velocity = direction * speed
	move_and_slide()

func _process(delta):
	if dead:
		if animated_sprite.animation == "Die" && animated_sprite.frame == 2:
			animated_sprite.pause()
		else:
			animated_sprite.play("Die")
		return

	# Invertir el sprite
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

	# Ejecutar las animaciones
	if direction.length() == 0:
		if abs(prev_direction.x) > abs(prev_direction.y):
			animated_sprite.play("IdleSide")
		elif prev_direction.y < 0:
			animated_sprite.play("IdleUp")
		else:
			animated_sprite.play("IdleDown")
	elif abs(direction.y) > abs(direction.x):
		if direction.y < 0:
			animated_sprite.play("WalkUp")
		else:
			animated_sprite.play("WalkDown")
	else:
		animated_sprite.play("WalkSide")

func die():
	dead = true
