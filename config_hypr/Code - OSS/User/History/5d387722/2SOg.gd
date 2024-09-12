extends WeaponManager

@export_group("references")
@export var muzzle : Node3D

func attack():	
	if current_cooldown <= 0:
		print("shooting")
		current_cooldown = we apon_item.attack_speed

		#spawn the projectile
		var new_projectile = weapon_item.projectile.instantiate()

		#remove projectile from the weapon
		owner.add_child(new_projectile)

		new_projectile.global_transform = muzzle.global_transform

		#add force to the projectile
		var aim = new_projectile.global_transform.global_basis
		new_projectile.spawn_force(-aim.z * weapon_item.force)

