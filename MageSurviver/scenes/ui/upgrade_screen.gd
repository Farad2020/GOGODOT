extends CanvasLayer

signal upgrade_selected(upgrade: AbilityUpgrade)

@export var upgradeCardScene: PackedScene
@onready var cardContainer: HBoxContainer = $MarginContainer/CardContainer


func _ready():
	get_tree().paused = true
	

func set_ability_upgrades(upgrades: Array[AbilityUpgrade]):
	for upgr in upgrades:
		var cardInstance = upgradeCardScene.instantiate()
		cardContainer.add_child(cardInstance)
		cardInstance.set_ability_upgrade(upgr)
		cardInstance.selected.connect(on_upgrade_selected.bind(upgr))


func on_upgrade_selected(upgrade: AbilityUpgrade):
	upgrade_selected.emit(upgrade)
	get_tree().paused = false
	queue_free()
