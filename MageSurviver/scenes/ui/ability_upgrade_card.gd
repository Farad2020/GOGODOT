extends PanelContainer

signal selected

# might trigger future errors, but used $VBoxContainer, 
# 	instead of $%VBoxContainer, from 22nd lesson from 2nd section
@onready var nameLabel: Label = $VBoxContainer/NameLabel
@onready var descriptionLabel: Label = $VBoxContainer/DescriptionLabel

func _ready():
	gui_input.connect(on_gui_input)

func set_ability_upgrade(upgrade: AbilityUpgrade):
	nameLabel.text = upgrade.name
	descriptionLabel.text = upgrade.description


func on_gui_input(event: InputEvent):
	if(event.is_action_pressed("left_click")):
		selected.emit()
	
