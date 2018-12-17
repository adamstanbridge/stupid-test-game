extends KinematicBody2D

var velocity = Vector2()
var speed = 64

var bulletScene = preload("res://scenes/Bullet.tscn")

func _ready():
	pass

func _process(delta):
	if (Input.is_action_just_pressed('fire_up')):
		create_bullet(Vector2(0, -1))
	elif (Input.is_action_just_pressed("fire_right")):
		create_bullet(Vector2(1, 0))
	elif (Input.is_action_just_pressed("fire_down")):
		create_bullet(Vector2(0, 1))
	elif (Input.is_action_just_pressed("fire_left")):
		create_bullet(Vector2(-1, 0))

func _physics_process(delta):
	velocity = Vector2(0,0)

	if (Input.is_action_pressed('move_up')):
		velocity.y += -1
	if (Input.is_action_pressed('move_down')):
		velocity.y += 1
	if (Input.is_action_pressed('move_left')):
		velocity.x += -1
	if (Input.is_action_pressed('move_right')):
		velocity.x += 1
	
	velocity = velocity.normalized()
	velocity *= speed
	
	move_and_slide(velocity)

func create_bullet(direction):
	var bullet = bulletScene.instance()
	get_node("/root/RootNode").add_child(bullet)
	bullet.global_position = self.global_position
	bullet.set_velocity(direction)
