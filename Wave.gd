extends Area2D

var last_dir = Vector2(0,0)

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	if direction != Vector2(0,0):
		last_dir = direction
		look_at(direction * 10000000)
	
	else:
		look_at(last_dir * 10000000)


func shoot():
	const BULLET = preload("res://Wave_Bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation	
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
