extends RigidBody3D

@export var damage : float

func spawn_force(force : Vector3):
	apply_impulse(force)