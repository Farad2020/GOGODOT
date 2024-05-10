extends Node
class_name HealthComponent

signal died


@export var MAX_HEALTH: float = 10
var current_health


func _ready():
	current_health = MAX_HEALTH

func damage(damage_amount: float):
	current_health = max(0, current_health - damage_amount)
	Callable(check_death).call_deferred()

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()
	
