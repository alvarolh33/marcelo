extends Node2D

var key_1 = "_"
var key_2 = "_"
var key_3 = "_"
var key_4 = "_"

var next = 1
var disguise = 0

func _process(delta):
	
	$L_Key_1.text = str(key_1)
	$L_Key_2.text = str(key_2)
	$L_Key_3.text = str(key_3)
	$L_Key_4.text = str(key_4)
	
	$Next.text = str(next)
	
	if disguise == 0:
		$Button_ON.text = "ON"
	if disguise == 1:
		$Button_ON.text = "OFF"
		
		if next > 1:
			$L_Key_1.text = "*"
		if next > 2:
			$L_Key_2.text = "*"
		if next > 3:
			$L_Key_3.text = "*"
		if next > 4:
			$L_Key_4.text = "*"

func _on_button_1_pressed():
	
	if next == 1:
		key_1 = 1
	if next == 2:
		key_2 = 1
	if next == 3:
		key_3 = 1
	if next == 4:
		key_4 = 1
		
	if next < 5:
		next += 1
	

func _on_button_2_pressed():
	if next == 1:
		key_1 = 2
	if next == 2:
		key_2 = 2
	if next == 3:
		key_3 = 2
	if next == 4:
		key_4 = 2
		
	if next < 5:
		next += 1


func _on_button_3_pressed():
	if next == 1:
		key_1 = 3
	if next == 2:
		key_2 = 3
	if next == 3:
		key_3 = 3
	if next == 4:
		key_4 = 3
		
	if next < 5:
		next += 1


func _on_button_4_pressed():
	if next == 1:
		key_1 = 4
	if next == 2:
		key_2 = 4
	if next == 3:
		key_3 = 4
	if next == 4:
		key_4 = 4
		
	if next < 5:
		next += 1


func _on_button_5_pressed():
	if next == 1:
		key_1 = 5
	if next == 2:
		key_2 = 5
	if next == 3:
		key_3 = 5
	if next == 4:
		key_4 = 5
		
	if next < 5:
		next += 1


func _on_button_6_pressed():
	if next == 1:
		key_1 = 6
	if next == 2:
		key_2 = 6
	if next == 3:
		key_3 = 6
	if next == 4:
		key_4 = 6
		
	if next < 5:
		next += 1


func _on_button_7_pressed():
	if next == 1:
		key_1 = 7
	if next == 2:
		key_2 = 7
	if next == 3:
		key_3 = 7
	if next == 4:
		key_4 = 7
		
	if next < 5:
		next += 1


func _on_button_8_pressed():
	if next == 1:
		key_1 = 8
	if next == 2:
		key_2 = 8
	if next == 3:
		key_3 = 8
	if next == 4:
		key_4 = 8
		
	if next < 5:
		next += 1


func _on_button_9_pressed():
	if next == 1:
		key_1 = 9
	if next == 2:
		key_2 = 9
	if next == 3:
		key_3 = 9
	if next == 4:
		key_4 = 9
		
	if next < 5:
		next += 1


func _on_button_0_pressed():
	if next == 1:
		key_1 = 0
	if next == 2:
		key_2 = 0
	if next == 3:
		key_3 = 0
	if next == 4:
		key_4 = 0
		
	if next < 5:
		next += 1


func _on_button_del_pressed():
	key_1 = "_"
	key_2 = "_"
	key_3 = "_"
	key_4 = "_"
	next = 1
	$PIN.text = "Lock"
	$PIN.modulate = Color(255, 255, 255)

func _on_button_ent_pressed():
	
	#pin error
	$PIN.text = "Error"
	$PIN.modulate = Color(255, 0, 0)
	
	#pin correct
	if next == 5 :
		if key_1 == 1:
			if key_2 == 2:
				if key_3 == 3:
					if key_4 == 4:
						$PIN.text = "Unlock"
						$PIN.modulate = Color(0, 255, 0)
						await get_tree().create_timer(1).timeout
						get_tree().change_scene_to_file("res://scenes/admin_profile.tscn")

func _on_button_on_pressed():
	disguise += 1
	
	if disguise == 2:
		disguise = 0


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/profile.tscn")
