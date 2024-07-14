extends CanvasLayer

@export var experience_manager: Node
@onready var progressBar = $MarginContainer/ProgressBar

func _ready():
	progressBar.value = 0.0
	experience_manager.experience_updated.connect(on_experience_updated)
	

func on_experience_updated(currentExp: float, targetExp: float):
# maybe add zero check
	var percent = currentExp / targetExp
	progressBar.value = percent
