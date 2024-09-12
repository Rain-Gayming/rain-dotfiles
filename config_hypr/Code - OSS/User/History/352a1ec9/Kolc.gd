extends RigidBody3D

func spawn_force(force : Vector3):
	apply_impulse(force)