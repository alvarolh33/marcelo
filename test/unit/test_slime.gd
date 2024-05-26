extends GutTest

var enemy = load("res://scripts/slime.gd") 
var instance = null

func before_each():
	instance = enemy.new()
	instance._ready() 

func after_each():
	instance = null

func test_get_dir_enemy():
	assert_eq(instance.speed, 30.0, "speed debería ser 30.0")
	
	#Estando el jugador lejos del enemigo:
	instance.player_position = Vector2(100, 100)
	assert_eq(instance.get_direction(), Vector2.ZERO, "debería ser (0,0)")
	
	#Estando el jugador en la misma posicion
	instance.player_position = instance.position
	assert_eq(instance.get_direction(), Vector2.ZERO, "debería ser (0,0)")
	
	#Estando el jugador cerca del enemigo:
	instance.player_position = Vector2(instance.player_position.x + 1.0, instance.player_position.y)
	assert_eq(instance.get_direction(), Vector2(1,0), "debería ser (1,0)")
	
	instance.player_position = Vector2(instance.player_position.x - 1.0, instance.player_position.y - 1)
	assert_eq(instance.get_direction(), Vector2(0,-1), "debería ser (0,-1)")
	
	instance.player_position = Vector2(instance.player_position.x - 1.0, instance.player_position.y)
	assert_almost_eq(instance.get_direction(), Vector2(-0.707,-0.707), Vector2(0.01, 0.01),  "debería ser (-0.707,-0.707)")
