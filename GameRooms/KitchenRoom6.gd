extends Node2D


var room_name = "kitchen_room6"
var player
var player_spawn_position

func _ready():
	
	for room_changer in get_tree().get_nodes_in_group("room_changer"):
		room_changer.room = self
		room_changer.current_room = room_name
	
	
	if GlobalRoomHandler.kitchen_room6_new == false:
		GlobalRoomHandler.load_room(player,room_name)
	
	GlobalRoomHandler.kitchen_room6_new = false
	GlobalRoomHandler.kitchen_room6.player_spawn_position = player.position
	
	
	player.active_scene = self
	
func save_room():
	GlobalSceneLoader.current_scene = self
	GlobalRoomHandler.save_room(player,room_name,player_spawn_position)

func load_room():
	GlobalRoomHandler.load_room(player,room_name)
