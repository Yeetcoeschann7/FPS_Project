extends Node3D

@onready var animplaying = false
@onready var bullets = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $AnimationPlayer.is_playing():
		animplaying = true
	else:
		animplaying = false
	if Input.is_action_pressed("reload") and !animplaying:
		$AnimationPlayer.play("reload")
		bullets = 6
