extends Node

@export var upgrade_pool: Array[AbilityUpgrade]
@export var experience_manager: Node
@export var upgradeScreenScene: PackedScene

var curr_upgrades = {}

func _ready():
	experience_manager.level_up.connect(on_level_up)


func on_level_up(new_level: int):
	var chosen_upgrade = upgrade_pool.pick_random() as AbilityUpgrade
	if chosen_upgrade == null:
		return
		
	var upgradeScreen = upgradeScreenScene.instantiate()
	add_child(upgradeScreen)
	upgradeScreen.set_ability_upgrades([chosen_upgrade] as Array[AbilityUpgrade])
	
	
	
	

func apply_upgrade(upgrade: AbilityUpgrade):
	var has_upgrade = curr_upgrades.has(upgrade.id)
	
	if !has_upgrade:
		curr_upgrades[upgrade.id] = {
			"resource" : upgrade,
			"quantity" : 1
		}
	else:
		curr_upgrades[upgrade.id]["quantity"] += 1
