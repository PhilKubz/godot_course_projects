extends RigidBody3D

@export var move_speed : float = 2

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		linear_velocity.x = -move_speed
	if Input.is_action_pressed("move_right"):
		linear_velocity.x = move_speed
