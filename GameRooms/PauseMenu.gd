extends Control

var main_menu = "res://GameRooms/MainMenu.tscn"

func _on_Resume_pressed():
	get_tree().paused = false
	visible = false
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().paused = false
	GlobalSceneLoader.goto_scene(main_menu)
	pass # Replace with function body.
