extends KinematicBody2D

onready var coyote_timer = $CoyoteTimer
onready var jump_buffer = $JumpBuffer

onready var sprite = $AnimatedSprite

onready var pause_menu = $CanvasLayer/PauseMenu

# player attributes
var health = 100

var gravity = 300
var jump_speed = -150
var speed = 70
var max_speed = 120
var friction = 0.3
var acceleration = 0.7



var can_grapple = true
var grappling = false

var jumping = false
var was_grounded 
var velocity = Vector2.ZERO
var direction = 0

var active_scene


func _ready():
	get_parent().player_spawn_position = global_position
	get_parent().player = self
	#set camera limits to room tilemap
	
	var tilemap_rect = get_parent().get_node("TileMap").get_used_rect()
	var tilemap_size = get_parent().get_node("TileMap").cell_size

	$Camera2D.limit_left = tilemap_rect.position.x * tilemap_size.x
	$Camera2D.limit_right = tilemap_rect.end.x * tilemap_size.x
	$Camera2D.limit_top = tilemap_rect.position.y * tilemap_size.y
	$Camera2D.limit_bottom = tilemap_rect.end.y * tilemap_size.y
	

func _physics_process(delta):

	get_input()

	velocity.y += gravity * delta
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if !is_on_floor() and was_grounded and !jumping:
		coyote_timer.start()
	
	if is_on_floor() and !jump_buffer.is_stopped():
		jump_buffer.stop()
		jump()
	
	
func get_input():
	direction = 0
	if Input.is_action_pressed("move_right"):
		direction = 1
		sprite.flip_h = false
		if is_on_floor():
			sprite.play("walk")

	
	if Input.is_action_pressed("move_left"):
		direction = -1
		sprite.flip_h = true
		if is_on_floor():
			sprite.play("walk")
		
	
	if Input.is_action_just_pressed("jump"):
		jump()
	
	
	if Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left") or Input.is_action_just_released("jump"):
		sprite.play("default")
	
	
	if Input.is_action_pressed("ui_cancel"):
		pause_menu.visible = true
		get_tree().paused = true
	
	
	if is_on_floor():
		jumping = false
		was_grounded = true

	if velocity.y >= 0:
		jumping = false
		jump_buffer.stop()
	
	if !is_on_floor() and was_grounded and !jumping:
			coyote_timer.start()
	
	if direction != 0:
		velocity.x = lerp(velocity.x, direction * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		


func jump():
	if is_on_floor() and !jumping: 
			coyote_timer.stop()
			velocity.y = jump_speed
			jumping = true
			sprite.play("jump")
	else:
			jump_buffer.start()


func player_death():
	print("rip")
	
	active_scene.load_room()
	
	

