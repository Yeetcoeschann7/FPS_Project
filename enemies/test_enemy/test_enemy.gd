extends Enemy

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var player_pos
var target_pos
var speed = 3

func _ready():
		if Score.particles == false:
			$GPUParticles3D.emitting = false
		else:
			$GPUParticles3D.emitting = true
		if Score.lights == false:
			$OmniLight3D.visible = false
		else:
			$OmniLight3D.visible = true
		player_pos = player.position
		var x = randf_range(player.position.x - 40, player.position.x + 40)
		var z = randf_range(player.position.z - 40, player.position.z + 40)
		var y = randf_range(1, 3)
		position.x = x
		position.z = z
		position.y = y
		if position.distance_to(player_pos) < 15:
			Score.enemyct -= 1
			queue_free()
		$spawn.play()

func _physics_process(_delta):
	# Check if HP == 0
	check_for_die()
	
	if !$step.playing:
		$step.play()
	
	# Follow player
	player_pos = player.position
	var direction = global_position.direction_to(player_pos)
	
	if position.distance_to(player_pos) != 0:
		velocity = direction * speed
		move_and_slide()
		look_at(player_pos)
