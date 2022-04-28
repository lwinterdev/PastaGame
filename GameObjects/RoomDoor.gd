extends Area2D

var room
export var current_room = ""
export (String,FILE, "*.tscn") var goal_room


func _on_RoomDoor_body_entered(body):
		if body.is_in_group("player"):
			print("change room to " + goal_room)

			room.player = body
			room.player_spawn_position = $SpawnPosition.global_position
#			GlobalRoomLoader.player_spawn_position = $SpawnPosition.global_position
#			print(GlobalRoomLoader.player_spawn_position)
			room.save_room()
			GlobalSceneLoader.goto_scene(goal_room)
