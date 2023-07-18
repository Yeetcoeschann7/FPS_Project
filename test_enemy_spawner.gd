extends Node3D

@onready var enemy_type = preload("res://enemies/test_enemy/test_enemy.tscn")
@onready var player = get_parent().get_node("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance3D.visible = false
	$spawn_timer.start()
	
func _process(_delta):
	pass

func _on_spawn_timer_timeout():
	if Score.enemyct < 200:
		call_deferred("add_child", enemy_type.instantiate())
		Score.enemyct += 1
		$spawn_timer.wait_time = randf_range(0.3, 1)
		$spawn_timer.start()
