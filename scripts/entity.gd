class_name Entity

extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var loot = preload("res://scenes/coin.tscn")
var dead: bool = false
var is_attacking: bool = false
var speed: float = 70.0
var direction: Vector2 = Vector2.ZERO
var prev_direction: Vector2 = Vector2.ZERO
var vidas: int = 3


func get_direction() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")

func trying_to_attack():
	return false

func _physics_process(delta):
	if dead:
		return
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
			queue_free()
		else:
			animated_sprite.play("Die")
		return

	# Invertir el sprite
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
	
	if trying_to_attack():
		attack()
	
	# Ejecutar las animaciones
	select_animation(direction, prev_direction, animated_sprite)	

func die():
	print(self, " ha muerto")
	dead = true

func drop_loot():
	var coin = loot.instantiate()
	coin.global_position = global_position
	get_tree().get_root().add_child(coin)

func attack():
	print("Estoy atacando")

func select_animation(dir: Vector2, prev_dir: Vector2, anim_sprite: AnimatedSprite2D):
	if dir.length() == 0:
		if abs(prev_dir.x) > abs(prev_dir.y):
			if is_attacking:
				anim_sprite.play("AttackSide")
			else:
				anim_sprite.play("IdleSide")
		elif prev_dir.y < 0:
			if is_attacking:
				anim_sprite.play("AttackUp")
			else:
				anim_sprite.play("IdleUp")
		else:
			if is_attacking:
				anim_sprite.play("AttackDown")
			else:
				anim_sprite.play("IdleDown")
	elif abs(dir.y) > abs(dir.x):
		if dir.y < 0:
			if is_attacking:
				anim_sprite.play("AttackUp")
			else:
				anim_sprite.play("WalkUp")
		else:
			if is_attacking:
				anim_sprite.play("AttackDown")
			else:
				anim_sprite.play("WalkDown")
	else:
		if is_attacking:
			anim_sprite.play("AttackSide")
		else:
			anim_sprite.play("WalkSide")
