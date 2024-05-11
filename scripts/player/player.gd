extends CharacterBody2D

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 50
	move_and_slide()
	
	#look_at(get_global_mouse_position())
