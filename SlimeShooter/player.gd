extends CharacterBody2D

@onready var happy_boo = $HappyBoo

signal health_depleted

var health_points = 100.0


func _physics_process(delta):
#Should pass values in this order only!, also has 5th element
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	
	move_and_slide()
	
	if(velocity.length() > 0.0):
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()

	const DAMAGE_RATE = 25.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if(overlapping_mobs.size() > 0):
		health_points -= overlapping_mobs.size() * DAMAGE_RATE * delta
		%ProgressBar.value = health_points


		if(health_points <= 0.0):
			health_depleted.emit()
	
