extends CharacterBody3D

@onready var enemy_type = preload("res://enemies/test_enemy/test_enemy.tscn")
@onready var spawn_ct = 6
@onready var player = get_parent().get_parent().get_node("player")
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var player_pos
var speed = 5
var HP = 15
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Score.enemyct += 1
	$spawn_timer.start()
	$spawn.play()
		
func _physics_process(_delta):
	# Check if HP == 0
	check_for_die()
	move_and_slide()

func _on_spawn_timer_timeout():
	if Score.enemyct < 200 and spawn_ct > 0 and not dead:
		var enemy = enemy_type.instantiate()
		call_deferred("add_child", enemy)
		Score.enemyct += 1
		spawn_ct -= 1
		$spawn_timer.start()
	elif spawn_ct <= 0:
		$wave_timer.start()

func _on_wave_timer_timeout():
	spawn_ct = 10
	$spawn_timer.start()
	
func check_for_die():
	if HP <= 0 and not dead:
		Score.score += 10
		Score.enemyct -= 1
		$collider/MeshInstance3D.mesh.material.emission = Color(255, 255, 255)
		$collider.disabled = true
		$collider/MeshInstance3D.visible = false
		dead = true

func take_damage(dmg):
	HP -= dmg
	$dmg_timer.start()
	$collider/MeshInstance3D.mesh.material.emission = Color(255, 255, 255)

func _on_dmg_timer_timeout():
	$collider/MeshInstance3D.mesh.material.emission = Color(0, 0, 0)
