extends CharacterBody2D

var health = 25
var speed = 175

@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
func take_damage(dmg):
	health -= dmg
	%Slime.play_hurt()
	
	if health <= 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		
		const EXP_SHARD_1 = preload("res://exp_shard_1.tscn")
		const EXP_SHARD_5 = preload("res://exp_shard_5.tscn")
		
		var experience = EXP_SHARD_1.instantiate()
		
		if (randi() % 51) > 48:
			experience = EXP_SHARD_5.instantiate()
			
		get_parent().add_child(experience)
		experience.global_position = global_position

func knock_back(knck):
		var direction = global_position.direction_to(player.global_position)
		global_position = global_position - (direction * knck) 
