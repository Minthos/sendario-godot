extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _on_dynamite_launcher_launch_dynamite(stick, direction, location):
	var object = stick.instantiate()
	add_child(object)
	object.position = location
	object.apply_impulse(direction)
