extends RigidBody3D

var explosion = preload("res://explosion.tscn")
var fuse = 3.0

signal explode(explosion, location)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fuse -= delta
	if fuse < 0.0:
		explode.emit(explosion, global_position)
		queue_free()

