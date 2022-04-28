extends Area2D

var speed = 20
var direction = 1

func _physics_process(delta):
	position.y += direction * speed * delta

func _on_TurnTimer_timeout():
	direction *= -1
	pass # Replace with function body.


func _on_DeadlyNoodleWood_body_entered(body):
	if body.is_in_group("player"):
		pass
		
	pass # Replace with function body.
