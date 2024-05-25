extends Entity

var attack_in_cooldown: bool = false
@onready var attack_hitbox = $AttackHitbox/CollisionShape2D
var scene_hud = preload("res://scenes/hud.tscn")
var hud
var gold: int = 0

func _ready():
	hud = scene_hud.instantiate()
	add_child(hud)
	hud.set_hp(vidas)
	position = Vector2.ZERO

func _process(delta):
	super(delta)
	match animated_sprite.animation:
		"IdleUp", "WalkUp":
			attack_hitbox.rotation = -(PI / 2)
			attack_hitbox.position = Vector2(0.0, -16.0)
		"IdleDown", "WalkDown":
			attack_hitbox.rotation = PI / 2
			attack_hitbox.position = Vector2(0.0, 16.0)
		"IdleSide", "WalkSide":
			if prev_direction.x > 0:
				attack_hitbox.rotation = 0
				attack_hitbox.position = Vector2(16.0, 0.0)
			else:
				attack_hitbox.rotation = PI
				attack_hitbox.position = Vector2(-16.0, 0.0)
		
	if Input.is_action_pressed("run"):
		speed = 100
	else:
		speed = 70

func trying_to_attack():
	return Input.is_action_just_pressed("attack") && !attack_in_cooldown

func _on_death_area_entered(body):
	super.die()

func add_gold(a):
	gold += a
	if hud != null:
		hud.set_gold(gold)

func attack():
	var overlapping_objects = $AttackHitbox.get_overlapping_areas()
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
