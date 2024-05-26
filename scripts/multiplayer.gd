extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene

func _on_host_pressed():
	peer.create_server(135) #Puerto abierto
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player(multiplayer.get_unique_id())
	print("El host ha creado la partida")
	
func _add_player(id):
	var player = player_scene.instantiate()
	player.set_multiplayer_authority(id)
	player.name = str(id)
	add_child(player)
	
func _on_join_pressed():
	peer.create_client("127.0.0.1", 135)
	multiplayer.multiplayer_peer = peer
	print("El jugador ha entrado a la partida")

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
