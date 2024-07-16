extends Node

@export var upgrade_pool: Array[AbilityUpgrade]
@export var experience_manager: Node

var curr_upgrades = {}

func _ready():
	experience_manager.level_up.connect(on_level_up)


func on_level_up(new_level: int):
	var chosen_upgrade = upgrade_pool.pick_random() as AbilityUpgrade
	if chosen_upgrade == null:
		return
	
	var has_upgrade = curr_upgrades.has(chosen_upgrade.id)
	
	if !has_upgrade:
		curr_upgrades[chosen_upgrade.id] = {
			"resource" : chosen_upgrade,
			"quantity" : 1
		}
	else:
		curr_upgrades[chosen_upgrade.id]["quantity"] += 1
		
	print(curr_upgrades)
