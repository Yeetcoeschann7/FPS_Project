extends Enemy

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var player_pos
var speed = 9

func _ready():
	var y = randf_range(1, 3)
	position.y = y
	$GPUParticles3D.emitting = false
	$collider.disabled = true
	$collider/MeshInstance3D.visible = false
	$OmniLight3D.visible = false
	HP = 5
	if Score.particles == false:
		$GPUParticles3D.emitting = false
	else:
		$GPUParticles3D.emitting = true
	if Score.lights == false:
		$OmniLight3D.visible = false
	else:
		$OmniLight3D.visible = true
	player_pos = player.position
	
	while not inside_box():
		var x = randf_range(player.position.x - 50, player.position.x + 50)
		var z = randf_range(player.position.z - 50, player.position.z + 50)
		y = randf_range(1, 3)
		position.x = x
		position.z = z
		position.y = y
	$spawn.play()
	$GPUParticles3D.emitting = true
	$collider.disabled = false
	$collider/MeshInstance3D.visible = true
	$OmniLight3D.visible = true

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

func inside_box():
	if global_position.x > -50 and global_position.x < 50 and global_position.z > -50 and global_position.z < 50:
		return true
	else:
		return false
