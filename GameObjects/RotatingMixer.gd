extends Area2D

func _physics_process(delta):
	rotation_degrees -= 1


func _on_RotatingMixer_body_entered(body):
	if body.is_in_group("player"):
		body.player_death()
	pass # Replace with function body.
