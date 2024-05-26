extends GutTest

var lock = load("res://scripts/lock.gd")
var label = null

func before_each():
	label = lock.new()

func after_each():
	label = null

func test_initial_state():
	assert_eq(label.key_1, "_", "key_1 debería ser '_' al inicio")
	assert_eq(label.key_2, "_", "key_2 debería ser '_' al inicio")
	assert_eq(label.key_3, "_", "key_3 debería ser '_' al inicio")
	assert_eq(label.key_4, "_", "key_4 debería ser '_' al inicio")
	assert_eq(label.next, 1, "next debería ser 1 al inicio")
	assert_eq(label.disguise, 0, "disguise debería ser 0 al inicio (OFF)")
