extends CharacterBody3D

@onready var gun = get_child(1).get_node("gun")

var SPEED = 10.0
const JUMP_VELOCITY = 5
var minLookAngle : float = -90.0
var maxLookAngle : float = 90.0
var lookSensitivity : float = 10
var mouseDelta = 0
var scl = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	# hide and lock the mouse cursor
	Engine.max_fps = 120
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 
	Score.score = 0 
	Score.enemyct = 0 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_pressed("focus"):
		SPEED = 5
	else:
		SPEED = 10
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("l_strafe", "r_strafe", "forward", "backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	# rotate the camera along the x axis
	$cam.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	# clamp camera x rotation axis
	$cam.rotation_degrees.x = clamp($cam.rotation_degrees.x, minLookAngle, maxLookAngle)
	# rotate the player along their y-axis
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	# reset the mouseDelta vector
	mouseDelta = Vector2()
	
	hitscan()
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
		
func hitscan():
	if $cam/crosshair/hitscan.is_colliding():
		var enemy = $cam/crosshair/hitscan.get_collider()
		if $cam/crosshair/hitscan.get_collider().is_in_group("enemy"):
			$cam/crosshair.mesh.material.albedo_color = Color(255, 255, 255)
			if Input.is_action_just_pressed("shoot") and !gun.animplaying and gun.bullets >= 1:
				enemy.take_damage()
		else:
			scl = 1
			$cam/crosshair.mesh.material.albedo_color = Color(0, 0, 255)
	else:
		$cam/crosshair.mesh.material.albedo_color = Color(0, 0, 255)
	if Input.is_action_just_pressed("shoot") and !gun.animplaying:
		if gun.bullets >= 1:
			$cam/laser.visible = true
			$cam/gun/laser_timer.start()
			$cam/gun/shoot.play()
			$cam/gun/shoot.pitch_scale += 0.1
			$cam/gun/AnimationPlayer.play("shoot")
			gun.bullets -= 1
		else:
			$cam/gun/click.play()


func _on_kill_box_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().change_scene_to_file("res://UI/death_menu/death_menu.tscn");


func _on_laser_timer_timeout():
	$cam/laser.visible = false
