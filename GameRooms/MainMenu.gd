extends Control

var kitchen_room1 = "res://GameRooms/KitchenRoom1.tscn"

func _ready():
	$CenterContainer/VBoxContainer/MainMenuStartButton.grab_focus()

func _on_MainMenuStartButton_pressed():
	GlobalSceneLoader.current_scene = self
	GlobalSceneLoader.goto_scene(kitchen_room1)
	pass # Replace with function body.
