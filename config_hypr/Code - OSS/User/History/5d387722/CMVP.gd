extends WeaponManager

@export_group("references")
@export var muzzle : Node3D

func attack():	
	if current_cooldown <= 0:
		print("shooting")
		current_cooldown = weapon_item.attack_speed

		#spawn the projectile
		var new_projectile = weapon_item.projectile

		#remove projectile from the weapon
		owner.add_child(new_projectile)

		new_projectile.global_transform = muzzle.global_transform

		#add force to the projectile
		new_projectile.spawn_force(-muzzle.transform.aim.z * shoot_force)

