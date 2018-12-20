extends Area2D

var speed = 256
var velocity = Vector2(0, 0)
var direction = Vector2(0, 0)

func _ready():
	pass

func _physics_process(delta):
	var offset = (velocity * speed * delta)
	var new_position = self.position + offset;
	new_position.x += self.direction.x * get_node("CollisionShape2D").get_shape().get_extents().y
	new_position.y += self.direction.x * get_node("CollisionShape2D").get_shape().get_extents().y
	
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(self.position, new_position, [self, get_node("/root/RootNode/Player")])
	if result:
		self.queue_free()
	else:
		self.translate(offset)

func set_velocity(direction):
	var up = Vector2(0,-1)
	self.rotate(up.angle_to(direction))
	self.direction = direction
	self.velocity = direction.normalized()
