extends GutTest

var lock = load("res://scripts/lock.gd")
var instance = null

func before_each():
	instance = lock.new()

func after_each():
	instance = null

func test_button_sequence():
	instance._on_button_1_pressed()
	instance._on_button_2_pressed()
	instance._on_button_3_pressed()
	instance._on_button_4_pressed()
	assert_eq(instance.key_1, 1, "key_1 should be 1 after pressing button 1")
	assert_eq(instance.key_2, 2, "key_2 should be 2 after pressing button 2")
	assert_eq(instance.key_3, 3, "key_3 should be 3 after pressing button 3")
	assert_eq(instance.key_4, 4, "key_4 should be 4 after pressing button 4")
	assert_eq(instance.next, 5, "next should be 5 after pressing four buttons")
