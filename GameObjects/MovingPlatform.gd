extends KinematicBody2D

var speed = 40
var direction = -1

func _ready():
	pass


func _physics_process(delta):
	position.x += direction * speed * delta


func _on_TurnTimer_timeout():
	direction *= -1
	pass # Replace with function body.
