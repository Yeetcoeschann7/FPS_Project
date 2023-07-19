extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$play.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://levels/main_level.tscn");

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/settings_menu/settings_menu.tscn");
