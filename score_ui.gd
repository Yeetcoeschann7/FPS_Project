extends Control

@onready var gun = get_parent().get_child(1).get_child(1).get_node("gun")


# Called when the node enters the scene tree for the first time.
func _ready():
	$score_label/score.text = str(Score.score)
	$ammo_label/ammo.text = str(gun.bullets)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$score_label/score.text = str(Score.score)
	$ammo_label/ammo.text = str(gun.bullets)
	
