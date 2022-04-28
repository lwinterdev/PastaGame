extends Area2D



func _on_DeathBox_body_entered(body):
	
	if body.is_in_group("player"):
		body.player_death()
	pass # Replace with function body.

