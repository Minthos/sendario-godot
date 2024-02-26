extends JoltHingeJoint3D

func _physics_process(delta):
	motor_target_velocity = Input.get_axis("arm_down", "arm_up")

