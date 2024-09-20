extends CharacterBody2D

signal health_depleted
signal level_up

var available_weapons = ["gun", "wave", "spin", "spray"]
var current_weapons = Array()
var start_wep = available_weapons.pick_random()
@onready var health_bar = get_node("/root/Game/ScreenInfo/HealthBar")
@onready var exp_bar = get_node("/root/Game/ScreenInfo/ExpBar")
@onready var level_label = get_node("/root/Game/ScreenInfo/LevelLabel")

var speed = 500
var health = 40.0
var level = 1
var exp_scaling = 1
var exp_required = 5
var current_exp = 0
var direction


func _ready():
	add_weapon(start_wep)


func _physics_process(delta):
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5
	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -=DAMAGE_RATE * overlapping_mobs.size() * delta
		health_bar.value = health
		if health <= 0.0:
			health_depleted.emit()


func gain_experience(exp):
	current_exp += exp
	while current_exp >= exp_required:
		level += 1
		level_up.emit()
		increase_level()
	exp_bar.max_value = exp_required
	exp_bar.value = current_exp
	
	
func add_weapon(wep):
	current_weapons.append(wep)
	var weapon = load("res://" + wep + ".tscn")
	var new_weapon = weapon.instantiate()
	self.add_child(new_weapon)
	available_weapons.erase(wep)

func increase_level():
	level_label.text = "Lvl " + str(level)
	if level % 10 == 0:
		exp_scaling += 0.5
	current_exp -= exp_required
	exp_required += (10 * exp_scaling)
