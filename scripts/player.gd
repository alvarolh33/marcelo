extends Entity

var save_game_path := "user://save_games/game1.save"
var attack_in_cooldown: bool = false
var save_in_cooldown: bool = false
@onready var attack_hitbox = $AttackHitbox/CollisionShape2D
var scene_hud = preload("res://scenes/hud.tscn")
var hud
var gold: int = 0

func _ready():
	hud = scene_hud.instantiate()
	add_child(hud)
	hud.set_hp(vidas)
	position = Vector2.ZERO
	load_game()
	hud.set_hp(vidas)
	hud.set_gold(gold)

func _process(delta):
	super(delta)
	if animated_sprite == null:
		return
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
		
	if !save_in_cooldown && Input.is_action_pressed("save_game"):
		save_game()
		print("Save game")
		save_in_cooldown = true
		hud.set_saveLabel("Saving game...")
		$SaveGameCooldown.start()

func save():
	var save_dict = {
		"gold" : gold,
		"hp" : vidas,
		"pos_x" : position.x,
		"pos_y" : position.y,
	}
	return save_dict

func save_game():
	var save = FileAccess.open(save_game_path, FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save.store_line(json_string)

func load_game():
	print("PLAYER cargando: " + save_game_path)
	if not FileAccess.file_exists(save_game_path):
		return # Error! We don't have a save to load.
	var save = FileAccess.open(save_game_path, FileAccess.READ)
	var json_string = save.get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
	var node_data = json.get_data()
	print("Intentando cargar posición")
	position = Vector2(node_data["pos_x"], node_data["pos_y"])
	for i in node_data.keys():
		if i == "pos_x" or i == "pos_y":
			continue
		set(i, node_data[i])


func trying_to_attack():
	return Input.is_action_just_pressed("attack") && !attack_in_cooldown

func _on_death_area_entered(body):
	super.die()

func add_hp(a):
	super(a)
	hud.set_hp(vidas)

func add_gold(a):
	gold += a
	if gold < 0:
		gold = 0
	if hud != null:
		hud.set_gold(gold)

func attack():
	if $AttackHitbox == null:
		return
	var overlapping_objects = $AttackHitbox.get_overlapping_areas()
	for area in overlapping_objects:
		if area.is_in_group("enemy"):
			area.get_parent().take_damage()
	
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


func _on_save_game_cooldown_timeout():
	hud.set_saveLabel("<f2> to save the game")
	save_in_cooldown = false
