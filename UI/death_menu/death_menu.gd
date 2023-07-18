extends Control

var score = 0

func _ready():
	visible = true
	$ColorRect/restart.grab_focus()
	$ColorRect/score_label.text = "Score: " + str(Score.score)
	
func _on_quit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://levels/main_level.tscn");
