extends GutTest

func test_add_player():
	var multiplayer_node = preload("res://scripts/multiplayer.gd").new()
	multiplayer_node.player_scene = preload("res://scenes/level_multiplayer.tscn")
	# Simular agregar un jugador con ID 1
	multiplayer_node._add_player(1)
	# Verificar que el jugador fue agregado
	var player = multiplayer_node.get_node("1")
	assert_not_null(player, "El jugador no fue agregado correctamente.")
	assert_eq(player.get_multiplayer_authority(), 1, "La autoridad del jugador no es la correcta.")
