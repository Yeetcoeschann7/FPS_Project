extends Control

var is_paused = false : set = set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	if visible == true:
		$ColorRect/resume.grab_focus()

func _on_resume_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.is_paused = false

func _on_quit_pressed():
	self.is_paused = false
	get_tree().change_scene_to_file("res://UI/main_menu/main_menu.tscn");
