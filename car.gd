extends VehicleBody3D

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * 10.0 / (20 + linear_velocity.length()), 5 * delta)
	engine_force = Input.get_axis("back", "forward") * 40000

