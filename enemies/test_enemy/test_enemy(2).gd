extends Enemy

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var player_pos
var speed = 5

func _ready():
	HP = 5

func _physics_process(_delta):
	# Check if HP == 0
	check_for_die()
	move_and_slide()
