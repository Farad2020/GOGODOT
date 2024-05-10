extends CharacterBody2D

const MAX_SPEED = 125

#Might Disable Accelaration later
const ACCELARATION_SMOOTHING = 25

# Called when the node enters the scene tree for the first time.
 #And All children are ready
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
