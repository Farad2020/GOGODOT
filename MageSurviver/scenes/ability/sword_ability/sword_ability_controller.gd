extends Node

@export var sword_ability: PackedScene
const MAX_RANGE = 150

var base_wait_time
var damage = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	base_wait_time = $Timer.wait_time
	$Timer.timeout.connect(on_timer_time_out)
	GameEvents.ability_upgrade_added.connect(on_ability_upgrade_added)

func on_ability_upgrade_added(upgrade:AbilityUpgrade, curr_upgrades: Dictionary):
	if(upgrade.id != "sword_rate"):
		return
	
	var percent_reduction = curr_upgrades["sword_rate"]["quantity"] * .5
	$Timer.wait_time = base_wait_time * (1 - percent_reduction)
	$Timer.start()


func on_timer_time_out():
#   Prep player data
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
		
		
#   Prep enemies to in player range
	var enemies = get_tree().get_nodes_in_group("enemy")
	enemies = enemies.filter(
		func(enemy: Node2D): 
			return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE, 2)
	)
	
	if enemies.size() == 0:
		return
	
	
#   Sort Enemies to closests
	enemies.sort_custom(func(a: Node2D, b: Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		
		return a_distance < b_distance
	)
	
	
#	Placing the sword in the world
	var sword_instance = sword_ability.instantiate() as SwordAbility 
	var foreground_layer = get_tree().get_first_node_in_group("foreground_layer")
	foreground_layer.add_child(sword_instance)
	
	sword_instance.hitbox_component.damage = damage
	
	sword_instance.global_position = enemies[0].global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0, TAU)) * 4
	
#   Sword Direction

	
	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation =  enemy_direction.angle()
	
