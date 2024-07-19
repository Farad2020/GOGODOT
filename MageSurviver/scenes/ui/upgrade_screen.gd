extends CanvasLayer

@export var upgradeCardScene: PackedScene
@onready var cardContainer: HBoxContainer = $MarginContainer/CardContainer


func _ready():
	get_tree().paused = true
	

func set_ability_upgrades(upgrades: Array[AbilityUpgrade]):
	for upgr in upgrades:
		var cardInstance = upgradeCardScene.instantiate()
		cardContainer.add_child(cardInstance)
		cardInstance.set_ability_upgrade(upgr)
