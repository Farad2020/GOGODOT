extends Node

@onready var player = $Entities/Player
@export var end_screen: PackedScene

func _ready():
	player.health_component.died.connect(on_player_died)


func on_player_died():
	var end_screen_instance = end_screen.instantiate()
	add_child(end_screen_instance)
	end_screen_instance.set_defeat()
