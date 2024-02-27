extends GPUParticles3D

var countdown_to_death = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countdown_to_death -= delta
	if countdown_to_death < 0.0:
		queue_free()
