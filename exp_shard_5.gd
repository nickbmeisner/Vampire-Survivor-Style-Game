extends Area2D

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	const SPEED = 750
	var direction = global_position.direction_to(player.global_position)
	var distance = abs(player.global_position - global_position)
	if distance.length() < 300:
		position += direction * SPEED * delta

func _on_body_entered(body):
	queue_free()
	if body.has_method("gain_experience"):
		body.gain_experience(5)
		
