extends GutTest

var player = preload("res://scripts/player.gd")
var hud = preload("res://scenes/hud.tscn")
var player_instance
var hud_instance

func before_each():
	player_instance = player.new()
	add_child(player_instance)
	hud_instance = player_instance.hud

func test_hud_gold():
	player_instance.gold = 0
	hud_instance.n_gold.text = "0"
	
	# Probar que se inicializan bien los label del HUD
	assert_eq(hud_instance.n_gold.text, "0", "debería ser 0")
	
	####	Probar ganar/perder dinero en player y en hub:
	# Compruebo que set_gold de hud funciona
	hud_instance.set_gold(14)
	assert_eq(hud_instance.n_gold.text, "14", "debería ser 14")
	
	# Poner el valor del oro del hub igual al de player
	hud_instance.set_gold(player_instance.gold)
	assert_eq(hud_instance.n_gold.text, "0", "debería ser 0")
	
	# Pruebo si llamando al set_gold() de player funciona y también modifica el hud
	player_instance.add_gold(23)
	assert_eq(player_instance.gold, 23, "debería ser 23")
	assert_eq(hud_instance.n_gold.text, "23", "debería ser 23")
	
	# Hago pruebas con otros números (gold nunca será < 0):
	player_instance.add_gold(-326)
	assert_eq(player_instance.gold, 0, "debería ser 0 pues no puede ser negativo")
	assert_eq(hud_instance.n_gold.text, "0", "debería ser 0 pues no puede ser negativo")
	player_instance.add_gold(432643)
	assert_eq(player_instance.gold, 432643, "debería ser 432643")
	assert_eq(hud_instance.n_gold.text, "432643", "debería ser 432643")


func test_hud_vidas():
	player_instance.vidas = 3
	hud_instance.n_vidas_label.text = "3"
	
	# Probar que se inicializan bien los label del HUD
	assert_eq(hud_instance.n_vidas_label.text, "3", "debería ser 3")
	
	####	Probar ganar/perder vidas en player y en hub:
	# Compruebo que set_hp de hud funciona
	hud_instance.set_hp(10)
	assert_eq(hud_instance.n_vidas_label.text, "10", "debería ser 10")
	
	# Poner el valor de las vidas del hub igual al de player
	hud_instance.set_hp(player_instance.vidas)
	assert_eq(hud_instance.n_vidas_label.text, "3", "debería ser 3")
	
	# Pruebo si llamando al add_hp() de player funciona y también modifica el hud
	player_instance.add_hp(3)
	assert_eq(player_instance.vidas, 6, "debería ser 6")
	assert_eq(hud_instance.n_vidas_label.text, "6", "debería ser 6")
	
	# Hago pruebas con otros números (vidas nunca será < -1):
	player_instance.add_hp(-3006)
	assert_eq(player_instance.vidas, -1, "debería ser -1")
	assert_eq(hud_instance.n_vidas_label.text, "-1", "debería ser -1 pues no puede ser negativo")
	player_instance.add_hp(2345563)
	assert_eq(player_instance.vidas, 2345562, "debería ser 2345562")
	assert_eq(hud_instance.n_vidas_label.text, "2345562", "debería ser 2345562")
