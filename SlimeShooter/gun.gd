extends Area2D


func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	
	if(enemies_in_range.size() > 0):
		var enemy_to_target = enemies_in_range.front()
		look_at(enemy_to_target.global_position)


func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	
#	adds bullet child to shooting points, then bullet itself starts to trace itself forward
	%ShootingPoint.add_child(new_bullet)




func _on_timer_timeout():
	shoot()
