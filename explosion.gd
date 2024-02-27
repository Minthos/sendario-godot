extends GPUParticles3D

var countdown_to_death = 1.0
var applied = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not applied:
		var area = $Area3D
		for victim in area.get_overlapping_bodies():
			var force_vector = victim.global_position - area.global_position
			victim.apply_impulse(force_vector * 100.0 * victim.mass / (1.0 + force_vector.length_squared()))
			applied = true
	countdown_to_death -= delta
	if countdown_to_death < 0.0:
		queue_free()
