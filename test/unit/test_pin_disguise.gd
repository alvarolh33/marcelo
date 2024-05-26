extends GutTest

var lock = load("res://scripts/lock.gd")
var instance = null

func before_each():
	instance = lock.new()

func after_each():
	instance = null

func test_disguise():
	assert_eq(instance.disguise, 0, "disguise debería ser 0 al inicio (no se oculta)")
	
	instance._on_button_on_pressed()
	assert_eq(instance.disguise, 1, "disguise debería ser 1 después de presionar ON una vez (se oculta)")
	
	instance._on_button_on_pressed()
	assert_eq(instance.disguise, 0, "disguise debería ser 0 después de presionar ON dos veces (no se oculta)")
