extends Area2D

var travelled_distance = 0
var damage = 16
var knockback = 35

func _physics_process(delta):
	const SPEED = 800
	const RANGE = 600
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta

	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	if body.has_method("knock_back"):
		body.knock_back(knockback)
	
	if body.has_method("take_damage"):
		body.take_damage(damage)
		damage -= 2
		if damage <= 0:
			queue_free()
