extends GutTest

var enemy = load("res://scripts/slime.gd") 
var instance = null

func before_each():
	instance = enemy.new()
	instance._ready() 

func after_each():
	instance = null

func test_speed():
	assert_eq(instance.speed, 30.0, "speed debería ser 30.0")
