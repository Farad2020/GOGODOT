extends CharacterBody2D

var healthPoints = 3
@onready var player = $"../Player"


@onready var slime = %Slime

func _ready():
	slime.play_walk()
	
	
func _physics_process(delta):
#global_position is vector
	var direction = global_position.direction_to(player.global_position)
	
	velocity = direction * 300
	
	move_and_slide()
	
	
func take_damage():
	healthPoints -= 1
	slime.play_hurt()
	
	if(healthPoints == 0 ):
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
#FIRST add the view
		get_parent().add_child(smoke)
# THEN reposition it
		smoke.global_position = global_position
