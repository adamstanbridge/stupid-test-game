extends KinematicBody2D

var velocity = Vector2()
var speed = 200

func _ready():
	pass

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