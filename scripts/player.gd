extends Entity

var attack_in_cooldown: bool = false

func _ready():
	position = Vector2.ZERO

func _process(delta):
	super(delta)
	if Input.is_action_pressed("run"):
		speed = 100
	else:
		speed = 70

func trying_to_attack():
	return Input.is_action_just_pressed("attack") && !attack_in_cooldown

func _on_death_area_entered(body):
	super.die()

func attack():
	var overlapping_objects = $Area2D.get_overlapping_areas()
	for area in overlapping_objects:
		if area.is_in_group("enemy"):
			area.get_parent().take_damage()
	
	#$Area2D/CollisionShape2D.disabled = true
	
	is_attacking = true
	attack_in_cooldown = true
	$Attacking.start()
	$AttackCooldown.start()
	print("Jugador atacando")

func _on_area_2d_body_entered(body):	 #Alguien fue atacado
	if body.is_in_group("Hit"):
		body.take_damage()

func _on_attacking_timeout():
	is_attacking = false
	#$Area2D/CollisionShape2D.disabled = true

func _on_attack_cooldown_timeout():
	attack_in_cooldown = false
