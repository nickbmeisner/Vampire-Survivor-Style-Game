extends Area2D

func shoot():
	const BULLET = preload("res://spray_bullet.tscn")
	var new_bullet_1 = BULLET.instantiate()
	var new_bullet_2 = BULLET.instantiate()
	var new_bullet_3 = BULLET.instantiate()
	var new_bullet_4 = BULLET.instantiate()
	
	new_bullet_1.global_position = %ShootingPoint.global_position
	new_bullet_2.global_position = %ShootingPoint2.global_position
	new_bullet_3.global_position = %ShootingPoint3.global_position
	new_bullet_4.global_position = %ShootingPoint4.global_position
	
	new_bullet_1.global_rotation = 4.711
	new_bullet_2.global_rotation = 0
	new_bullet_3.global_rotation = 1.570
	new_bullet_4.global_rotation = 3.141
	
	%ShootingPoint.add_child(new_bullet_1)
	%ShootingPoint.add_child(new_bullet_2)
	%ShootingPoint.add_child(new_bullet_3)
	%ShootingPoint.add_child(new_bullet_4)


func _on_timer_timeout():
	shoot()
