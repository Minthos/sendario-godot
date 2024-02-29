extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if current:
		var from = global_transform.origin
		var to = from + Vector3.DOWN * 1000 # Cast down 1000 units, adjust as necessary
		var space_state = get_world_3d().direct_space_state
		var result = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(from, to))
		var altitude = 1000.0
		if result.size() != 0:
			altitude = from.distance_to(result.position)
		var delta_pos = Vector3(Input.get_axis("left", "right"), Input.get_axis("zoomin", "zoomout"), Input.get_axis("forward", "back"))
		global_translate(delta_pos * altitude * delta * 2.0)
		
		
