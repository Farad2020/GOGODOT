extends Node


func _on_lvl_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_lvl_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
