extends Camera3D

func _ready():
	pass

func altitude_vector(limit, fallback):
	var from = global_transform.origin
	var to = from + Vector3.DOWN * limit
	var space_state = get_world_3d().direct_space_state
	var result = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(from, to))
	if result.size() != 0:
		return from - result.position
	else:
		return Vector3.UP * fallback

func _physics_process(delta):
	if current:
		var altitude = altitude_vector(1000.0, 1000.0).length()
		var delta_pos = Vector3(Input.get_axis("left", "right"),
			Input.get_axis("zoomin", "zoomout"),
			Input.get_axis("forward", "back"))
		global_translate(delta_pos * altitude * delta * 2.0)
