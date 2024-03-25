extends Node2D

const MOB = preload("res://mob.tscn")
@onready var path_follow_2d = %PathFollow2D

func spawn_mob():
	var newMob = MOB.instantiate()
	path_follow_2d.progress_ratio = randf()
	
	newMob.global_position = path_follow_2d.global_position
	
	add_child(newMob)
	


func _on_timer_timeout():
	spawn_mob()

@onready var game_over = %GameOver

func _on_player_health_depleted():
	game_over.visible = true
	get_tree().paused = true
