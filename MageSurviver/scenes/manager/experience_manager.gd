extends Node

signal experience_updated(current_experience: float, target_experience: float)
signal level_up(new_level: int)

const TARGET_EXP_GROWTH = 5

var current_exp = 0
var current_level = 1
var target_experience = 1

func _ready():
	GameEvents.exp_vial_collected.connect(increment_exp)


func on_exp_vial_collected(number: float):
	increment_exp(number)


func increment_exp(number: float):
	current_exp = min(current_exp + number, target_experience)
	experience_updated.emit(current_exp, target_experience)
	
	if(current_exp == target_experience):
		current_level += 1
		target_experience += TARGET_EXP_GROWTH
		current_exp = 0
		experience_updated.emit(current_exp, target_experience)
		level_up.emit(current_level)
	
