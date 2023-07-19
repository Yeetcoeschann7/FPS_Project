extends WorldEnvironment


# Called when the node enters the scene tree for the first time.
func _ready():
	if Score.fog == false:
		self.environment.volumetric_fog_enabled = false
	else:
		self.environment.volumetric_fog_enabled = true
	
	if Score.lights == false:
		self.environment.background_mode = Environment.BG_CLEAR_COLOR
	else:
		self.environment.background_mode = Environment.BG_CLEAR_COLOR
