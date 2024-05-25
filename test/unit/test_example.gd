extends GutTest


var player = preload("res://scripts/player.gd")

func test_addition():
	var instance = player.new()
	instance.add_gold(3)
	assert_eq(instance.gold, 3, "debería ser 3")
	instance.add_gold(5)
	assert_eq(instance.gold, 8, "debería ser 8")
