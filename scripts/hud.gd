extends Control

@onready var n_vidas_label = $HBoxContainer/n_vidas

func set_vidas(a):
	n_vidas_label.text = str(a)
