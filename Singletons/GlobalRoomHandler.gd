extends Node

var new_game
var kitchen_room1_new = true
var kitchen_room2_new = true
var kitchen_room3_new = true
var kitchen_room4_new = true
var kitchen_room5_new = true
var kitchen_room6_new = true
var kitchen_room7_new = true
var kitchen_room8_new = true

var kitchen_room1 = {
	"player_spawn_positon" : null,
}


var kitchen_room2= {
	"player_spawn_position": null,
}


var kitchen_room3= {
	"player_spawn_position": null,
}


var kitchen_room4= {
	"player_spawn_position": null,
}

var kitchen_room5= {
	"player_spawn_position": null,
}

var kitchen_room6= {
	"player_spawn_position": null,
}

var kitchen_room7= {
	"player_spawn_position": null,
}



func save_room(player,room,player_spawn_position):
	match room:
		"kitchen_room1":
			kitchen_room1.player_spawn_position = player_spawn_position

		"kitchen_room2":
			kitchen_room2.player_spawn_position = player_spawn_position
			
		"kitchen_room3":
			kitchen_room3.player_spawn_position = player_spawn_position
			
		"kitchen_room4":
			kitchen_room4.player_spawn_position = player_spawn_position
			
		"kitchen_room5":
			kitchen_room5.player_spawn_position = player_spawn_position
			
		"kitchen_room6":
			kitchen_room6.player_spawn_position = player_spawn_position
			
		"kitchen_room7":
			kitchen_room7.player_spawn_position = player_spawn_position
			
		

 

func load_room(player,room):
	match room:
		"kitchen_room1":
			player.global_position = kitchen_room1.player_spawn_position
	
		"kitchen_room2":
			player.global_position = kitchen_room2.player_spawn_position
			
		"kitchen_room3":
			player.global_position = kitchen_room3.player_spawn_position
			
		"kitchen_room4":
			player.global_position = kitchen_room4.player_spawn_position
		
		"kitchen_room5":
			player.global_position = kitchen_room5.player_spawn_position
			
		"kitchen_room6":
			player.global_position = kitchen_room6.player_spawn_position
			
		"kitchen_room7":
			player.global_position = kitchen_room7.player_spawn_position
