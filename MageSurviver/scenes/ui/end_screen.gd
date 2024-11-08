extends CanvasLayer

@onready var restart_btn = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton
@onready var quit_btn = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton
@onready var title_label = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/TitleLabel
@onready var description_label = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/DescriptionLabel

func _ready():
	get_tree().paused = true
	restart_btn.pressed.connect(on_restart_pressed)
	quit_btn.pressed.connect(on_quit_pressed)

func set_defeat():
	title_label.text = "Defeat"
	description_label.text = "You Lost :("


func set_victory():
	title_label.text = "Victory"
	description_label.text = "You Win!"


func on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")

func on_quit_pressed():
	get_tree().quit()



