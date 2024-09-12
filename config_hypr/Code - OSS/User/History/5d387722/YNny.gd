extends WeaponManager

func attack():	
	if current_cooldown <= 0:
		print("shooting")
		current_cooldown = weapon_item.attack_speed