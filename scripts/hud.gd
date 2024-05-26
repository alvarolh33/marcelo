extends Control

@onready var n_vidas_label = $HBoxContainer/n_vidas
@onready var n_gold = $gold/n_gold
@onready var save = $saveGame/save

func set_hp(a):
	n_vidas_label.text = str(a)

func set_gold(a):
	n_gold.text = str(a)

func set_saveLabel(a):
	save.text = a
