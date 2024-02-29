extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("mode"):
		$cam_rts.current = not $cam_rts.current

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _on_dynamite_launcher_launch_dynamite(stick, direction, location):
	var object = stick.instantiate()
	object.explode.connect(_on_explode)
	add_child(object)
	object.position = location
	object.apply_impulse(direction)

func _on_explode(explosion, location):
	var object = explosion.instantiate()
	add_child(object)
	object.global_position = location

