extends Node3D

@onready var enemy_type = preload("res://enemies/spawners/enemy_spawner_1.tscn")
var wave_num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance3D.visible = false
	
func _on_wave_timer_timeout():
	print(wave_num)
	if wave_num == 0: # Wave 1
		var spawner = enemy_type.instantiate()
		spawn_spawner(Vector3i(0, 3, -30), spawner)
	elif wave_num == 1: # Wave 2
		var spawner = enemy_type.instantiate()
		spawn_spawner(Vector3i(-30, 3, -30), spawner)
		spawn_spawner(Vector3i(30, 3, 30), spawner)
		spawn_spawner(Vector3i(-30, 3, 30), spawner)
		spawn_spawner(Vector3i(30, 3, -30), spawner)
	elif wave_num == 2: # Wave 3
		var spawner = enemy_type.instantiate()
		spawn_spawner(Vector3i(0, 3, 30), spawner)
		spawn_spawner(Vector3i(-30, 3, 0), spawner)
		spawn_spawner(Vector3i(30, 3, 0), spawner)
	$wave_timer.wait_time += 5
	wave_num += 1
		
func spawn_spawner(pos, spawner):
	spawner = enemy_type.instantiate()
	spawner.set_global_position(pos)
	call_deferred("add_child", spawner)
