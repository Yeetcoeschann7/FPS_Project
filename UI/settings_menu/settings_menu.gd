extends Control

func _on_button_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu/main_menu.tscn");

func _on_resolution_picker_item_selected(index):
	if index == 0:
		get_viewport().scaling_3d_scale = 1.50
	elif index == 1:
		get_viewport().scaling_3d_scale = 1
	elif index == 2:
		get_viewport().scaling_3d_scale = 0.75
	elif index == 3:
		get_viewport().scaling_3d_scale = 0.50

func _on_window_mode_picker_item_selected(index):
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func _on_fog_button_pressed():
	if $ColorRect/GridContainer/particle_button.button_down:
		Score.fog = false
	else:
		Score.fog = true
	print($ColorRect/GridContainer/particle_button.button_pressed)
	print(Score.fog)

func _on_particle_button_pressed():
	if $ColorRect/GridContainer/particle_button.button_down:
		Score.particles = false
	else:
		Score.particles = true

func _on_light_button_pressed():
	if $ColorRect/GridContainer/light_button.button_down:
		Score.lights = false
	else:
		Score.lights = true
