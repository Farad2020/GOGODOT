extends CharacterBody2D

const MAX_SPEED = 125

#Might Disable Accelaration later
const ACCELARATION_SMOOTHING = 25

var number_colliding_bodies = 0

@onready var damage_tick_rate = $DamageIntervalTimer

func _ready():
	$CollisionArea2D.body_entered.connect(on_body_entered)
	$CollisionArea2D.body_exited.connect(on_body_exited)
	damage_tick_rate.timeout.connect(on_damage_interval_timer_timeout)


func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	
	
	velocity = direction * MAX_SPEED
	
#	Code below enables acceleration
	#var target_velocity = direction * MAX_SPEED
	#velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELARATION_SMOOTHING))
	
	move_and_slide()


func get_movement_vector():
#	gets values from opposite coordinates of the movement input, and which is stronger
#	right and down directions are first, cuz they are positive in the screen coordinates field
	var x_movement = Input.get_action_strength("move_right") -  Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") -  Input.get_action_strength("move_up")
	
	return Vector2(x_movement, y_movement)


func check_deal_damage():
	if(number_colliding_bodies <= 0 || !damage_tick_rate.is_stopped()):
		return
	$HealthComponent.damage(1)
	damage_tick_rate.start()


func on_body_entered(otherBody: Node2D):
	number_colliding_bodies += 1
	
	check_deal_damage()

func on_body_exited(otherBody: Node2D):
	number_colliding_bodies -= 1
	

func on_damage_interval_timer_timeout(otherBody: Node2D):
	check_deal_damage()






