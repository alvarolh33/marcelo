extends GutTest

var player = preload("res://scripts/player.gd")

func test_guardar_partida():
	var player_instance = player.new()
	#Cargo como path de lectura de partidas de player una partida para testear:
	player_instance.save_game_path = "res://test/saves_for_testing/test1.save"
	
	
	player_instance.gold = 1
	player_instance.vidas = 2
	player_instance.position.x = 432.4
	player_instance.position.y = 5.2
	
	assert_eq(player_instance.gold, 1, "debería ser 1")
	assert_eq(player_instance.vidas, 2, "debería ser 2")
	
	#Cargo los datos de prueba del fichero anteriormente indicado
	#También compruebo que se carga correctamente
	assert_true(player_instance.load_game(), "Error al cargar")
	
	#Probar que se han cargado los datos correctamente
	assert_almost_eq(player_instance.position.x, 0.0, 0.1, "debería ser 0.0")
	assert_almost_eq(player_instance.position.y, 0.0, 0.1, "debería ser 0.0")
	assert_eq(player_instance.vidas, 1, "debería ser 1")
	assert_eq(player_instance.gold, 0, "debería ser 0")
	
	#Hago cambios en jugador para volver a probar
	player_instance.gold = 3
	player_instance.vidas = 12
	player_instance.position.x = 10
	player_instance.position.y = 12
	
	assert_almost_eq(player_instance.position.x, 10, 0.1, "debería ser 0.0")
	assert_almost_eq(player_instance.position.y, 12, 0.1, "debería ser 0.0")
	assert_eq(player_instance.vidas, 12, "debería ser 43")
	assert_eq(player_instance.gold, 3, "debería ser 345")
	
	#Cargo nuevos datos:
	player_instance.save_game_path = "res://test/saves_for_testing/test2.save"
	assert_true(player_instance.load_game(), "Error al cargar")
	
	#Probando test2.save
	assert_almost_eq(player_instance.position.x, 12.0, 0.1, "debería ser 0.0")
	assert_almost_eq(player_instance.position.y, 64.0, 0.1, "debería ser 0.0")
	assert_eq(player_instance.vidas, 43, "debería ser 43")
	assert_eq(player_instance.gold, 345, "debería ser 345")
	
	#Cargo nuevos datos:
	player_instance.save_game_path = "res://test/saves_for_testing/test3.save"
	assert_true(player_instance.load_game(), "Error al cargar")
	
	#Probando test3.save
	assert_almost_eq(player_instance.position.x, 23.124, 0.1, "debería ser 0.0")
	assert_almost_eq(player_instance.position.y, 55.1, 0.1, "debería ser 0.0")
	assert_eq(player_instance.vidas, 1, "debería ser 43")
	assert_eq(player_instance.gold, 125, "debería ser 345")
