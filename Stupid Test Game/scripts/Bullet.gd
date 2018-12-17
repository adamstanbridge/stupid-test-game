extends Area2D

var speed = 256
var velocity = Vector2(0, 0)

func _ready():
	pass

func _physics_process(delta):
	self.translate(velocity * speed * delta)
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if "TileMap" in body.get_name():
			get_node("Sprite").visible = false
			self.queue_free()

func set_velocity(direction):
	var up = Vector2(0,-1)
	self.rotate(up.angle_to(direction))
	self.velocity = direction.normalized()
