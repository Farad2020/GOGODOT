extends Node
class_name HealthComponent

signal died
signal health_changed


@export var MAX_HEALTH: float = 10
var current_health


func _ready():
	current_health = MAX_HEALTH

func damage(damage_amount: float):
	current_health = max(0, current_health - damage_amount)
	health_changed.emit()
	Callable(check_death).call_deferred()


func get_health_percent():
	if MAX_HEALTH <= 0:
		return 0
		
	return min(current_health / MAX_HEALTH, 1)


func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()
	














