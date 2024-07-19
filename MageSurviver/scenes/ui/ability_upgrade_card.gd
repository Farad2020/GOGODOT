extends PanelContainer

# might trigger future errors, but used $VBoxContainer, 
# 	instead of $%VBoxContainer, from 22nd lesson from 2nd section
@onready var nameLabel: Label = $VBoxContainer/NameLabel
@onready var descriptionLabel: Label = $VBoxContainer/DescriptionLabel

func set_ability_upgrade(upgrade: AbilityUpgrade):
	nameLabel.text = upgrade.name
	descriptionLabel.text = upgrade.description
