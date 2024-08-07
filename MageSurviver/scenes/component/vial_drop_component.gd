extends Node

@export_range(0, 1) var drop_percent: float = 0.5
@export var health_component: Node
@export var exp_vial: PackedScene

func _ready():
	(health_component as HealthComponent).died.connect(on_died)
	
	
func on_died():
	if randf() >= drop_percent:
		return
	
	if exp_vial == null:
		return
		
	if not owner is Node2D:
		return
	
	var new_exp_vial = exp_vial.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	
	if(entities_layer == null):
		return
		
	entities_layer.add_child(new_exp_vial)
	new_exp_vial.global_position = (owner as Node2D).global_position
