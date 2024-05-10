extends Node

var current_exp = 0

func _ready():
	GameEvents.exp_vial_collected.connect(increment_exp)


func on_exp_vial_collected(number: float):
	increment_exp(number)


func increment_exp(number: float):
	current_exp += number
	print(current_exp)
	
