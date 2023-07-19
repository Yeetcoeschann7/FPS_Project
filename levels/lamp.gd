extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Score.lights == false:
		$lamp_light.visible = false
	else:
		$lamp_light.visible = true
