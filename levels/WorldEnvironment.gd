extends WorldEnvironment


# Called when the node enters the scene tree for the first time.
func _ready():
	if Score.lights == false:
		get_parent().get_child(0).visible = false
		self.environment.background_mode = Environment.BG_CLEAR_COLOR
		self.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	else:
		get_parent().get_child(0).visible = true
		self.environment.background_mode = Environment.BG_CLEAR_COLOR
		self.environment.ambient_light_source = Environment.AMBIENT_SOURCE_DISABLED
