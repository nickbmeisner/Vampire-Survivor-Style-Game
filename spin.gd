extends Area2D

var bullet_1
var bullet_2
var bullet_3
var bullet_4

func start():
	const BULLET = preload("res://spin_bullet.tscn")
	bullet_1 = BULLET.instantiate()
	bullet_2 = BULLET.instantiate()
	bullet_3 = BULLET.instantiate()
	bullet_4 = BULLET.instantiate()
	
	bullet_1.d = 0
	bullet_2.d = 1.570
	bullet_3.d = 3.141
	bullet_4.d = 4.711
	
	self.add_child(bullet_1)
	self.add_child(bullet_2)
	self.add_child(bullet_3)
	self.add_child(bullet_4)


func _ready():
	start()

func _physics_process(delta):
	bullet_1.anchor = %CollisionShape2D.global_position
	bullet_2.anchor = %CollisionShape2D.global_position
	bullet_3.anchor = %CollisionShape2D.global_position
	bullet_4.anchor = %CollisionShape2D.global_position
