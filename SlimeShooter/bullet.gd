extends Area2D

var travel_distance = 0

func _physics_process(delta):
	const SPEED = 1000
	const MAX_RANGE = 1200
	
# "Vector2.RIGHT.rotated(rotation)" -> gets direction where bullet is looking
	var direction = Vector2.RIGHT.rotated(rotation)
	
#  "delta" -> makes position frame-dependant
	position += direction * SPEED * delta
	
#	Clearing bullet on max range
	travel_distance += SPEED * delta
	if(travel_distance > MAX_RANGE):
		queue_free()
	


func _on_body_entered(body):
	queue_free()
	
	if( body.has_method("take_damage") ):
		body.take_damage()
