extends GutTest

var player = preload("res://scripts/player.gd")

func test_guardar_partida():
	var player_instance = player.new()
	var path = player_instance.save_game_path
	player_instance.gold = 0
	player_instance.vidas = 0
	player_instance.position.x = 0.0
	player_instance.position.y = 0.0
	
	assert_eq(player_instance.gold, 0, "debería ser 0")
	assert_eq(player_instance.vidas, 0, "debería ser 0")
	
	#Guardo partida y leo los datos que ha guardado
	player_instance.save_game()
	var json_string = FileAccess.open(path, FileAccess.READ).get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
	var save_state = json.get_data()
	
	#Probar que se han guardado los datos correctamente
	assert_eq(save_state["pos_x"], player_instance.position.x, "debería ser 0.0")
	assert_eq(save_state["pos_y"], player_instance.position.y, "debería ser 0.0")
	assert_eq(save_state["hp"], player_instance.vidas, "debería ser 0")
	assert_eq(save_state["gold"], player_instance.gold, "debería ser 0")
	
	#Hago cambios en jugador para volver a guardar
	player_instance.gold = 345
	player_instance.vidas = 43
	player_instance.position.x = 12.43
	player_instance.position.y = 64.3
	
	#Guardo partida y leo los datos que ha guardado
	player_instance.save_game()
	json_string = FileAccess.open(path, FileAccess.READ).get_line()
	json = JSON.new()
	parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
	save_state = json.get_data()
	
	#Probar que se han guardado los datos correctamente
	assert_eq(int(save_state["pos_x"]), int(player_instance.position.x), "debería ser 12")
	assert_eq(int(save_state["pos_y"]), int(player_instance.position.y), "debería ser 64")
	assert_eq(save_state["hp"], player_instance.vidas, "debería ser 43")
	assert_eq(save_state["gold"], player_instance.gold, "debería ser 345")
