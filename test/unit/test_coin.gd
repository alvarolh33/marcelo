extends GutTest

var player = preload("res://scripts/player.gd")
var coin = preload("res://scripts/coin.gd")

func test_obtener_moneda():
	var player_instance = player.new()
	var coin_instance = coin.new()
	
	# Pruebo la funcion añadir oro de player
	player_instance.add_gold(5)
	assert_eq(player_instance.gold, 5, "debería ser 5")
	
	player_instance.add_gold(45340)
	assert_eq(player_instance.gold, 45345, "debería ser 45345")
	
	player_instance.gold = 0
	
	# Le doy una moneda a player
	coin_instance._on_body_entered(player_instance)
	assert_eq(player_instance.gold, 1, "debería ser 1")
	
	# Cambio valor de la moneda y le doy otra
	coin_instance.valor = 2
	coin_instance._on_body_entered(player_instance)
	assert_eq(player_instance.gold, 3, "debería ser 3")
