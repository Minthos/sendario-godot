extends Node3D

signal launch_dynamite(stick, direction, location)

var resource_dynamite = preload("res://dynamite.tscn")
var cooldown = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cooldown = max(cooldown - delta, 0.0)
	if Input.is_action_pressed("fire") and cooldown < 0.001:
		cooldown = 1.0
		var forward = get_global_transform().basis.z.normalized()
		launch_dynamite.emit(resource_dynamite, forward * 5.0, global_position)
	
