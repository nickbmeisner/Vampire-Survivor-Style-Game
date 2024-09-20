extends Area2D

var d = 0
var anchor = 0
var damage = 13
var speed = 0.03
var range = 250

func _physics_process(delta):
	
	d+= speed
	
	position = (Vector2(sin(d) * range , cos(d) * range) + anchor)

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
